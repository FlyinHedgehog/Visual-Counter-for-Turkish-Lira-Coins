
% Gokce Sahin 090190306

% main function

clear
close all
clc

imageFiles = {'image1.jpg' 'image2.jpg' 'image3.jpg' 'image4.jpg'... 
              'image5.jpg' 'image6.jpg'};

% print menu           
fprintf("Wellcome!\n");
fprintf("(1) Show total money\n");
fprintf("(2) Show total money on image\n");
fprintf("(0) exit\n");

% get users choice
choice = input("---> ");

switch choice
    case 0
        fprintf("exiting...\n"); pause(2); return;
    case 1
        % show all images
        show_images(imageFiles);
        
        % read image
        [originalImage,flag] = get_image();
        
        % end program if image file is not valid
        if flag == 0
            fprintf("Invalid image file\n"); return;
        end
        
        % count coins (flag = 0, don't show on image)
        fprintf("counting...\n"); pause(1);
        coin_counter(originalImage, 0);
        return;
    case 2
        % show all images
        show_images(imageFiles);
        
        % read image
        [originalImage,flag] = get_image();
        
        % end program if image file is not valid
        if flag == 0
            fprintf("Invalid image file\n"); return;
        end
        
        % count coins (flag = 1, show on image)
        fprintf("counting...\n"); pause(1);
        coin_counter(originalImage, 1);
        return;
    otherwise
        fprintf("invalid choice\n");
        fprintf("exiting...\n"); pause(2); return;
end


