function Result = ProcessFunctionalImage(varargin)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[Conn, IDs, Options] = ParseArgs(struct('caller', 'ConvertFunctionalImage'), varargin{:});
StudyImageID = IDs(end);

if ~exist(['/data/RAWDATA/' num2str(StudyImageID)], 'dir')
    Result = 'No File Record';
    return
end

unix(['mkdir -pv /data/{DOC,NIFTI}/' num2str(StudyImageID)]);

CheckFiles = dir(['/data/NIFTI/' num2str(StudyImageID)]);
CheckFileNames = {CheckFiles.name}';
ConvertedFiles = regexp(CheckFileNames, '^f.*\.nii', 'match');
ConvertedFiles = [ConvertedFiles{:}]';

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

NeedsConvert = true;
NeedsMove = false;

if ~isempty(ConvertedFiles) %FS indicates that conversion has occured, but not any processing
    if QCAnswer{1,2} == 193 %DB indicates a conversion failure : clean out FS before continuing
        NeedsMove = true;
    else %DB does not indicate a conversion failure : do not convert
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

if NeedsConvert
    RawFiles = dir(['/data/RAWDATA/' num2str(StudyImageID)]);
    RawFileNames = {RawFiles(3:end).name}';
    RawFullPaths = strcat(['/data/RAWDATA/' num2str(StudyImageID) '/'], RawFileNames);
    Query = fetch(Conn, ['SELECT Manufacturer FROM StudyImageInfo WHERE StudyImageID = ' num2str(StudyImageID) ';']);
    UXRes = unix(['/usr/local/imaging/bxh_xcede_tools/bin/bxh2analyze -b -s --nii ' RawFullPaths{1} ' /dev/shm/' num2str(StudyImageID) '_f' RawFileNames{1} ' && export FSLOUTPUTTYPE=NIFTI && fslsplit /dev/shm/' num2str(StudyImageID) '_f' RawFileNames{1} ' /data/NIFTI/'  num2str(StudyImageID) '/f' RawFileNames{1} '_ -t' ]);
    if UXRes ~= 0
        exec(Conn, ['UPDATE QCAnswers SET QCChoiceID = 193, Comments ="Failed bxh2analyze" WHERE QCAnswerID = ' num2str(QCAnswer{1,1}) ';']);
        Result = 'Failed Conversion';
        return;
    end
end
