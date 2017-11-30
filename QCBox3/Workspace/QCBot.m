function QCBot()
%UNTITLED21 Summary of this function goes here
%   Detailed explanation goes here

Conn = ConnectToMySQL();
%fMRI motion
NeedsMotion = fetch(Conn, [...
    'SELECT QCSessionInfo.QCSessionID, StudyImageID '...
    'FROM QCSessionInfo LEFT JOIN (SELECT QCSessionID FROM QCAnswerInfo WHERE QCQuestionID = 7) AS AlreadyMotion ON QCSessionInfo.QCSessionID = AlreadyMotion.QCSessionID '...
    'WHERE QCSessionInfo.ModalityID = 3 AND AlreadyMotion.QCSessionID IS NULL;']);

for i = 1:length(NeedsMotion)
    disp(num2str(NeedsMotion{i,1}));
    if ~exist(['/data/NIFTI/' num2str(NeedsMotion{i,2})], 'dir')
        continue;
    end
    NIFTIFiles = dir(['/data/NIFTI/' num2str(NeedsMotion{i,2})]);
    NIFTIFileNames = {NIFTIFiles.name}';
    MotionFiles = regexp(NIFTIFileNames, '(^rp_.*\.txt$)', 'tokens');
    MotionFiles = [MotionFiles{:}]';
    if length(MotionFiles) ~= 1
        continue;
    end
    MotionFileName = MotionFiles{1,1}{1,1};
    Motion = importdata(['/data/NIFTI/' num2str(NeedsMotion{i,2}) '/' MotionFileName]);
    StepMotion = Motion(2:end,:) - Motion(1:end-1,:);
    MinStep = min(StepMotion);
    MaxStep = max(StepMotion);
    Differences = (abs(MinStep) > MaxStep).*MinStep + (abs(MinStep) < MaxStep).*MaxStep;
    Differences(4:end) = Differences(4:end)*57.3;
    fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData', 'Comments'}, {NeedsMotion{i,1}, 184, Differences(1), 'In X Direction'});
    fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData', 'Comments'}, {NeedsMotion{i,1}, 184, Differences(2), 'In Y Direction'});
    fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData', 'Comments'}, {NeedsMotion{i,1}, 184, Differences(3), 'In Z Direction'});
    fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData', 'Comments'}, {NeedsMotion{i,1}, 182, Differences(4), 'On X Axis'});
    fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData', 'Comments'}, {NeedsMotion{i,1}, 182, Differences(5), 'On Y Axis'});
    fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID', 'NumericData', 'Comments'}, {NeedsMotion{i,1}, 182, Differences(6), 'On Z Axis'});
end

end