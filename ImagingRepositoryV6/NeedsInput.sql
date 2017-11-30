select CONVERT(NumericData, UNSIGNED INTEGER) as slices from QCAnswerInfo where QCSessionID=17827 and QCQuestionName="Number of Slices" and Comments like "%Z%"

select QCSessionID from QCAnswerInfo where QCQuestionID=156 and TextData is null and NetworkID=3

update QCAnswers as QA set QA.TextData=(select CONCAT("1:",CONVERT(NumericData, UNSIGNED INTEGER)) as slices from QCAnswerInfo where QCSessionID=QA.QCSessionID and QCQuestionName="Number of Slices" and Comments like "%Z%") where QCQuestionID=156 and TextData is null and NetworkID=3;
