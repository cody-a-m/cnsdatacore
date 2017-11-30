function MotionInfo = ReadECC(MotionPath)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

MID = fopen([MotionPath '/erawdwi.ecclog']);
MotionInfo = [];

while ~feof(MID)
    fgetl(MID); fgetl(MID); fgetl(MID);
    VolMat = textscan(MID, '%f%f%f%f');
    MotionInfo = [MotionInfo; spm_imatrix([VolMat{:}])];
end

%Gradients = textscan(fopen([MotionPath '/dti_gradient.txt']), '%f%f%f');
%Gradients = [Gradients{:}];
Gradients = importdata([MotionPath '/dti_gradient.txt']);
MotionInfo(all(Gradients == 0, 2), :) = [];
MotionInfo = MotionInfo(:, 1:6);

end