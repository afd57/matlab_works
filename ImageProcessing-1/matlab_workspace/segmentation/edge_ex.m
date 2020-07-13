I = imread('plaka1.png');
imshow(I)
I = rgb2gray(I);
I = im2double(I);
h = fspecial('gaussian',12,12); % Construct gaussian

I_f = imfilter(I,h,'replicate'); % Filter image
I_edge = edge(I_f,'canny',.3); % To remove edge
figure
imshow(I_edge)