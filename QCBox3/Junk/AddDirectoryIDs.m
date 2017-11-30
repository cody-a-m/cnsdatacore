NewConn = ConnectToMySQL;
NeedDirs = fetch(NewConn, 'SELECT ParameterID, UploadID, StudyUID FROM Quarantine.Parameters WHERE DirectoryID IS NULL AND SeriesUID IS NULL');
for i = 1:size(NeedDirs, 1)
    Dirs = fetch(NewConn, ['SELECT DISTINCT Files.DirectoryID FROM Quarantine.Files LEFT JOIN Quarantine.Directories ON Files.DirectoryID = Directories.DirectoryID WHERE Files.StudyUID = "' NeedDirs{i,3} '" AND Directories.UploadID = ' num2str(NeedDirs{i,2}) ';']);
    NeedDirs{i,4} = size(Dirs, 1);
end