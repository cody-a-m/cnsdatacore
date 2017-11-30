function QCAnatomicalImage(varargin)
%UNTITLED23 Summary of this function goes here
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

NumVolQ = fetch(Conn, ['SELECT QCAnswerID FROM QCAnswerInfo WHERE QCQuestionID = 145 AND QCSessionID = ' num2str(QCSessionQ{1,1}) ';']);
SpaceBSliceQ = fetch(Conn, ['SELECT QCAnswerID FROM QCAnswerInfo WHERE QCQuestionID = 92 AND QCSessionID = ' num2str(QCSessionQ{1,1}) ';']);
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

Info = getAnatomicalNIFTIInfo(StudyImageID);

if ~isempty(DICOMInfo)
    %Number of volumes
    if isempty(NumVolQ)
        fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData'}, {QCSessionQ{1,1}, 447, length(unique([DICOMInfo.AcquisitionNumber]))});
    end
    %Spacing between slices
    if isempty(SpaceBSliceQ)
        if isfield(DICOMInfo, 'SpacingBetweenSlices')
            fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData'}, {QCSessionQ{1,1}, 200, length(unique([DICOMInfo.AcquisitionNumber]))});
        else
            FirstVolume = DICOMInfo([DICOMInfo.AcquisitionNumber] == 1);
            if length(FirstVolume) > 1
                fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData'}, {QCSessionQ{1,1}, 200, (max([FirstVolume.SliceLocation]) - min([FirstVolume.SliceLocation]))/(length(FirstVolume) - 1)});
            end
        end
    end
end

if ~isempty(Info.Raw)
    %Number of slices per volume
    Query = fetch(Conn, ['SELECT QCAnswerID FROM QCAnswerInfo WHERE QCQuestionID = 148 AND QCSessionID = ' num2str(QCSessionQ{1,1}) ';']);
    if isempty(Query)
        fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData', 'Comments'}, {QCSessionQ{1,1}, 438, Info.Raw.dim(1), 'in X Direction'});
        fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData', 'Comments'}, {QCSessionQ{1,1}, 438, Info.Raw.dim(2), 'in Y Direction'});
        fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData', 'Comments'}, {QCSessionQ{1,1}, 438, Info.Raw.dim(3), 'in Z Direction'});
    end
    load('/home/ndplab/ToolboxExtend/CNS/QCBox3/GlobalVariables');
    ScanSession = fetch(Conn, ['SELECT ScanSessionID FROM StudyImageInfo WHERE StudyImageID =' num2str(StudyImageID) ';']);
    if ~isempty(ScanSession)
        ScanSessionID = ScanSession{1,1};
        if ~exist([GlobalVariables.WebServerRoot 'Resources/BrainImages/' num2str(ScanSessionID) '.png'], 'file');
            Snapshot = SnapshotAnatomicalImage(Info.Raw.fname);
            imwrite(Snapshot, [GlobalVariables.WebServerRoot 'Resources/BrainImages/' num2str(ScanSessionID) '.png']);
        end
    end
end

if ~isempty(Info.GM)
    %Grey Matter Volume
    Query = fetch(Conn, ['SELECT QCAnswerID FROM QCAnswerInfo WHERE QCQuestionID = 1 AND QCSessionID = ' num2str(QCSessionQ{1,1}) ';']);
    if isempty(Query)
        VoxVol = abs(Info.GM.mat(1:3,1)' * cross(Info.GM.mat(1:3,2), Info.GM.mat(1:3,3)));
        ImgMap = spm_read_vols(Info.GM);
        SegVol = sum(ImgMap(:))*VoxVol;
        fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData'}, {QCSessionQ{1,1}, 180, SegVol});
    end
end

if ~isempty(Info.WM)
    %White Matter Volume
    Query = fetch(Conn, ['SELECT QCAnswerID FROM QCAnswerInfo WHERE QCQuestionID = 2 AND QCSessionID = ' num2str(QCSessionQ{1,1}) ';']);
    if isempty(Query)
        VoxVol = abs(Info.WM.mat(1:3,1)' * cross(Info.WM.mat(1:3,2), Info.WM.mat(1:3,3)));
        ImgMap = spm_read_vols(Info.WM);
        SegVol = sum(ImgMap(:))*VoxVol;
        fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData'}, {QCSessionQ{1,1}, 181, SegVol});
    end
end

end