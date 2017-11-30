function Images = ProcessImage_spm12(varargin)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

[Conn, ImageIDs, Options] = ParseArgs(struct('caller', 'ProcessImage'), varargin{:});
if isempty(Conn.handle)
    return;
end

Images = struct('ID', num2cell(ImageIDs));

for i = 1:length(ImageIDs)
    if Options.verbose; disp(['Image ' num2str(ImageIDs(i))]); end;
    StudyImages = fetch(Conn, ['CALL getStudyImageIDsByImage(' num2str(Images(i).ID) ');']);
    Images(i).StudyImages = ProcessStudyImage_spm12(Conn, Options, StudyImages{:,1});
end

end