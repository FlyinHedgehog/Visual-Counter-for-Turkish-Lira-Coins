
% gets file name from user and reads the image

function [image, flag] = get_image()

    flag = 1;
    
    % get file name
    fileName = input(...
        "enter file name (format: file.jpg/jpeg/png...) --->  ", 's');
    
    % check if file name is valid
    if check_file(fileName) == 0
        flag = 0;
        image = 0;
        return;
    end
    
    % read image file
    image = imread(append('images/', fileName));

end