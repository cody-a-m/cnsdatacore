function Snapshot = SnapshotAnatomicalImage(FilePath)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%SavePath =  ['/home/ndplab/ToolboxExtend/CNS/QCLib/StructuralImages/' SubjectID '-' ScanDate 'Strip.png'];

imgObj = spm_vol(FilePath);
imgMat = spm_read_vols(imgObj);
if ndims(imgMat) ~=3
    Snapshot = [];
    return;
end
[~, Idx] = max(abs(imgObj.mat(1:3,1:3)), [], 2);

permMat = permute(imgMat, Idx);
if imgObj.mat(1, Idx(1)) < 0
    permMat = flipdim(permMat, 1);
end
if imgObj.mat(2, Idx(2)) < 0
    permMat = flipdim(permMat, 2);
end
if imgObj.mat(3, Idx(3)) < 0
    permMat = flipdim(permMat, 3);
end
grayMat = mat2gray(permMat, [prctile(permMat(:), 3), prctile(permMat(:), 98)]);
matDims = size(grayMat);
grayMat = padarray(grayMat, mod(matDims, 2), 0, 'post');
maxDim = max(matDims);
cubeMat = padarray(grayMat, [(maxDim - size(grayMat, 1))/2, (maxDim - size(grayMat, 2))/2, (maxDim - size(grayMat, 3))/2]);
cubeWid = size(cubeMat, 1);
gridRange = (1:cubeWid);
newRange = (1:0.5:cubeWid);
finMat = interp3(gridRange, gridRange, gridRange', cubeMat, newRange, newRange, newRange');
quadDims = FindQuadPoints(finMat);

%sagImg1 = rot90(squeeze(finMat(quadDims(1, 1),:,:)));
sagImg2 = rot90(squeeze(finMat(quadDims(1, 2),:,:)));
%sagImg3 = rot90(squeeze(finMat(quadDims(1, 3),:,:)));
%corImg1 = rot90(squeeze(finMat(:,quadDims(2, 1),:)));
corImg2 = rot90(squeeze(finMat(:,quadDims(2, 2),:)));
%corImg3 = rot90(squeeze(finMat(:,quadDims(2, 3),:)));
%axImg1 = rot90(squeeze(finMat(:,:,quadDims(3, 1))));
axImg2 = rot90(squeeze(finMat(:,:,quadDims(3, 2))));
%axImg3 = rot90(squeeze(finMat(:,:,quadDims(3, 3))));

Snapshot = [sagImg2, corImg2, axImg2];

end

function [AllQuads] = FindQuadPoints(FullImg)

XSum = squeeze(sum(sum(FullImg, 2), 3));
XCum = cumsum(XSum);
XCumN = XCum/XCum(end);
[~, X1Ind] = min((XCumN - 0.25).^2);
[~, X2Ind] = min((XCumN - 0.50).^2);
[~, X3Ind] = min((XCumN - 0.75).^2);

YSum = squeeze(sum(sum(FullImg, 1), 3));
YCum = cumsum(YSum);
YCumN = YCum/YCum(end);
[~, Y1Ind] = min((YCumN - 0.25).^2);
[~, Y2Ind] = min((YCumN - 0.50).^2);
[~, Y3Ind] = min((YCumN - 0.75).^2);

ZSum = squeeze(sum(sum(FullImg, 1), 2));
ZCum = cumsum(ZSum);
ZCumN = ZCum/ZCum(end);
[~, Z1Ind] = min((ZCumN - 0.6).^2);
[~, Z2Ind] = min((ZCumN - 0.75).^2);
[~, Z3Ind] = min((ZCumN - 0.9).^2);

AllQuads = [X1Ind, X2Ind, X3Ind; Y1Ind, Y2Ind, Y3Ind; Z1Ind, Z2Ind, Z3Ind];

end