function [mask1, mask2] = selectROI(im, ROIshape)

    im = abs(im);
    figure(99), imshow(im);



        % disp('>Please Select Your ROI:');
        % h1 = imrect;
        % pos1 = getPosition(h1);
        % disp('>Done!')
        % 
        % disp('>Please Select the unwanted Interference:');
        % h2 = imrect;
        % pos2 = getPosition(h2);
        % disp('>Done!');
        % close;


        
        disp('>Please Select Your ROI:');
        if strcmp(ROIshape, 'circle')
            roi = drawcircle;
        elseif strcmp(ROIshape, 'rect')
            roi = drawrectangle;
        end

        mask1 = createMask(roi);

        disp('> Please Select unwanted Interference:')
        if strcmp(ROIshape, 'circle') == 1
            shift = 5;
            roi2 = drawcircle(gca, "Center", roi.Center, 'Radius', roi.Radius + shift);
            mask2 = 1 - createMask(roi2);
        elseif strcmp(ROIshape, 'rect') == 1
            roi2 = drawrectangle;
            mask2 = createMask(roi2);
        end
      
end