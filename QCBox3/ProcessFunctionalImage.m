function Result = ProcessFunctionalImage(varargin)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[Conn, IDs, Options] = ParseArgs(struct('caller', 'ProcessFunctionalImage'), varargin{:});
StudyImageID = IDs(end);

if ~exist(['/data/RAWDATA/' num2str(StudyImageID)], 'dir')
    Result = 'No File Record';
    return
end

if ~exist(['/data/NIFTI/' num2str(StudyImageID)], 'dir')
    unix(['mkdir /data/NIFTI/' num2str(StudyImageID)]);
end
% if ~exist(['/data/CONN/' num2str(StudyImageID)], 'dir')
%     unix(['mkdir /data/CONN/' num2str(StudyImageID)]);
% end
if ~exist(['/data/DOC/' num2str(StudyImageID)], 'dir')
    unix(['mkdir /data/DOC/' num2str(StudyImageID)]);
end

CheckFiles = dir(['/data/NIFTI/' num2str(StudyImageID)]);
CheckFileNames = {CheckFiles.name}';
ConvertedFiles = regexp(CheckFileNames, '^f.*\.nii', 'match');
ConvertedFiles = [ConvertedFiles{:}]';
ProcessStartedFiles = regexp(CheckFileNames, '^af.*\.nii', 'match');
ProcessStartedFiles = [ProcessStartedFiles{:}]';
% NormalizedFiles = regexp(CheckFileNames, '^wraf.*\.nii', 'match');
% NormalizedFiles = [NormalizedFiles{:}]';
ProcessEndedFiles = regexp(CheckFileNames, '^s.?wraf.*\.nii', 'match');
ProcessEndedFiles = [ProcessEndedFiles{:}]';

QCSession = fetch(Conn, ['SELECT QCSessionID FROM QCSessions WHERE StudyImageID =' num2str(StudyImageID) ';']);
if isempty(QCSession)
    fastinsert(Conn, 'QCSessions', {'StudyImageID'}, {StudyImageID});
    QCSession = fetch(Conn, 'SELECT LAST_INSERT_ID() AS QCSessionID');
end

QCAnswer = fetch(Conn, ['CALL getQCAnswerByStudyImageQCQuestion(' num2str(StudyImageID) ', 87);']);
if isempty(QCAnswer)
    fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID'}, {QCSession{1,1}, 192});
    QCAnswer = fetch(Conn, 'SELECT LAST_INSERT_ID() AS QCAnswerID, 192 AS QCChoiceID');
end

% ConnAnswer = fetch(Conn, ['CALL getQCAnswerByStudyImageQCQuestion(' num2str(StudyImageID) ', 154);']);
% if isempty(ConnAnswer)
%     QCSession = fetch(Conn, ['SELECT QCSessionID FROM QCSessions WHERE StudyImageID =' num2str(StudyImageID) ';']);
%     if isempty(QCSession)
%         fastinsert(Conn, 'QCSessions', {'StudyImageID'}, {StudyImageID});
%         QCSession = fetch(Conn, 'SELECT LAST_INSERT_ID() AS QCSessionID');
%     end
%     fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID'}, {QCSession{1,1}, 509});
%     ConnAnswer = fetch(Conn, 'SELECT LAST_INSERT_ID() AS QCAnswerID, 509 AS QCChoiceID');
% end

NeedsConvert = true;
NeedsProcess = true;
NeedsMove = false;
MissingInfo = false;
%NeedsConnect = Options.connect;

if ~isempty(ProcessEndedFiles) %FS indicates processing has occured
    if QCAnswer{1,2} == 195 %DB also indicates processing has occured : no changes needed
        NeedsConvert = false;
        NeedsProcess = false;
    elseif ismember(QCAnswer{1,2}, [193,194]) %DB indicates Conversion/Processing failure : clean out FS before continuing
        NeedsMove = true;
    else %DB has no knowledge of Conversion/Processing stage : update DB to Processing Pass state
        exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 195 WHERE QCAnswerID = ' num2str(QCAnswer{1,1}) ';']);
        NeedsConvert = false;
        NeedsProcess = false;
    end
elseif ~isempty(ProcessStartedFiles) %FS indicates that some, but not all processing has occured (interpret as processing failure)
    NeedsMove = true; %Clean out FS before continuing
elseif ~isempty(ConvertedFiles) %FS indicates that conversion has occured, but not any processing
    if QCAnswer{1,2} == 193 %DB indicates a conversion failure : clean out FS before continuing
        NeedsMove = true;
    else %DB does not indicate a conversion failure : do not convert, but do process
        NeedsConvert = false;
    end
end

if NeedsMove
    unix(['mkdir -p /data/NIFTI/' num2str(StudyImageID) '/Failed/' date]);
    AllNiftis = regexp(CheckFileNames, '.*\.nii', 'match');
    AllNiftis = [AllNiftis{:}]';
    for i = 1:length(AllNiftis)
        unix(['mv /data/NIFTI/' num2str(StudyImageID) '/' AllNiftis{i} ' /data/NIFTI/' num2str(StudyImageID) '/Failed/' date '/']);
    end
end

if NeedsConvert || NeedsProcess
    spm_jobman('initcfg');
    RawFiles = dir(['/data/RAWDATA/' num2str(StudyImageID)]);
    RawFileNames = {RawFiles(3:end).name}';
    RawFullPaths = strcat(['/data/RAWDATA/' num2str(StudyImageID) '/'], RawFileNames);
end

if NeedsProcess %|| NeedsConnect
    CoregStudyImage = fetch(Conn, [... %Is there a computer-determined anatomical?
        'SELECT NumericData, QCAnswerID '...
        'FROM QCAnswerInfo '...
        'WHERE QCSessionID = ' num2str(QCSession{1,1}) ' '...
        'AND QCChoiceID = 512']);
    if isempty(CoregStudyImage) %NO - Is there a user-input-verified anatomical?
        CoregStudyImage = fetch(Conn, [...
            'SELECT NumericData, QCAnswerID '...
            'FROM QCAnswerInfo '...
            'WHERE QCSessionID = ' num2str(QCSession{1,1}) ' '...
            'AND QCChoiceID = 514']);
        if isempty(CoregStudyImage) %NO - Is there a user-input-requested anatomical?
            CoregStudyImage = fetch(Conn, [... 
                'SELECT NumericData, QCAnswerID, StudyImageInfo.ModalityID, QCAnswerInfo.SubjectID, StudyImageInfo.SubjectID '...
                'FROM QCAnswerInfo '...
                'LEFT JOIN StudyImageInfo ON QCAnswerInfo.NumericData = StudyImageInfo.StudyImageID '...
                'WHERE QCSessionID = ' num2str(QCSession{1,1}) ' '...
                'AND QCChoiceID = 513']);
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
                    fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID'}, {QCSession{1,1}, 513});
                    %Set the flag to NOT continue into processing
                    MissingInfo = true;
                else %YES
                    %INSERT that anatomical as a computer-determined value
                    fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'NumericData', 'QCChoiceID'}, {QCSession{1,1}, CoregStudyImage{1,1}, 512});
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
                    exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 514 WHERE QCAnswerID =' num2str(CoregStudyImage{1,2})]);
                end
            end
        else %YES - Use this value
        end
    else %YES - Use this value
    end

    if ~isempty(CoregStudyImage{1})
        CoregFiles = dir(['/data/NIFTI/' num2str(CoregStudyImage{1,1})]);
        CoregFileNames = {CoregFiles.name}';
        SegFile = regexp(CoregFileNames, '^s.*_seg_sn\.mat', 'match');
        SegFile = [SegFile{:}]';
        AnatFile = regexp(CoregFileNames, '^s.*\.nii', 'match');
        AnatFile = [AnatFile{:}]';
        if isempty(SegFile) || isempty(AnatFile)
            exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 194, Comments ="Could not find coregistration images" WHERE QCAnswerID = ' num2str(QCAnswer{1,1}) ';']);
            Result = 'Failed Processing';
            return;
        end
        SegFullPath = ['/data/NIFTI/' num2str(CoregStudyImage{1,1}) '/' SegFile{1,1}];
        AnatFullPath = ['/data/NIFTI/' num2str(CoregStudyImage{1,1}) '/' AnatFile{1,1}];
    end
end

if NeedsConvert
    Query = fetch(Conn, ['SELECT Manufacturer FROM StudyImageInfo WHERE StudyImageID = ' num2str(StudyImageID) ';']);
    if strcmp(Query{1,1}, 'Philips Medical Systems')
        UXRes = unix(['/usr/local/imaging/bxh_xcede_tools/bin/bxh2analyze --overwrite -b -s --nii ' RawFullPaths{1} ' /dev/shm/' num2str(StudyImageID) '_' RawFileNames{1}]);
	UXRes = unix(['FSLOUTPUTTYPE=NIFTI;/usr/local/imaging/fsl/bin/fslsplit /dev/shm/' num2str(StudyImageID) '_' RawFileNames{1} '.nii  /data/NIFTI/' num2str(StudyImageID) '/f' RawFileNames{1}(1:end-9) '_ -t'])
        if UXRes ~= 0
            exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 193, Comments ="Failed bxh2analyze" WHERE QCAnswerID = ' num2str(QCAnswer{1,1}) ';']);
            Result = 'Failed Conversion';
            return;
        end
    else
        load /home/ndplab/ToolboxExtend/CNS/QCBox3/SPMTemplates/DICOMConvert
        matlabbatch{1,1}.spm.util.dicom.outdir = cellstr(['/data/NIFTI/' num2str(StudyImageID)]);
        matlabbatch{1,1}.spm.util.dicom.data = RawFullPaths;
        save(['/data/DOC/' num2str(StudyImageID) '/SPMConvert' date '_' num2str(int8(cputime))], 'matlabbatch');
        try
            spm_jobman('run', matlabbatch);
        catch e
            exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 193, Comments ="' e.message '" WHERE QCAnswerID = ' num2str(QCAnswer{1,1}) ';']);
            Result = 'Failed Conversion';
            return;
        end
	unix(['if [ $(find /data/NIFTI/' num2str(StudyImageID) ' -maxdepth 1 -type f -name "s[^w5]*.nii" | wc -l) -gt 0 ]; then for f in /data/NIFTI/' num2str(StudyImageID) '/s[^w5]*.nii; do mv -v $f ${f/\/s/\/f}; done; fi'])
    end
end

if NeedsProcess
    CheckFiles = dir(['/data/NIFTI/' num2str(StudyImageID)]);
    CheckFileNames = {CheckFiles.name}';
    ConvertedFiles = regexp(CheckFileNames, '^f.*\.nii', 'match');
    ConvertedFiles = [ConvertedFiles{:}]';
    ConvertedFullPaths = strcat(['/data/NIFTI/' num2str(StudyImageID) '/'], ConvertedFiles);
    load /home/ndplab/ToolboxExtend/CNS/QCBox3/SPMTemplates/FunctionalProcess
    
    try
        DICOMParams = dicominfo(RawFullPaths{1});
    catch e
        exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 194, Comments ="Could not read DICOM info" WHERE QCAnswerID = ' num2str(QCAnswer{1,1}) ';']);
        Result = 'Failed Processing';
        return;
    end
    if isfield(DICOMParams, 'Private_0019_1029')
        SliceData = DICOMParams.Private_0019_1029;
        if isa(SliceData, 'uint8')
            [~, SliceOrder] = sort(SliceData(7:8:end));
        else
            [~, SliceOrder] = sort(SliceData);
        end
%     elseif Options.uiwait
%         Input = inputdlg('I need to know the slice order');
%         SliceOrder = eval(['[' Input{1} ']']);
%         if ~isa(SliceOrder, 'double')
%             exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 194, Comments ="Could not determine slice order" WHERE QCAnswerID = ' num2str(QCAnswer{1,1}) ';']);
%             Result = 'Failed Processing';
%             return;
%         end
    else
        SliceOrderQ = fetch(Conn, [...
            'SELECT QCAnswerID, TextData '...
            'FROM QCAnswerInfo '...
            'WHERE QCSessionID = ' num2str(QCSession{1,1}) ' '...
            'AND QCChoiceID = 515']);
        if isempty(SliceOrderQ)
            SliceOrderQ = fetch(Conn, [...
                'SELECT QCAnswerID, TextData '...
                'FROM QCAnswerInfo '...
                'WHERE QCSessionID = ' num2str(QCSession{1,1}) ' '...
                'AND QCChoiceID = 516']);
            if isempty(SliceOrderQ)
                MissingInfo = true;
                fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID'}, {QCSession{1,1}, 515});
                SliceOrder = [];
            else
                SliceOrder = eval(['[' SliceOrderQ{1,2} ']']);
            end
        else
            FirstVol = spm_vol(ConvertedFullPaths{1});
            try
                SliceOrder = eval(['[' SliceOrderQ{1,2} ']']);
                if ~isa(SliceOrder, 'double')
                    MissingInfo = true;
                    exec(Conn, ['UPDATE QCAnswers SET TextData = NULL WHERE QCAnswerID = ' num2str(SliceOrderQ{1,1})]);
                    SliceOrder = [];
                elseif length(SliceOrder) ~= FirstVol(1).dim(3)
                    MissingInfo = true;
                    exec(Conn, ['UPDATE QCAnswers SET TextData = NULL WHERE QCAnswerID = ' num2str(SliceOrderQ{1,1})]);
                    SliceOrder = [];
                else
                    exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 516 QCAnswerID = ' num2str(SliceOrderQ{1,1})]);
                end
            catch e
                MissingInfo = true;
                exec(Conn, ['UPDATE QCAnswers SET TextData = NULL, Comments = "', e.message, '" WHERE QCAnswerID = ' num2str(SliceOrderQ{1,1})]);
                SliceOrder = [];
            end
        end
%         exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 194, Comments ="Could not determine slice order" WHERE QCAnswerID = ' num2str(QCAnswer{1,1}) ';']);
%         Result = 'Failed Processing';
%         return;
    end
    NoSlices = length(SliceOrder);
    if isfield(DICOMParams, 'RepetitionTime')
        RepTime = DICOMParams.RepetitionTime/1000;
%     elseif Options.uiwait
%         Input = inputdlg('I need to know the repitition time');
%         RepTime = eval(['[' Input{1} ']']);
%         if ~isa(RepTime, 'double') || length(RepTime) ~= 1 || RepTime < 0
%             exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 194, Comments ="Could not determine repetition time" WHERE QCAnswerID = ' num2str(QCAnswer{1,1}) ';']);
%             Result = 'Failed Processing';
%             return;
%         end
    elseif isfield(DICOMParams.SharedFunctionalGroupsSequence.Item_1.MRTimingAndRelatedParametersSequence.Item_1, 'RepetitionTime')
        RepTime = DICOMParams.SharedFunctionalGroupsSequence.Item_1.MRTimingAndRelatedParametersSequence.Item_1.RepetitionTime/1000;
    else
        MissingInfo = true;
%         exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 194, Comments ="Could not determine repetition time" WHERE QCAnswerID = ' num2str(QCAnswer{1,1}) ';']);
%         Result = 'Failed Processing';
%         return;
    end
    if MissingInfo
        exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 194, Comments ="Missing Info" WHERE QCAnswerID = ' num2str(QCAnswer{1,1}) ';']);
        Result = 'Failed Processing';
        return;
    end
    ATime = RepTime - (RepTime/NoSlices);
    RefSlice = ceil(NoSlices/2);
    matlabbatch{1,1}.spm.temporal.st.nslices = NoSlices;
    matlabbatch{1,1}.spm.temporal.st.tr = RepTime;
    matlabbatch{1,1}.spm.temporal.st.ta = ATime;
    matlabbatch{1,1}.spm.temporal.st.so = SliceOrder;
    matlabbatch{1,1}.spm.temporal.st.refslice = RefSlice;
    matlabbatch{1,3}.spm.spatial.coreg.estimate.ref = {AnatFullPath};
    matlabbatch{1,4}.spm.spatial.normalise.write.subj.matname = {SegFullPath};
    if length(ConvertedFullPaths) == 1
        Vols = spm_vol(ConvertedFullPaths{1});
        ConvertedFullPaths = strcat(ConvertedFullPaths, ', ', num2str((1:length(Vols))'));
    end
    matlabbatch{1,1}.spm.temporal.st.scans{1,1} = ConvertedFullPaths;
    save(['/data/DOC/' num2str(StudyImageID) '/SPMFuncProcess' date '_' num2str(int8(cputime))], 'matlabbatch');
    try
        spm_jobman('run', matlabbatch);
        exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 195 WHERE QCAnswerID = ' num2str(QCAnswer{1,1}) ';']);
        Result = 'Success';
        return;
    catch e
        exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 194, Comments ="' e.message '" WHERE QCAnswerID = ' num2str(QCAnswer{1,1}) ';']);
        Result = 'Failed Processing';
        return;
    end
else
    Result = 'Already Processed';
    return;
end

end
