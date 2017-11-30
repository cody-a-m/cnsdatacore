function QCDiffusionImage(varargin)
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

NumVolQ = fetch(Conn, ['SELECT QCAnswerID FROM QCAnswerInfo WHERE QCQuestionID = 147 AND QCSessionID = ' num2str(QCSessionQ{1,1}) ';']);
SpaceBSliceQ = fetch(Conn, ['SELECT QCAnswerID FROM QCAnswerInfo WHERE QCQuestionID = 94 AND QCSessionID = ' num2str(QCSessionQ{1,1}) ';']);
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
    ConvertedFile = regexp(NIFTIFileNames, '^rawdwi\.nii$', 'match');
    ConvertedFile = [ConvertedFile{:}]';
    if isempty(ConvertedFile)
        NIFTIInfo = [];
    else
        NIFTIInfo = spm_vol(['/data/NIFTI/' num2str(StudyImageID) '/' ConvertedFile{1,1}]);
    end
    %MotionFile = regexp(NIFTIFileNames, '^rp_.*\.txt$', 'match');
    MotionFile = regexp(NIFTIFileNames, '^erawdwi\.ecclog$', 'match');
    MotionFile = [MotionFile{:}]';
    GradientFile = regexp(NIFTIFileNames, '^dti_gradient\.txt$', 'match');
    GradientFile = [GradientFile{:}]';
    if isempty(MotionFile) || isempty(GradientFile)
        MotionInfo = [];
    else
        %MotionInfo = importdata(['/data/NIFTI/' num2str(StudyImageID) '/' MotionFile{1,1}]);
        MotionInfo = ReadECC(['/data/NIFTI/' num2str(StudyImageID)]);
    end
end

% Query = fetch(Conn, ['SELECT QCAnswerID FROM QCAnswerInfo WHERE QCSessionID = ' num2str(QCSessionQ{1,1}) ' AND QCQuestionID = 186;']);
% if isempty(Query)
%     if exist(['/data/NIFTI/' num2str(StudyImageID) '/dti_gradient.txt'], 'file')
%         InfoQ = fetch(Conn, ['SELECT SequenceID, Manufacturer FROM StudyImageInfo WHERE StudyImageID = ' num2str(StudyImageID) ';']);
%         SequenceID = InfoQ{1,1};
%         Manufacturer = InfoQ{1,2};
%         Gradients = readtable(['/data/NIFTI/' num2str(StudyImageID) '/dti_gradient.txt'], 'delimiter', ' ', 'ReadVariableNames', false);
%         Gradients = table2array(Gradients(:,1:3));
%         Gradients(sum(Gradients, 2) == 0, :) = [];
%         switch Manufacturer
%             case 'GE MEDICAL SYSTEMS'
%                 Gradients(:,1) = -1*Gradients(:,1);
%             case 'SIEMENS'
%                 Gradients(:,3) = -1*Gradients(:,3);
%             case 'Philips Medical Systems'
%                 Gradients(:,2) = -1*Gradients(:,2);
%         end
%         Standards = fetch(Conn, ['SELECT XValue, YValue, ZValue '...
%             'FROM Gradients INNER JOIN SequenceGradientStandards ON Gradients.GradientStandardID = SequenceGradientStandards.GradientStandardID '...
%             'WHERE SequenceGradientStandards.SequenceID = ' num2str(SequenceID) ';']);
%         DP = diag(cell2mat(Standards)*Gradients');
%         if any(DP < 0.9)
%             fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID'}, {QCSessionQ{1,1}, 602});
%         else
%             fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID'}, {QCSessionQ{1,1}, 601});
%         end
%     end
% end

if ~isempty(DICOMInfo)
    %Number of volumes
    if isempty(NumVolQ)
        fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData'}, {QCSessionQ{1,1}, 453, length(unique([DICOMInfo.AcquisitionNumber]))});
    end
    %Spacing between slices
    if isempty(SpaceBSliceQ)
        if isfield(DICOMInfo, 'SpacingBetweenSlices')
            fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData'}, {QCSessionQ{1,1}, 202, DICOMInfo(1).SpacingBetweenSlices});
        else
            FirstVolume = DICOMInfo([DICOMInfo.AcquisitionNumber] == 1);
            if length(FirstVolume) > 1
                fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData'}, {QCSessionQ{1,1}, 202, (max([FirstVolume.SliceLocation]) - min([FirstVolume.SliceLocation]))/(length(FirstVolume) - 1)});
            end
        end
    end
end

if ~isempty(NIFTIInfo)
    %Number of slices per volume
    Query = fetch(Conn, ['SELECT QCAnswerID FROM QCAnswerInfo WHERE QCQuestionID = 150 AND QCSessionID = ' num2str(QCSessionQ{1,1}) ';']);
    if isempty(Query)
        fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData', 'Comments'}, {QCSessionQ{1,1}, 444, NIFTIInfo(1).dim(1), 'in X Direction'});
        fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData', 'Comments'}, {QCSessionQ{1,1}, 444, NIFTIInfo(1).dim(2), 'in Y Direction'});
        fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData', 'Comments'}, {QCSessionQ{1,1}, 444, NIFTIInfo(1).dim(3), 'in Z Direction'});
    end
end

if ~isempty(MotionInfo) && size(MotionInfo, 1) > 1
    Query = fetch(Conn, ['SELECT QCAnswerID FROM QCAnswerInfo WHERE QCQuestionID = 160 AND QCSessionID = ' num2str(QCSessionQ{1,1}) ';']);
    if isempty(Query)
        StepMotion = MotionInfo(2:end,:) - MotionInfo(1:end-1,:);
        MinStep = min(StepMotion);
        MaxStep = max(StepMotion);
        Differences = (abs(MinStep) > MaxStep).*MinStep + (abs(MinStep) < MaxStep).*MaxStep;
        Differences(4:end) = Differences(4:end)*57.3;
        %try
        fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData', 'Comments'}, {QCSessionQ{1,1}, 527, Differences(1), 'In X Direction'});
        %catch e
        %    disp(e.message);
        %end
        fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData', 'Comments'}, {QCSessionQ{1,1}, 527, Differences(2), 'In Y Direction'});
        fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData', 'Comments'}, {QCSessionQ{1,1}, 527, Differences(3), 'In Z Direction'});
        fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData', 'Comments'}, {QCSessionQ{1,1}, 528, Differences(4), 'On X Axis'});
        fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData', 'Comments'}, {QCSessionQ{1,1}, 528, Differences(5), 'On Y Axis'});
        fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData', 'Comments'}, {QCSessionQ{1,1}, 528, Differences(6), 'On Z Axis'});
    end
end

end

