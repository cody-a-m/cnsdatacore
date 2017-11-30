function [Conn, IDs, Options] = ParseArgs(varargin)

Conn = [];
IDs = [];
Options = struct(...
    'uiwait', false,...
    'caller', [],...
    'verbose', false,...
    'connect', false...
);
SkipIter = false;

for i = 1:length(varargin)
    if SkipIter
        SkipIter = false;
        continue;
    end
    if isa(varargin{i}, 'database')
        Conn = varargin{i};
    elseif isa(varargin{i}, 'double')
        for j = 1:length(varargin{i})
            if ~mod(varargin{i}(j), 1) && varargin{i}(j) > 0
                IDs = [IDs; varargin{i}(j)];
            end
        end
    elseif isa(varargin{i}, 'char') && i < length(varargin)
        Options.(varargin{i}) = varargin{i+1};
        SkipIter = true;
    elseif isa(varargin{i}, 'struct')
        FieldNames = fieldnames(varargin{i});
        for j = 1:length(FieldNames)
            Options.(FieldNames{j}) = varargin{i}.(FieldNames{j});
        end
    end
end

if isempty(Conn)
    if Options.verbose; disp('Connecting to DB'); end;
    Conn = ConnectToMySQL();
    if isempty(Conn.handle)
        disp('Failed to Connect');
        return;
    else
        disp('Success');
    end
end

if isempty(IDs) && Options.uiwait
    switch Options.caller
        case 'ProcessUpload'
            ListQuery = fetch(Conn, 'SELECT * FROM Quarantine.UploadInfo ORDER BY SiteID, StudyID');
            ListElements = [char(ListQuery(:,3)), repmat(' ||| ', size(ListQuery, 1), 1), char(ListQuery(:,5)), repmat(' ||| ', size(ListQuery, 1), 1), char(ListQuery(:,6))];
            ListPrompt = 'Select Uploads to Process';
            ListName = 'UploadSelector';
%         case 'ProcessScanSession'
%             ListQuery = fetch(Conn, 'SELECT * FROM Quarantine.UploadInfo ORDER BY NetworkID, StudyID');
%             ListElements = [char(ListQuery(:,3)), repmat(' ||| ', size(UploadQ, 1), 1), char(ListQuery(:,5)), repmat(' ||| ', size(UploadQ, 1), 1), char(ListQuery(:,6))];
%             ListPrompt = 'Select Uploads to Process';
%             ListName = 'UploadSelector';
%         case 'ProcessImage'
%             ListQuery = fetch(Conn, 'SELECT * FROM Quarantine.UploadInfo ORDER BY NetworkID, StudyID');
%             ListElements = [char(ListQuery(:,3)), repmat(' ||| ', size(UploadQ, 1), 1), char(ListQuery(:,5)), repmat(' ||| ', size(UploadQ, 1), 1), char(ListQuery(:,6))];
%             ListPrompt = 'Select Uploads to Process';
%             ListName = 'UploadSelector';
%         case 'ProcessStudyImage'
%             ListQuery = fetch(Conn, 'SELECT * FROM Quarantine.UploadInfo ORDER BY NetworkID, StudyID');
%             ListElements = [char(ListQuery(:,3)), repmat(' ||| ', size(UploadQ, 1), 1), char(ListQuery(:,5)), repmat(' ||| ', size(UploadQ, 1), 1), char(ListQuery(:,6))];
%             ListPrompt = 'Select Uploads to Process';
%             ListName = 'UploadSelector';
        otherwise
            return;
    end
    ListSelect = listdlg('ListString', ListElements, 'ListSize', [500, 600], 'Name', ListName, 'PromptString', ListPrompt);
    IDs = [ListQuery{ListSelect, 1}]';
end

end