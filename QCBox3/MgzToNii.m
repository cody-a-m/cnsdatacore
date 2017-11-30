function [Success, Message] = MgzToNii(StudyImageID)
%UNTITLED26 Summary of this function goes here
%   Detailed explanation goes here

if ~isnumeric(StudyImageID)
    Success = false;
    Message = 'Input must be numeric ID';
    return;
end

if ~exist(['/data/FS/' num2str(StudyImageID) '/mri/aparc.a2009s+aseg.mgz'], 'file')
    Success = false;
    Message = 'Aparc file does not exist';
    return;
end

if ~exist(['/data/FS/' num2str(StudyImageID) '/nii'], 'dir');
    Result = unix(['mkdir /data/FS/' num2str(StudyImageID) '/nii']);
    if Result ~= 0
        Success = false;
        Message = 'Can not create directory';
        return;
    end
end

disp('unzipping');
try
    AparcFiles = gunzip(['/data/FS/' num2str(StudyImageID) '/mri/aparc.a2009s+aseg.mgz'], ['/data/FS/' num2str(StudyImageID) '/nii']);
    BrainFiles = gunzip(['/data/FS/' num2str(StudyImageID) '/mri/brain.mgz'], ['/data/FS/' num2str(StudyImageID) '/nii']);
catch e
    Success = false;
    Message = e.message;
    return
end

FID = fopen(AparcFiles{1}, 'r', 'b');
if FID == -1
    Success = false;
    Message = 'Can not open Aparc file';
    return;
end

disp('reading');
try
    fread(FID, 1, 'uint32'); %version
    Dims = fread(FID, 3, 'uint32');
    NFrames = fread(FID, 1, 'uint32');
    Type = fread(FID, 1, 'uint32');
    switch Type
        case 0
            VoxType = 'uchar';
        case 1
            VoxType = 'uint32';
        case 3
            VoxType = 'float32';
        case 4
            VoxType = 'short';
    end
    fread(FID, 1, 'uint32'); %dof
    fread(FID, 1, 'short'); %RASFlag, assume true
    Spacing = fread(FID, 3, 'float32');
    LinMat = reshape(fread(FID, 9, 'float32'), 3, 3);
    AffVec = fread(FID, 3, 'float32');
    AffMat = [LinMat*diag(Spacing) AffVec; [0 0 0 1]];
    frewind(FID);
    fread(FID, 71, 'uint32'); %headers
    Volume = reshape(fread(FID, prod(Dims)*NFrames, VoxType), NFrames, Dims(1), Dims(2), Dims(3));
    Volume = squeeze(Volume(1,:,:,:));
    fclose(FID);
catch e
    Success = false;
    Message = e.message;
    fclose(FID);
    return;
end

disp('writing');
Headers = struct(...
    'fname', ['/data/FS/' num2str(StudyImageID) '/nii/aparc.a2009s+aseg.nii'],...
    'dim', Dims',...
    'dt', [4, 0],...
    'mat', AffMat,...
    'pinfo', [1;0;0]);

try
    spm_write_vol(Headers, Volume);
catch e
    Success = false;
    Message = e.message;
    return;
end

try
    load('/home/ndplab/ToolboxExtend/CNS/QCBox3/Dictionary/ConnDestrieuxDictionary.mat');
catch e
    Success = false;
    Message = e.message;
    return;
end

for i = 1:height(ConnDestrieuxDictionary)
    ROI = Volume;
    ROI(ROI ~= ConnDestrieuxDictionary.FullIndex(i)) = 0;
    ROI(ROI ~= 0) = 1;
    Headers.fname = ['/data/FS/' num2str(StudyImageID) '/nii/' ConnDestrieuxDictionary.HFullName{i} '.nii'];
    try
        spm_write_vol(Headers, ROI);
    end
end

FID = fopen(BrainFiles{1}, 'r', 'b');
if FID == -1
    Success = false;
    Message = 'Can not open Brain file';
    return;
end

disp('reading');
try
    fread(FID, 1, 'uint32'); %version
    Dims = fread(FID, 3, 'uint32');
    NFrames = fread(FID, 1, 'uint32');
    Type = fread(FID, 1, 'uint32');
    switch Type
        case 0
            VoxType = 'uchar';
        case 1
            VoxType = 'uint32';
        case 3
            VoxType = 'float32';
        case 4
            VoxType = 'short';
    end
    fread(FID, 1, 'uint32'); %dof
    fread(FID, 1, 'short'); %RASFlag, assume true
    Spacing = fread(FID, 3, 'float32');
    LinMat = reshape(fread(FID, 9, 'float32'), 3, 3);
    AffVec = fread(FID, 3, 'float32');
    AffMat = [LinMat*diag(Spacing) AffVec; [0 0 0 1]];
    frewind(FID);
    fread(FID, 71, 'uint32'); %headers
    Volume = reshape(fread(FID, prod(Dims)*NFrames, VoxType), NFrames, Dims(1), Dims(2), Dims(3));
    Volume = squeeze(Volume(1,:,:,:));
    fclose(FID);
catch e
    Success = false;
    Message = e.message;
    fclose(FID);
    return;
end

disp('writing');
Headers = struct(...
    'fname', ['/data/FS/' num2str(StudyImageID) '/nii/brain.nii'],...
    'dim', Dims',...
    'dt', [4, 0],...
    'mat', AffMat,...
    'pinfo', [1;0;0]);

try
    spm_write_vol(Headers, Volume);
catch e
    Success = false;
    Message = e.message;
    return;
end

Success = true;
Message = 'Success';

end

