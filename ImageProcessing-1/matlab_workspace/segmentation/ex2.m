clear all; close all;
[I] = imread('ay.png'); % Load image and
I= rgb2gray(I);
I = im2double(I); % Convert to double
%
range = inline('max(max(x)) -  min (min(x))');
I_f = nlfilter(I,[7 7], range); % Compute local range
I_f = mat2gray(I_f);

imshow(I_f); % Display results
title('"Range" Image');
figure;
subplot(2,1,1); imhist(I); % Display both histograms
title('Original Histogram')
subplot(2,1,2); imhist(I_f);
title('"Range" Histogram');
figure;
subplot(1,3,1); imshow(im2bw(I_f,.22));
subplot(1,3,2); imshow(islice(I_f,.22,.54));
subplot(1,3,3); imshow(im2bw(I_f,.54));