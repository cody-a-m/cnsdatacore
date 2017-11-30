function Result = ProcessAnatomicalImage_spm12(varargin)
%processes anatomical images using an spm12 batch 
%(AnatomicalProcess_spm12). Output is placed in
%a subfolder (/spm12) within the subject's folders (NIFTI, DOCS). Three
%main products are produced: y*.nii which contains the deformation field to
%be used in coregistration; ws*.nii which contains the normalized
%structural; and Brain.nii which is calculated from the c1, c2, c3 images
%and is used in coregistration.


[Conn, IDs, Options] = ParseArgs(struct('caller', 'ProcessAnatomicalImage'), varargin{:});
StudyImageID = IDs(end);

if ~exist(['/data/RAWDATA/' num2str(StudyImageID)], 'dir')
    Result = 'No File Record';
    return;
end

if ~exist(['/data/NIFTI/' num2str(StudyImageID) '/spm12'], 'dir')
    unix(['mkdir /data/NIFTI/' num2str(StudyImageID) '/spm12']);
end

if ~exist(['/data/DOC/' num2str(StudyImageID) '/spm12'], 'dir')
    unix(['mkdir /data/DOC/' num2str(StudyImageID) '/spm12']);
end

CheckFiles = dir(['/data/NIFTI/' num2str(StudyImageID) '/spm12']);
CheckFileNames = {CheckFiles.name}';
ConvertedFiles = regexp(CheckFileNames, '^s.*\.nii', 'match');
ConvertedFiles = [ConvertedFiles{:}]';
ProcessStartedFiles = regexp(CheckFileNames, '^ms.*\.nii', 'match');
ProcessStartedFiles = [ProcessStartedFiles{:}]';
ProcessEndedFiles = regexp(CheckFileNames, '^ws.*\.nii', 'match');
ProcessEndedFiles = [ProcessEndedFiles{:}]';

QCSession = fetch(Conn, ['SELECT QCSessionID FROM QCSessions WHERE StudyImageID =' num2str(StudyImageID) ';']);
if isempty(QCSession)
    fastinsert(Conn, 'QCSessions', {'StudyImageID'}, {StudyImageID});
    QCSession = fetch(Conn, 'SELECT LAST_INSERT_ID() AS QCSessionID');
end

QCAnswer = fetch(Conn, ['CALL getQCAnswerByStudyImageQCQuestion(' num2str(StudyImageID) ', 86);']);
if isempty(QCAnswer)
    fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID'}, {QCSession{1,1}, 188});
    QCAnswer = fetch(Conn, 'SELECT LAST_INSERT_ID() AS QCAnswerID, 188 AS QCChoiceID');
end

NeedsConvert = true;
NeedsProcess = true;
NeedsMove = false;

if ~isempty(ProcessEndedFiles) %FS indicates processing has occured
    if QCAnswer{1,2} == 191 %DB also indicates processing has occured : no changes needed
        NeedsConvert = false;
        NeedsProcess = false;
    elseif ismember(QCAnswer{1,2}, [189,190]) %DB indicates Conversion/Processing failure : clean out FS before continuing
        NeedsMove = true;
    else %DB has no knowledge of Conversion/Processing stage : update DB to Processing Pass state
        exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 191 WHERE QCAnswerID = ' num2str(QCAnswer{1,1}) ';']);
        NeedsConvert = false;
        NeedsProcess = false;
    end
elseif ~isempty(ProcessStartedFiles) %FS indicates that some, but not all processing has occured (interpret as processing failure)
    NeedsMove = true; %Clean out FS before continuing
elseif ~isempty(ConvertedFiles) %FS indicates that conversion has occured, but not any processing
    if QCAnswer{1,2} == 189 %DB indicates a conversion failure : clean out FS before continuing
        NeedsMove = true;
    else %DB does not indicate a conversion failure : do not convert, but do process
        NeedsConvert = false;
    end
end

if NeedsMove
    unix(['mkdir -p /data/NIFTI/' num2str(StudyImageID) '/spm12/Failed/' date]);
    AllNiftis = regexp(CheckFileNames, '.*\.nii', 'match');
    AllNiftis = [AllNiftis{:}]';
    for i = 1:length(AllNiftis)
        unix(['mv /data/NIFTI/' num2str(StudyImageID) '/spm12/' AllNiftis{i} ' /data/NIFTI/' num2str(StudyImageID) '/spm12/Failed/' date '/']);
    end
end

if NeedsConvert || NeedsProcess
    spm_jobman('initcfg');
    RawFiles = dir(['/data/RAWDATA/' num2str(StudyImageID)]);
    RawFileNames = {RawFiles(3:end).name}';
    RawFullPaths = strcat(['/data/RAWDATA/' num2str(StudyImageID) '/'], RawFileNames);
end

if NeedsConvert
    
        UXRes = unix(['/usr/local/imaging/bxh_xcede_tools/bin/bxh2analyze -b -s --nii ' RawFullPaths{1} ' /data/NIFTI/' num2str(StudyImageID) '/spm12/s' RawFileNames{1}]);
        if UXRes ~= 0
            exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 189, Comments ="Failed bxh2analyze" WHERE QCAnswerID = ' num2str(QCAnswer{1,1}) ';']);
            Result = 'Failed Conversion';
            return;
        end
end
if NeedsProcess
    CheckFiles = dir(['/data/NIFTI/' num2str(StudyImageID) '/spm12']);
    CheckFileNames = {CheckFiles.name}';
    ConvertedFiles = regexp(CheckFileNames, '^s.*\.nii', 'match');
    ConvertedFiles = [ConvertedFiles{:}]';
    ConvertedFullPaths = strcat(['/data/NIFTI/' num2str(StudyImageID) '/spm12/'], ConvertedFiles);
    load /home/ndplab/ToolboxExtend/CNS/QCBox3/SPMTemplates/AnatomicalProcess_spm12
    %matlabbatch{1,1}.spm.spatial.preproc.channel.vols = ConvertedFullPaths;
    matlabbatch{1,1}.cfg_basicio.file_dir.file_ops.cfg_named_file.files{1,1} = ConvertedFullPaths;
    
    save(['/data/DOC/' num2str(StudyImageID) '/spm12/SPMAnatProcess' date '_' num2str(int8(cputime))], 'matlabbatch');
    try
        spm_jobman('run', matlabbatch);
        exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 191 WHERE QCAnswerID = ' num2str(QCAnswer{1,1}) ';']);
        Result = 'Success';
        return;
    catch e
        exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 190, Comments ="' e.message '" WHERE QCAnswerID = ' num2str(QCAnswer{1,1}) ';']);
        Result = 'Failed Processing';
        return;
    end
else
    Result = 'Already Processed';
    return;
end

end

