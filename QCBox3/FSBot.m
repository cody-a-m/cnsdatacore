function FSBot()

if isempty(gcp('nocreate'))
    parpool(6);
end

Result = unix('export SUBJECTS_DIR=/data/FS/');
if Result ~= 0
    return;
end
while true
    disp('New Run');
    Conn = ConnectToMySQL();
    NextToFS = fetch(Conn, 'CALL nextToFS()');
    if isempty(NextToFS)
        break;
    end
    FileNames = cell(length(NextToFS), 1);
    Skip = zeros(length(NextToFS), 1);
    Success = zeros(length(NextToFS), 1);
    QCSessionIDs = zeros(length(NextToFS), 1);
    QCAnswerIDs = zeros(length(NextToFS), 1);
    for i =1:length(NextToFS)
        disp([9 num2str(NextToFS{i,1})]);
        if ~exist(['/data/RAWDATA/' num2str(NextToFS{i,1})], 'dir')
            Skip(i) = 1;
        else
            Files = dir(['/data/RAWDATA/' num2str(NextToFS{i,1})]);
            Files = Files(~[Files.isdir]);
            if isempty(Files)
                Skip(i) = 1;
            else
                FileNames{i} = Files(3).name;
            end
        end
        if ~exist(['/data/DOC/' num2str(NextToFS{i})], 'dir')
            unix(['mkdir /data/DOC/' num2str(NextToFS{i})]);
        end
        QCSessionQ = fetch(Conn, ['SELECT QCSessionID FROM QCSessions WHERE StudyImageID = ' num2str(NextToFS{i,1}) ' AND TrainingFlag = 0;']);
        if isempty(QCSessionQ)
            fastinsert(Conn, 'QCSessions', {'StudyImageID'}, NextToFS(i,1));
            QCSessionQ = fetch(Conn, ['SELECT QCSessionID FROM QCSessions WHERE StudyImageID = ' num2str(NextToFS{i,1}) ' AND TrainingFlag = 0;']);
        end
        QCSessionIDs(i) = QCSessionQ{1,1};
        QCAnswerQ = fetch(Conn, ['SELECT QCAnswerID FROM QCAnswers WHERE QCSessionID = ' num2str(QCSessionIDs(i)) ' AND QCChoiceID = 519 OR QCChoiceID = 520 OR QCChoiceID = 521 OR QCChoiceID = 522;']);
        if isempty(QCAnswerQ)
            fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID'}, {QCSessionQ{1,1}, 522});
            QCAnswerQ = fetch(Conn, ['SELECT QCAnswerID FROM QCAnswers WHERE QCSessionID = ' num2str(QCSessionIDs(i)) ' AND QCChoiceID = 522;']);
        else
            exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 522 WHERE QCAnswerID =' num2str(QCAnswerQ{1,1}) ';']);
        end
        QCAnswerIDs(i) = QCAnswerQ{1,1};
    end
    parfor i = 1:length(NextToFS)
        if Skip(i)
            continue;
        end
        Success(i) = unix(['recon-all -all -subjid ' num2str(NextToFS{i}) ' -i /data/RAWDATA/' num2str(NextToFS{i}) '/' FileNames{i} ' 2>&1 > /data/DOC/' num2str(NextToFS{i}) '/AutoFS.log']);
        MgzToNii(NextToFS{i});
    end
    for i = 1:length(NextToFS)
        if Skip(i)
            exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 520 WHERE QCAnswerID =' num2str(QCAnswerIDs(i)) ';']);
        elseif Success(i) == 0
            exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 521 WHERE QCAnswerID =' num2str(QCAnswerIDs(i)) ';']);
            CoregImages = fetch(Conn, ['SELECT StudyImageID FROM QCAnswerInfo WHERE (QCChoiceID = 512 OR QCChoiceID = 514 OR QCChoiceID = 524 OR QCChoiceID = 526) AND NumericData = ' num2str(NextToFS{i}) ';']);
            if ~isempty(CoregImages)
                ProcessStudyImage([CoregImages{:}]);
            end
        else
            exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 520 WHERE QCAnswerID =' num2str(QCAnswerIDs(i)) ';']);
        end
    end
    disp('Done');
end

end