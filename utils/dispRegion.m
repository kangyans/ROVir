function res = dispRegion(im_ref, pos1, pos2, im_res)
    figure('Name','Region Display');
    subplot(121),
    imshow(abs(im_ref),[]); title('Selected Regions (Reference)')
    h1 = drawrectangle('Label', 'ROI', 'Position', pos1, 'Color', 'r');
    h2 = drawrectangle('Label', 'Unwanted Interference', 'Position', pos2, 'Color', 'b');
    subplot(122),
    imshow(abs(im_res),[]);title('ROVir Results');
end