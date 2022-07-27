
% checks if a file name is valid

function [flag] = check_file(fileName)

    imageFiles = {'image1.jpg' 'image2.jpg' 'image3.jpg' 'image4.jpg'... 
                  'image5.jpg' 'image6.jpg'};
    flag = 0;
    
    % if will work when its condition is > 0
    if find(strcmp(imageFiles, fileName))
        flag = 1;
    end
    
end