% Implementation of ROVir algorithm
% 
% Deaun Kim et al. Region-optimized virtual (ROVir) coils: Localization
% and/or suppression of spatial regions using sensor-domain beamforming.
% MRM (2021).
%
% (c) Kang Yan, University of Virginia.
%
%  Aug, 2024
%

clear;
clc;
close all;

load brain_32ch.mat
IMs = ifft2c(DATA);
[nx, ny, nc] = size(IMs);
IM  = sos(IMs);


mask = selectRectROI(IM, 3);
A = CreateMultiInterCoilCorrMat(IMs, mask(:,:,1));
B = CreateMultiInterCoilCorrMat(IMs, mask(:,:,2:end));

[V, D, ~] = eig(A, B);
for i = 1:size(V,2)
    V(:,i) = normalize(V(:,i),'norm', 2);
end

V = flip(V,2);
kw = reshape(reshape(DATA, [nx*ny, nc])*V, [nx, ny, nc]);
nIMs = ifft2c(kw);

nv = 1:10;
ROVir = sos(nIMs(:,:,nv));

figure(100), imshow(abs(ROVir),[])

figure(2), 
subplot(211),imshow3(abs(IMs) , [], [4, 8]);
subplot(212),imshow3(abs(nIMs), [], [4, 8]);

