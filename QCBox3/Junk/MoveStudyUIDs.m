NewConn = ConnectToMySQL;
DPaths = fetch(NewConn, 'SELECT SUBSTRING_INDEX(DirectoryPath, "/", 4), COUNT(FileID) FROM Quarantine.Files LEFT JOIN Quarantine.Directories ON Files.DirectoryID = Directories.DirectoryID WHERE Files.StudyUID IS NULL GROUP BY SUBSTRING_INDEX(DirectoryPath, "/", 4);');
for i = 1:length(DPaths)
    try
        ProtPaths = dir(['/home/data2/DICOM/QC0/' DPaths{i,1}]);
        ProtPaths = ProtPaths([ProtPaths.isdir]);
        if length(ProtPaths) ~= 3
            disp('too many protocols');
            continue;
        end
        SeqPaths = dir(['/home/data2/DICOM/QC0/' DPaths{i,1} '/' ProtPaths(3).name]);
        SeqPaths = SeqPaths([SeqPaths.isdir]);
        FilePaths = dir(['/home/data2/DICOM/QC0/' DPaths{i,1} '/' ProtPaths(3).name '/' SeqPaths(3).name]);
        di = dicominfo(['/home/data2/DICOM/QC0/' DPaths{i,1} '/' ProtPaths(3).name '/' SeqPaths(3).name '/' FilePaths(3).name]);
        %di = dicominfo(['/home/data2/DICOM/QC0/' DPaths{i,1} '/' SeqPaths(3).name]);
        exec(NewConn, ['UPDATE Quarantine.Files LEFT JOIN Quarantine.Directories ON Files.DirectoryID = Directories.DirectoryID SET StudyUID = "' di.StudyInstanceUID '" WHERE SUBSTRING_INDEX(DirectoryPath, "/", 4) = "' DPaths{i,1} '" AND Files.StudyUID IS NULL']);
        disp(num2str(i));
    catch e
        disp(e.message);
        continue;
    end
end