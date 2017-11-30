function Info = getAnatomicalNIFTIInfo(StudyImageID)

if exist(['/data/NIFTI/' num2str(StudyImageID)], 'dir')
    NIFTIFiles = dir(['/data/NIFTI/' num2str(StudyImageID)]);
    NIFTIFiles = NIFTIFiles(~[NIFTIFiles.isdir]);
    NIFTIFileNames = {NIFTIFiles.name}';
    ConvertedFile = regexp(NIFTIFileNames, '^s.*\.nii$', 'match');
    ConvertedFile = [ConvertedFile{:}]';
    if isempty(ConvertedFile)
        Info.Raw = [];
    else
        Info.Raw = spm_vol(['/data/NIFTI/' num2str(StudyImageID) '/' ConvertedFile{1,1}]);
    end

    GMFile = regexp(NIFTIFileNames, '^c1.*\.nii$', 'match');
    GMFile = [GMFile{:}]';
    if isempty(GMFile)
        Info.GM = [];
    else
        Info.GM = spm_vol(['/data/NIFTI/' num2str(StudyImageID) '/' GMFile{1,1}]);
    end

    WMFile = regexp(NIFTIFileNames, '^c2.*\.nii$', 'match');
    WMFile = [WMFile{:}]';
    if isempty(WMFile)
        Info.WM = [];
    else
        Info.WM = spm_vol(['/data/NIFTI/' num2str(StudyImageID) '/' WMFile{1,1}]);
    end

    CSFile = regexp(NIFTIFileNames, '^c3.*\.nii$', 'match');
    CSFile = [CSFile{:}]';
    if isempty(CSFile)
        Info.CS = [];
    else
        Info.CS = spm_vol(['/data/NIFTI/' num2str(StudyImageID) '/' CSFile{1,1}]);
    end
else
    Info.Raw = [];
    Info.GM = [];
    Info.WM = [];
    Info.CS = [];
end

end