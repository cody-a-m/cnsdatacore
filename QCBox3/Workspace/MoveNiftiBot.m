Conn = ConnectToMySQL();

ImageList = fetch(Conn, 'SELECT CONCAT(REPLACE(DirectoryPath, "QC0", "QC2"), "/") AS DirectoryPath, CONCAT("/data/NIFTI/", CAST(StudyImageID AS CHAR)) AS NewDirectory FROM StudyImageInfo INNER JOIN ImagingRepositoryV4.ImageScans ON StudyImageInfo.SeriesUID = ImageScans.SeriesUID');
OldDirectories = ImageList(:,1);
NewDirectories = ImageList(:,2);
FID = fopen('/home/ndplab/ToolboxExtend/CNS/QCBox3/movenifti.sh', 'w+');
fprintf(FID, '#!/bin/bash \n\n');

for i = 1:length(OldDirectories)
    disp([num2str(i) ' of ' num2str(length(OldDirectories))]);
    if exist(OldDirectories{i}, 'dir') && ~exist(NewDirectories{i}, 'dir')
        fprintf(FID, ['cp -r ' OldDirectories{i} ' ' NewDirectories{i} '\n']);
        fprintf(FID, ['echo "' num2str(i) ' of ' num2str(length(OldDirectories)) '" \n']);
    end
end

fclose(FID);
unix('chmod u+x /home/ndplab/ToolboxExtend/CNS/QCBox3/movenifti.sh');