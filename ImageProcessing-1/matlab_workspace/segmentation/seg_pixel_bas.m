........input image and convert to double.......
h = fspecial('gaussian',12,2); % Construct gaussian
% filter
I_f = imfilter(I,h,'replicate'); % Filter image
%
I_edge = edge(I_f,'canny',.3); % To remove edge
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