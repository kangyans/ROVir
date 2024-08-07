function M = CreateMultiInterCoilCorrMat(ims, mask)
    numRegions = size(mask,3);
    gx = [];
    for j = 1:numRegions
        for i = 1:size(ims, 3)
            rmask = squeeze(mask(:,:,j));
            nims = squeeze(ims(:,:,i));
            tgx(:,i) = nims(rmask > 0);
        end
        gx = [gx; tgx];
        clear tgx;
    end
    M  = gx'*gx;

end