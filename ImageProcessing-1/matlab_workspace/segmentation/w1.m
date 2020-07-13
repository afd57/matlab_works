I = imread('coin.jpg');
I = rgb2gray(I);
I = im2double(I);
h = fspecial('gaussian',12,12); % Construct gaussian
% filter
%*****filtre iptal edildi***********
I_f = imfilter(I,h,'replicate'); % Filter image
figure

%I_f = I;
%
I_edge = edge(I_f,'canny',.3); % To remove edge
imshow(I_edge)
I_rem = I_f .* imcomplement(I_edge); % points, find edge,
figure
imshow(I_rem)
% complement and use
% as mask
%

t1 = graythresh(I); % Use minimum variance
% thresholds
t2 = graythresh(I_f);
subplot(1,2,1); imshow(im2bw(I,t1));
title('Threshold Original Image');
subplot(1,2,2); imshow(im2bw(I_f,0.9));
title('Threshold Masked Image');
