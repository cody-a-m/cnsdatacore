function Uploads = ProcessUpload(varargin)
%PROCESSUPLOAD Summary of this function goes here
%   Detailed explanation goes here

[Conn, UploadIDs, Options] = ParseArgs(struct('caller', 'ProcessUpload'), varargin{:});
if isempty(Conn.handle)
    return;
end

Uploads = struct('ID', num2cell(UploadIDs));

for i = 1:length(UploadIDs)
    if Options.verbose; disp(['Upload ' num2str(UploadIDs(i))]); end;
    ScanSessions = fetch(Conn, ['CALL getScanSessionIDsByUpload(' num2str(Uploads(i).ID) ');']);
    Uploads(i).ScanSessions = ProcessScanSession(Conn, Options, [ScanSessions{:, 1}]);
end

end