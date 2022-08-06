function [a,I,bw] = read(img)
    % AIN FATIHAH AIMAN BINTI MOHD YUSSUF
    a = imread(img); % read image
    I=rgb2gray(a); %comment this if the picture is in png, convert to grayscale image
    %I=a; % comment this if the picture is in other format than PNG
    figure, imshow(I),title('Greyscale ');
    figure, imhist(I),title('Graph of Grayscale image'); %look at the hist to get a threshold, e.g., 110
    I = imadjust(I); % Adjust contrast
    figure,imshow(I),title('Increase Contrast')
    bw = imbinarize(I); % Convert to binary image
    bw = bwareaopen(bw,50);
    figure,imshow(bw),title('Binary') % Display binary image
    I = im2bw(bw);  % be sure your image is binary
end