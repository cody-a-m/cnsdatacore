function QCFunctionalImage(varargin)
%UNTITLED24 Summary of this function goes here
%   Detailed explanation goes here

[Conn, IDs, Options] = ParseArgs(struct('caller', 'QCAnatomicalImage'), varargin{:});
StudyImageID = IDs(end);

QCSessionQ = fetch(Conn, ['SELECT QCSessionID FROM QCSessions WHERE TrainingFlag = 0 AND StudyImageID = ' num2str(StudyImageID) ';']);
if isempty(QCSessionQ)
    fastinsert(Conn, 'QCSessions', {'StudyImageID'}, {StudyImageID});
    QCSessionQ = fetch(Conn, ['SELECT QCSessionID FROM QCSessions WHERE TrainingFlag = 0 AND StudyImageID = ' num2str(StudyImageID) ';']);
end

if ~exist(['/data/RAWDATA/' num2str(StudyImageID)], 'dir')
    return;
end

NumVolQ = fetch(Conn, ['SELECT QCAnswerID FROM QCAnswerInfo WHERE QCQuestionID = 146 AND QCSessionID = ' num2str(QCSessionQ{1,1}) ';']);
SpaceBSliceQ = fetch(Conn, ['SELECT QCAnswerID FROM QCAnswerInfo WHERE QCQuestionID = 93 AND QCSessionID = ' num2str(QCSessionQ{1,1}) ';']);
DICOMInfo = struct.empty();

% if isempty(NumVolQ) || isempty(SpaceBSliceQ)
%     DICOMFiles = dir(['/data/RAWDATA/' num2str(StudyImageID)]);
%     DICOMFiles = DICOMFiles(~[DICOMFiles.isdir]);
% 
%     for i = 1:length(DICOMFiles)
%         try
%             DICOMInfo = dicominfo(['/data/RAWDATA/' num2str(StudyImageID) '/' DICOMFiles(i).name]);
%             break;
%         end
%     end
% 
%     for j = i+1:length(DICOMFiles)
%         try
%             DICOMInfoFile = dicominfo(['/data/RAWDATA/' num2str(StudyImageID) '/' DICOMFiles(i).name]);
%             DICOMInfoFile = rmfield(DICOMInfoFile, setdiff(fieldnames(DICOMInfoFile), fieldnames(DICOMInfo)));
%             DICOMInfo = rmfield(DICOMInfo, setdiff(fieldnames(DICOMInfo), fieldnames(DICOMInfoFile)));
%             DICOMInfo = [DICOMInfo; DICOMInfoFile];
%         end
%     end
% end

if exist(['/data/NIFTI/' num2str(StudyImageID)], 'dir')
    NIFTIFiles = dir(['/data/NIFTI/' num2str(StudyImageID)]);
    NIFTIFiles = NIFTIFiles(~[NIFTIFiles.isdir]);
    NIFTIFileNames = {NIFTIFiles.name}';
    ConvertedFile = regexp(NIFTIFileNames, '^f.*\.nii$', 'match');
    ConvertedFile = [ConvertedFile{:}]';
    if isempty(ConvertedFile)
        NIFTIInfo = [];
    else
        NIFTIInfo = spm_vol(['/data/NIFTI/' num2str(StudyImageID) '/' ConvertedFile{1,1}]);
    end
    MotionFile = regexp(NIFTIFileNames, '^rp_.*\.txt$', 'match');
    MotionFile = [MotionFile{:}]';
    if isempty(MotionFile)
        MotionInfo = [];
    else
        MotionInfo = importdata(['/data/NIFTI/' num2str(StudyImageID) '/' MotionFile{1,1}]);
    end
else
    NIFTIInfo = [];
    MotionInfo = [];
end

if ~isempty(DICOMInfo)
    %Number of volumes
    if isempty(NumVolQ)
        fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData'}, {QCSessionQ{1,1}, 450, length(unique([DICOMInfo.AcquisitionNumber]))});
    end
    %Spacing between slices
    if isempty(SpaceBSliceQ)
        if isfield(DICOMInfo, 'SpacingBetweenSlices')
            fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData'}, {QCSessionQ{1,1}, 201, length(unique([DICOMInfo.AcquisitionNumber]))});
        else
            FirstVolume = DICOMInfo([DICOMInfo.AcquisitionNumber] == 1);
            if length(FirstVolume) > 1
                fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData'}, {QCSessionQ{1,1}, 201, (max([FirstVolume.SliceLocation]) - min([FirstVolume.SliceLocation]))/(length(FirstVolume) - 1)});
            end
        end
    end
end

if ~isempty(NIFTIInfo)
    %Number of slices per volume
    Query = fetch(Conn, ['SELECT QCAnswerID FROM QCAnswerInfo WHERE QCQuestionID = 149 AND QCSessionID = ' num2str(QCSessionQ{1,1}) ';']);
    if isempty(Query)
        fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData', 'Comments'}, {QCSessionQ{1,1}, 441, NIFTIInfo(1).dim(1), 'in X Direction'});
        fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData', 'Comments'}, {QCSessionQ{1,1}, 441, NIFTIInfo(1).dim(2), 'in Y Direction'});
        fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData', 'Comments'}, {QCSessionQ{1,1}, 441, NIFTIInfo(1).dim(3), 'in Z Direction'});
    end
end

if ~isempty(MotionInfo)
    Query = fetch(Conn, ['SELECT QCAnswerID FROM QCAnswerInfo WHERE QCQuestionID = 7 AND QCSessionID = ' num2str(QCSessionQ{1,1}) ';']);
    if isempty(Query)
        StepMotion = MotionInfo(2:end,:) - MotionInfo(1:end-1,:);
        MinStep = min(StepMotion);
        MaxStep = max(StepMotion);
        Differences = (abs(MinStep) > MaxStep).*MinStep + (abs(MinStep) < MaxStep).*MaxStep;
        Differences(4:end) = Differences(4:end)*57.3;
        fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData', 'Comments'}, {QCSessionQ{1,1}, 184, Differences(1), 'In X Direction'});
        fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData', 'Comments'}, {QCSessionQ{1,1}, 184, Differences(2), 'In Y Direction'});
        fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData', 'Comments'}, {QCSessionQ{1,1}, 184, Differences(3), 'In Z Direction'});
        fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData', 'Comments'}, {QCSessionQ{1,1}, 182, Differences(4), 'On X Axis'});
        fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData', 'Comments'}, {QCSessionQ{1,1}, 182, Differences(5), 'On Y Axis'});
        fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData', 'Comments'}, {QCSessionQ{1,1}, 182, Differences(6), 'On Z Axis'});
    end
end

end

