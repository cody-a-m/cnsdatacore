function DICOMInfo = ReadDICOMInfo(StudyImageID, PoolN)

    %CONCLUSION : DO NOT USE, since file I/O must be performed in serial,
    %doing DICOM reads from multiple files is actually SLOWER in parallel
    %because of (possibly?) the queueing of workers to the file system

    DICOMFiles = dir(['/data/RAWDATA/' num2str(StudyImageID)]);
    DICOMFiles = DICOMFiles(~[DICOMFiles.isdir]);
    DICOMInfoCell = cell(length(DICOMFiles), 1);
    DICOMInfoFields = cell(length(DICOMFiles), 1);
    DICOMInfo = struct.empty();

    delete(gcp('nocreate'));
    parpool(PoolN);
    Tick = cputime;

    parfor i = 1:length(DICOMFiles)
        DICOMInfoCell{i} = struct.empty();
        try
            DICOMInfoCell{i} = dicominfo(['/data/RAWDATA/' num2str(StudyImageID) '/' DICOMFiles(i).name]);
            DICOMInfoFields{i} = fieldnames(DICOMInfoCell{i});
        end
    end
    
    for i = 1:length(DICOMInfoCell)
        j = i + 1;
        if isempty(DICOMInfoCell{i})
            continue;
        end
        DICOMInfo = DICOMInfoCell{i};
        break;
    end
    
    for i = j:length(DICOMInfoCell)
        if isempty(DICOMInfoCell{i})
            continue;
        end
        DICOMInfoCell{i} = rmfield(DICOMInfoCell{i}, setdiff(DICOMInfoFields{i}, fieldnames(DICOMInfo)));
        DICOMInfo = [rmfield(DICOMInfo, setdiff(fieldnames(DICOMInfo), DICOMInfoFields{i})); DICOMInfoCell{i}];
    end
    
    disp([num2str(PoolN) ' : ' num2str(cputime - Tick)]);

end