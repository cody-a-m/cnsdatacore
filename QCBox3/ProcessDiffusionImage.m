function Result = ProcessDiffusionImage(varargin)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[Conn, IDs, Options] = ParseArgs(struct('caller', 'ProcessDiffusionImage'), varargin{:});
StudyImageID = IDs(end);

if ~exist(['/data/RAWDATA/' num2str(StudyImageID)], 'dir')
    Result = 'No File Record';
    return
end

if ~exist(['/data/NIFTI/' num2str(StudyImageID)], 'dir')
    unix(['mkdir /data/NIFTI/' num2str(StudyImageID)]);
end
if ~exist(['/data/TRK/' num2str(StudyImageID)], 'dir')
    unix(['mkdir /data/TRK/' num2str(StudyImageID)]);
end
if ~exist(['/data/DOC/' num2str(StudyImageID)], 'dir')
    unix(['mkdir /data/DOC/' num2str(StudyImageID)]);
end

CheckFiles = dir(['/data/NIFTI/' num2str(StudyImageID)]);
CheckFileNames = {CheckFiles.name}';
ConvertedFiles = regexp(CheckFileNames, '^rawdwi\.nii$', 'match');
ConvertedFiles = [ConvertedFiles{:}]';
ProcessStartedFiles = regexp(CheckFileNames, '^dti_gradient\.txt$', 'match');
ProcessStartedFiles = [ProcessStartedFiles{:}]';
EddyCorrFiles = regexp(CheckFileNames, '^erawdwi\.ecclog$', 'match');
EddyCorrFiles = [EddyCorrFiles{:}]';
% SPMFiles = regexp(CheckFileNames, '^cdti_fa\.nii$');
% SPMFiles = [SPMFiles{:}]';
TRKCheckFiles = dir(['/data/TRK/' num2str(StudyImageID)]);
TRKCheckFileNames = {TRKCheckFiles.name}';
ProcessEndedFiles = regexp(TRKCheckFileNames, '^dti\.trk$', 'match');
ProcessEndedFiles = [ProcessEndedFiles{:}]';

QCSession = fetch(Conn, ['SELECT QCSessionID FROM QCSessions WHERE StudyImageID =' num2str(StudyImageID) ';']);
if isempty(QCSession)
    fastinsert(Conn, 'QCSessions', {'StudyImageID'}, {StudyImageID});
    QCSession = fetch(Conn, 'SELECT LAST_INSERT_ID() AS QCSessionID');
end

QCAnswer = fetch(Conn, ['CALL getQCAnswerByStudyImageQCQuestion(' num2str(StudyImageID) ', 88);']);
if isempty(QCAnswer)
    fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID'}, {QCSession{1,1}, 505});
    QCAnswer = fetch(Conn, 'SELECT LAST_INSERT_ID() AS QCAnswerID, 505 AS QCChoiceID');
end
NeedsConvert = true;
NeedsProcess = true;
NeedsMove = false;
NeedsEddy = false;
MissingInfo = false;

if ~isempty(ProcessEndedFiles) %FS indicates processing has occured
    if QCAnswer{1,2} == 508 %DB also indicates processing has occured : no changes needed
        NeedsConvert = false;
        NeedsProcess = false;
    elseif ismember(QCAnswer{1,2}, [506,507]) %DB indicates Conversion/Processing failure : clean out FS before continuing
        NeedsMove = true;
    else %DB has no knowledge of Conversion/Processing stage : update DB to Processing Pass state
        exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 508 WHERE QCAnswerID = ' num2str(QCAnswer{1,1}) ';']);
        NeedsConvert = false;
        NeedsProcess = false;
    end
elseif ~isempty(ProcessStartedFiles) %FS indicates that some, but not all processing has occured (interpret as processing failure)
    NeedsMove = true; %Clean out FS before continuing
elseif ~isempty(ConvertedFiles) %FS indicates that conversion has occured, but not any processing
    if QCAnswer{1,2} == 506 %DB indicates a conversion failure : clean out FS before continuing
        NeedsMove = true;
    else %DB does not indicate a conversion failure : do not convert, but do process
        NeedsConvert = false;
    end
end

if isempty(EddyCorrFiles)
    NeedsEddy = true;
end

if NeedsMove
    unix(['mkdir -p /data/NIFTI/' num2str(StudyImageID) '/Failed/' date]);
    unix(['mkdir -p /data/TRK/' num2str(StudyImageID) '/Failed/' date]);
    AllNiftis = regexp(CheckFileNames, '.*\.(nii|bval|bvec|txt)', 'match');
    AllNiftis = [AllNiftis{:}]';
    for i = 1:length(AllNiftis)
        unix(['mv /data/NIFTI/' num2str(StudyImageID) '/' AllNiftis{i} ' /data/NIFTI/' num2str(StudyImageID) '/Failed/' date '/']);
    end
    AllTracks = regexp(TRKCheckFileNames, '.*\.(trk|log)', 'match');
    AllTracks = [AllTracks{:}]';
    for i = 1:length(AllTracks)
        unix(['mv /data/TRK/' num2str(StudyImageID) '/' AllTracks{i} ' /data/TRK/' num2str(StudyImageID) '/Failed/' date '/']);
    end
end

if NeedsProcess || NeedsEddy
    CoregStudyImage = fetch(Conn, [... %Is there a computer-determined anatomical?
        'SELECT NumericData, QCAnswerID, NumericData '...
        'FROM QCAnswerInfo '...
        'WHERE QCSessionID = ' num2str(QCSession{1,1}) ' '...
        'AND QCChoiceID = 524']);
    if isempty(CoregStudyImage) %NO - Is there a user-input-verified anatomical?
        CoregStudyImage = fetch(Conn, [...
            'SELECT NumericData, QCAnswerID '...
            'FROM QCAnswerInfo '...
            'WHERE QCSessionID = ' num2str(QCSession{1,1}) ' '...
            'AND QCChoiceID = 526']);
        if isempty(CoregStudyImage) %NO - Is there a user-input-requested anatomical?
            CoregStudyImage = fetch(Conn, [... 
                'SELECT NumericData, QCAnswerID, StudyImageInfo.ModalityID, QCAnswerInfo.SubjectID, StudyImageInfo.SubjectID '...
                'FROM QCAnswerInfo '...
                'LEFT JOIN StudyImageInfo ON QCAnswerInfo.NumericData = StudyImageInfo.StudyImageID '...
                'WHERE QCSessionID = ' num2str(QCSession{1,1}) ' '...
                'AND QCChoiceID = 525']);
            if isempty(CoregStudyImage) %NO - Is there a unique anatomical for the scan session?
                CoregStudyImage = fetch(Conn, [... 
                    'SELECT StudyImageID ' ...
                    'FROM StudyImages ' ...
                    'LEFT JOIN Images ON StudyImages.ImageID = Images.ImageID ' ...
                    'INNER JOIN (SELECT ScanSessionID FROM StudyImages LEFT JOIN Images ON StudyImages.ImageID = Images.ImageID WHERE StudyImageID = ' num2str(StudyImageID) ') AS ScanSessionOfStudyImage ON Images.ScanSessionID = ScanSessionOfStudyImage.ScanSessionID ' ...
                    'LEFT JOIN Sequences ON Images.SequenceID = Sequences.SequenceID ' ...
                    'WHERE Sequences.ModalityID = 2']);
                if size(CoregStudyImage, 1) ~= 1 %NO
                    %INSERT a request for user-input
                    fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID'}, {QCSession{1,1}, 525});
                    %Set the flag to NOT continue into processing
                    MissingInfo = true;
                else %YES
                    %INSERT that anatomical as a computer-determined value
                    fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'NumericData', 'QCChoiceID'}, {QCSession{1,1}, CoregStudyImage{1,1}, 524});
                end
            else %YES - Is the user input valid?
                if CoregStudyImage{1,3} ~=2 %NO, it is of a non-anatomical modality
                    %Unset the user input
                    exec(Conn, ['UPDATE QCAnswers SET NumericData = NULL WHERE QCAnswerID =' num2str(CoregStudyImage{1,2})]);
                    %Set the flag to NOT continue into processing
                    MissingInfo = true;
                elseif CoregStudyImage{1,4} ~= CoregStudyImage{1,5} %NO, it is of another subject
                    %Unset the user input
                    exec(Conn, ['UPDATE QCAnswers SET NumericData = NULL WHERE QCAnswerID =' num2str(CoregStudyImage{1,2})]);
                    %Set the flag to NOT continue into processing
                    MissingInfo = true;
                else %YES
                    %Set the input to verified
                    exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 526 WHERE QCAnswerID =' num2str(CoregStudyImage{1,2})]);
                end
            end
        else %YES - Use this value
        end
    else %YES - Use this value
    end

    if ~isempty(CoregStudyImage)
        if ~isempty(CoregStudyImage{1})
            CoregFiles = dir(['/data/NIFTI/' num2str(CoregStudyImage{1,1})]);
            CoregFileNames = {CoregFiles.name}';
            AnatFile = regexp(CoregFileNames, '^s.*\.nii', 'match');
            AnatFile = [AnatFile{:}]';
            if isempty(AnatFile)
                MissingInfo = true;
            else
                AnatFullPath = ['/data/NIFTI/' num2str(CoregStudyImage{1,1}) '/' AnatFile{1,1}];
            end
        end
    end
end

if NeedsConvert
    [~, result] = unix(['dticonvert.sh ' num2str(StudyImageID)]);
    if strcmp(result(1:5), 'error')
        exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 506, Comments ="dticonvert.sh error" WHERE QCAnswerID = ' num2str(QCAnswer{1,1}) ';']);
        Result = 'Failed Conversion';
        return;
    end
end

if NeedsProcess
    [~, result] = unix(['dtiprocess.sh ' num2str(StudyImageID)]);
    if strcmp(result(1:5), 'error')
        exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 507, Comments ="dtiprocess.sh error" WHERE QCAnswerID = ' num2str(QCAnswer{1,1}) ';']);
        Result = 'Failed Conversion';
        return;
    else
        exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 508 WHERE QCAnswerID = ' num2str(QCAnswer{1,1}) ';']);
        Result = 'Success';
    end
else
    Result = 'Already Processed';
end

if NeedsEddy && ~MissingInfo
    if exist(['/data/NIFTI/' num2str(StudyImageID) '/dti_gradient.txt'], 'file')
        Gradients = textscan(fopen(['/data/NIFTI/' num2str(StudyImageID) '/dti_gradient.txt']), '%f%f%f');
        Gradients = [Gradients{:}];
        BIdx = find(all(Gradients ~= 0, 2), 1);
%        unix(['eddy_correct /data/NIFTI/' num2str(StudyImageID) '/rawdwi.nii /data/NIFTI/' num2str(StudyImageID) '/erawdwi.nii ' num2str(BIdx)]);
    end
%     try
%         RawNII = spm_vol(['/data/NIFTI/' num2str(StudyImageID) '/rawdwi.nii']);
%         if length(RawNII) > 1
%             ConvertedFiles = cellstr(strcat(['/data/NIFTI/' num2str(StudyImageID) '/rawdwi.nii,'], num2str((1:length(RawNII))')));
%             spm_jobman('initcfg');
%             load /home/ndplab/ToolboxExtend/CNS/QCBox3/SPMTemplates/DTISPMProcess
%             matlabbatch{1,1}.spm.spatial.realign.estwrite.data{1,1} = ConvertedFiles;
%             matlabbatch{1,2}.spm.spatial.coreg.estimate.ref = {AnatFullPath};
%             if exist(['/data/NIFTI/' num2str(StudyImageID) '/dti_adc.nii'], 'file') && exist(['/data/NIFTI/' num2str(StudyImageID) '/dti_fa.nii'], 'file')
%                 unix(['cp /data/NIFTI/' num2str(StudyImageID) '/dti_adc.nii /data/NIFTI/' num2str(StudyImageID) '/cdti_adc.nii']);
%                 unix(['cp /data/NIFTI/' num2str(StudyImageID) '/dti_fa.nii /data/NIFTI/' num2str(StudyImageID) '/cdti_fa.nii']);
%                 matlabbatch{1,3} = matlabbatch{1,2};
%                 matlabbatch{1,3}.spm.spatial.coreg.estimate.other = {...
%                     ['/data/NIFTI/' num2str(StudyImageID) '/cdti_adc.nii'];...
%                     ['/data/NIFTI/' num2str(StudyImageID) '/cdti_fa.nii']};
%             end
%             save(['/data/DOC/' num2str(StudyImageID) '/SPMDTIProcess' date '_' num2str(int8(cputime))], 'matlabbatch');
%             spm_jobman('run', matlabbatch);
%         end
%     end
end

end

