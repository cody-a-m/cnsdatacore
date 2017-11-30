Conn = ConnectToMySQL();
FSProjectDirs = dir('/home/data2/Collab_JVH/OUTBOX/');
FSProjectDirs = FSProjectDirs([FSProjectDirs.isdir]);
NewPathMap = {};
for i = 3:length(FSProjectDirs)
    SubjectDirs = dir(['/home/data2/Collab_JVH/OUTBOX/' FSProjectDirs(i).name]);
    SubjectDirs = SubjectDirs([SubjectDirs.isdir]);
    if ~exist(['/home/data2/Collab_JVH/INBOX/' FSProjectDirs(i).name], 'dir');
        continue;
    end
    for j = 3:length(SubjectDirs)
        DICOMFiles = dir(['/home/data2/Collab_JVH/OUTBOX/' FSProjectDirs(i).name '/' SubjectDirs(j).name '/structural']);
        if length(DICOMFiles) > 3
            FSDirs = dir(['/home/data2/Collab_JVH/INBOX/' FSProjectDirs(i).name]);
            for k = length(FSDirs):-1:3
                if exist(['/home/data2/Collab_JVH/INBOX/' FSProjectDirs(i).name '/' FSDirs(k).name '/' SubjectDirs(j).name], 'dir')
                    if exist(['/home/data2/Collab_JVH/INBOX/' FSProjectDirs(i).name '/' FSDirs(k).name '/' SubjectDirs(j).name '/FSrecon/label'], 'dir')
                        SubjectDirs(j).path = ['/home/data2/Collab_JVH/INBOX/' FSProjectDirs(i).name '/' FSDirs(k).name '/' SubjectDirs(j).name '/FSrecon/'];
                    elseif exist(['/home/data2/Collab_JVH/INBOX/' FSProjectDirs(i).name '/' FSDirs(k).name '/' SubjectDirs(j).name '/label'], 'dir')
                        SubjectDirs(j).path = ['/home/data2/Collab_JVH/INBOX/' FSProjectDirs(i).name '/' FSDirs(k).name '/' SubjectDirs(j).name '/'];
                        break;
                    end
                end
            end
            if ~isfield(SubjectDirs(j), 'path')
                SubjectDirs(j).error = 'No FS';
                continue;
            end
            try
                di = dicominfo(['/home/data2/Collab_JVH/OUTBOX/' FSProjectDirs(i).name '/' SubjectDirs(j).name '/structural/' DICOMFiles(3).name]);
                SubjectDirs(j).seriesUID = di.SeriesInstanceUID;
                SubjectDirs(j).StudyImageID = fetch(Conn, ['SELECT StudyImageID FROM StudyImageInfo WHERE SeriesUID = "' SubjectDirs(j).seriesUID '";']);
                for l = 1:length(SubjectDirs(j).StudyImageID)
                    NewPathMap = [NewPathMap; {SubjectDirs(j).StudyImageID{l,1}, SubjectDirs(j).path}];
                end
            catch e
                SubjectDirs(j).error = e.message;
                continue;
            end
        else
            SubjectDirs(j).error = 'No DICOM';
        end
    end
    SubjectDirs(1:2) = [];
    FSProjectDirs(i).SubjectDirs = SubjectDirs;
end
FSProjectDirs(1:2) = [];

clear Conn i SubjectDirs j DICOMFiles FSDirs k e di;