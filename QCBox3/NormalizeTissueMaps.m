function Result = NormalizeTissueMaps(varargin)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[Conn, IDs, Options] = ParseArgs(struct('caller', 'NormalizeTissueMaps'), varargin{:});
StudyImageID = IDs(end);


if ~exist(['/data/DOC/' num2str(StudyImageID)], 'dir')
    unix(['mkdir /data/DOC/' num2str(StudyImageID)]);
end

NeedsProcess = true;

spm_jobman('initcfg');

    CheckFiles = dir(['/data/NIFTI/' num2str(StudyImageID)]);
    CheckFileNames = {CheckFiles.name}';

    TissueMapFiles = regexp(CheckFileNames, '^c.*\.nii', 'match');
    TissueMapFiles = [TissueMapFiles{:}]';
    TissueMapFullPaths = strcat(['/data/NIFTI/' num2str(StudyImageID) '/'], TissueMapFiles);
    NormalizationMatrixFile = regexp(CheckFileNames, '^s.*_seg_sn\.mat','match');
    NormalizationMatrixFile = [NormalizationMatrixFile{:}]';
    NormalizationMatrixFullPath = strcat(['/data/NIFTI/' num2str(StudyImageID) '/'], NormalizationMatrixFile);
    load /home/ndplab/ToolboxExtend/CNS/QCBox3/SPMTemplates/NormalizeTissueMapsProcess
    
    if length(TissueMapFullPaths) == 1
        Vols = spm_vol(TissueMapFullPaths{1});
        TissueMapFullPaths = strcat(TissueMapFullPaths, ', ', num2str((1:length(Vols))'));
    end
    matlabbatch{1}.spm.spatial.normalise.write.subj.matname = NormalizationMatrixFullPath;
    matlabbatch{1}.spm.spatial.normalise.write.subj.resample = TissueMapFullPaths;
    save(['/data/DOC/' num2str(StudyImageID) '/SPMNormalizeTissueMapsProcess' date '_' num2str(int8(cputime))], 'matlabbatch');
    try
        spm_jobman('run', matlabbatch);
        Result = 'Success';
        return;
    catch e
        Result = 'Failed Processing';
        return;
    end

end
