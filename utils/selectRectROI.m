function mask = selectRectROI(im, num)
%
% [num]: the number of selected regions, including both ROI and
% Interference.
%

    im = abs(im);
    figure(99), imshow(im,[]);
    
    for i = 1:num

        if i == 1
            disp('>Please Select Your ROI:');
            roi = drawrectangle('Color', 'r', 'LineWidth', 1, 'HandleVisibility','off');
        else
            fprintf('>Please Select the %d unwanted Interference Region:\n', i-1);
            roi = drawrectangle('Color', 'b', 'LineWidth', 1,'HandleVisibility','off');
        end
        mask(:,:,i) = createMask(roi);
        disp('>Done!')
    end

end
