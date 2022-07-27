
% shows all images

function [] = show_images(files)

    for i = 1:length(files)
        fileName = append('images/', string(files(i)));
        img = imread(fileName);
        subplot(2, round(length(files)/2), i);
        imshow(img);
        title(files(i));
    end

end