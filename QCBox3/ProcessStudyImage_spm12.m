function StudyImages = ProcessStudyImage_spm12(varargin)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[Conn, StudyImageIDs, Options] = ParseArgs(struct('caller', 'ProcessStudyImage'), varargin{:});
if isempty(Conn.handle)
    return;
end

StudyImages = struct('ID', num2cell(StudyImageIDs));

for i = 1:length(StudyImageIDs)
    if Options.verbose; disp(['StudyImage ' num2str(StudyImageIDs(i))]); end;
    Modality = fetch(Conn, ['SELECT ModalityID FROM StudyImageInfo WHERE StudyImageID =' num2str(StudyImageIDs(i)) ';']);
    switch Modality{1,1}
        case 2
            if Options.verbose; disp([8 ' : Anatomical']); end;
            StudyImages(i).Result = ProcessAnatomicalImage_spm12(Conn, Options, StudyImageIDs(i));
            QCAnatomicalImage(Conn, Options, StudyImageIDs(i));
        case 3
            if Options.verbose; disp([8 ' : Functional']); end;
            StudyImages(i).Result = ProcessFunctionalImage_spm12(Conn, Options, StudyImageIDs(i));
            QCFunctionalImage(Conn, Options, StudyImageIDs(i));
        case 4
            if Options.verbose; disp([8 ' : Diffusion']); end;
            StudyImages(i).Result = ProcessDiffusionImage(Conn, Options, StudyImageIDs(i));
            QCDiffusionImage(Conn, Options, StudyImageIDs(i));
    end
end

end
