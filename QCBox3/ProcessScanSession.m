function ScanSessions = ProcessScanSession(varargin)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

[Conn, ScanSessionIDs, Options] = ParseArgs(struct('caller', 'ProcessScanSession'), varargin{:});
if isempty(Conn.handle)
    return;
end

ScanSessions = struct('ID', num2cell(ScanSessionIDs));

% if Options.uiwait
%     parpool(1);
% else
%     parpool(12);
% end

for i = 1:length(ScanSessionIDs)
    if Options.verbose; disp(['Scan Session ' num2str(ScanSessionIDs(i))]); end;
    Images = sortrows(fetch(Conn, ['CALL getImageIDsByScanSession(' num2str(ScanSessions(i).ID) ');']), 2);
    ScanSessions(i).Images = ProcessImage(Conn, Options, [Images{:, 1}]);
    fprintf(1,'___QC_BEGIN___\nScan Session: %d\n',ScanSessionIDs(i));
    for q=1:length(ScanSessions(i).Images)
	fprintf(1,'%d\t%s\n',ScanSessions(i).Images(q).StudyImages.ID,ScanSessions(i).Images(q).StudyImages.Result)
    end
    fprintf(1,'___QC_END___\n');
end

end
