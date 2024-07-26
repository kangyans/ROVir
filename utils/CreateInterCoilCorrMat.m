function M = CreateInterCoilCorrMat(ims, mask)
    %nims = ims(pos(2): pos(2) + pos(4), pos(1): pos(1) + pos(3), :);
    for i = 1:size(ims, 3)
        nims = ims(:,:,i);
        gx(:,i) = nims(mask > 0);
    end
    M  = gx'*gx;
end