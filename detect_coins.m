
% processes the image 

function [binaryImage] = detect_coins(originalImage)
    
    % convert rgb image to grayscale
    image = rgb2gray(originalImage);
    
    % performs median filtering on the image
    image = medfilt2(image);

    % calculate average color
    [col, row] = size(image);
    avgColor = sum(sum(image)) / (col*row);
    
    % assign 1 to the pixels whose value is greater
    % than average + 15 and 0 to the others
    binaryImage = image(:,:,1) > avgColor + 15;
    
    % fill holes
    binaryImage = imfill(binaryImage, 'holes');
    
    % apply morphological operation ('majority')
    binaryImage = bwmorph(binaryImage, 'majority');
    
end





