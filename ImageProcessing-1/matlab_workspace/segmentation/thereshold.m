%x=imread('cameraman.tif'); figure(1), imshow(x);
%bw=im2bw(x,0.1); figure(2), imshow(bw)


% Example 12.1 and Figure 12.2 and Figure 12.3
% Lowpass filter blood cell image, then display histograms
% before and after edge point removal.
% Applies “optimal” threshold routine to both original and
% “masked” images and display the results
%
........input image and convert to double.......
clear
I = imread('plaka1.png');
I = rgb2gray(I);
I = im2double(I);
h = fspecial('gaussian',12,2); % Construct gaussian
% filter
%*****filtre iptal edildi***********
I_f = imfilter(I,h,'replicate'); % Filter image
%I_f = I;
%
I_edge = edge(I_f,'canny',.3); % To remove edge
imshow(I_edge)
I_rem = I_f .* imcomplement(I_edge); % points, find edge,
% complement and use
% as mask
%
subplot(2,2,1); imshow(I_f); % Display images and
% histograms
title('Original Figure');
subplot(2,2,2); imhist(I_f); axis([0 1 0 1000]);
title('Filtered histogram');
subplot(2,2,3); imshow(I_rem);
title('Edge Removed');
subplot(2,2,4); imhist(I_rem); axis([0 1 0 1000]);
title('Edge Removed histogram');

%
figure; % Threshold and
% display images
t1 = graythresh(I); % Use minimum variance
% thresholds
t2 = graythresh(I_f);
subplot(1,2,1); imshow(im2bw(I,t1));
title('Threshold Original Image');
subplot(1,2,2); imshow(im2bw(I_f,t2));
title('Threshold Masked Image');