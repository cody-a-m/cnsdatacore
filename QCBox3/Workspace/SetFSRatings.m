FSDirs = dir('/data/FS');
FSDirs = FSDirs([FSDirs.isdir]);
Conn = ConnectToMySQL();
for i = 3:length(FSDirs)
    disp(FSDirs(i).name);
    QCSessionQ = fetch(Conn, ['SELECT QCSessionID FROM QCSessions WHERE TrainingFlag = 0 AND StudyImageID =' FSDirs(i).name ';']);
    if isempty(QCSessionQ)
        fastinsert(Conn, 'QCSessions', {'StudyImageID'}, {str2double(FSDirs(i).name)});
        QCSessionQ = fetch(Conn, ['SELECT QCSessionID FROM QCSessions WHERE TrainingFlag = 0 AND StudyImageID =' FSDirs(i).name ';']);
    end
    if exist(['/data/FS/' FSDirs(i).name '/surf/lh.pial'], 'file') && exist(['/data/FS/' FSDirs(i).name '/surf/rh.pial'], 'file')
        QCAnswerQ = fetch(Conn, ['SELECT QCAnswerID FROM QCAnswerInfo WHERE QCSessionID = ' num2str(QCSessionQ{1,1}) ' AND QCQuestionID = 158;']);
        if isempty(QCAnswerQ)
            fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID'}, {QCSessionQ{1,1}, 521});
        else
            exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 521 WHERE QCAnswerID =' num2str(QCAnswerQ{1,1}) ';']);
        end
    else
        if isempty(QCAnswerQ)
            fastinsert(Conn, 'QCAnswers', {'QCSessionID', 'QCChoiceID'}, {QCSessionQ{1,1}, 520});
        else
            exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 520 WHERE QCAnswerID =' num2str(QCAnswerQ{1,1}) ';']);
        end
    end
end