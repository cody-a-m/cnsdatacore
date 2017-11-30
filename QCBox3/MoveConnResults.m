ConnMats = struct('file', cellstr(spm_select(inf, 'mat')));
DB = ConnectToMySQL();
for i = 1:length(ConnMats)
    ConnFile = dir(ConnMats(i).file);
    ConnMats(i).date = str2double(datestr(ConnFile.date, 'yyyymmdd'));
    ConnMat = load(ConnMats(i).file);
    if length(ConnMat.CONN_x.Setup.functional) ~= length(ConnMat.CONN_x.Setup.structural)
        continue;
    end
    ConnMats(i).scans = struct.empty();
    for j = 1:length(ConnMat.CONN_x.Setup.functional)
        ConnMats(i).scans(j).ConnIdx = j;
        ConnMats(i).scans(j).Path = ConnMat.CONN_x.Setup.structural{1,j}{1,1};
        FuncRX = regexp(ConnMat.CONN_x.Setup.functional{1,j}{1,1}{1,1}(1,:), '(A\d{4})_(\d{8})', 'tokens');
        StrcRX = regexp(ConnMat.CONN_x.Setup.structural{1,j}{1,1}(1,:), '(A\d{4})_(\d{8})', 'tokens');
        if isempty(FuncRX) || isempty(StrcRX)
            ConnMats(i).scans(j).error = 'Regex bad match';
            continue;
        end
        if length(FuncRX{1,1}) ~= 2 || length(StrcRX{1,1}) ~= 2
            ConnMats(i).scans(j).error = 'Regex bad match';
            continue;
        end
        if ~strcmp(FuncRX{1,1}{1,1}, StrcRX{1,1}{1,1})
            ConnMats(i).scans(j).error = 'Strc/Funx bad match';
            continue;
        end
        ConnMats(i).scans(j).subject = FuncRX{1,1}{1,1};
        ScanDate = FuncRX{1,1}{1,2};
        ConnMats(i).scans(j).date = [ScanDate(1:4) '-' ScanDate(5:6) '-' ScanDate(7:8)];
        Q = fetch(DB, ['SELECT * FROM StudyImageInfo WHERE SubjectName = "' ConnMats(i).scans(j).subject '" AND ScanDate ="' ConnMats(i).scans(j).date '" AND ModalityID = 3;']);
        if isempty(Q)
            ConnMats(i).scans(j).error = 'No DB Match';
            continue;
        end
        if size(Q, 1) > 1
            ConnMats(i).scans(j).error = 'DB Match Not Unique';
            continue;
        end
        ConnMats(i).scans(j).StudyImageID = Q{1,1};
    end
end