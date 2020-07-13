% Display original and all modifications on the same figure
%
clear all; close all;
N_slice = 5; % Number of sliced for
% sliced image
Level = .75; % Threshold for binary
% image
% Initialize an array to hold 27 frames of mri.tif
% Since this image is stored in tif format, it could be in either
% unit8 or uint16.
% In fact, the specific input format will not matter, since it
% will be converted to double format in this program.
mri = uint8(zeros(128,128,1,27)); % Initialize the image
% array for 27 frames
for frame = 1:27 % Read all frames into
% variable mri
Copyright 2004

[mri(:,:,:,frame), map ] = imread('mri.tif', frame);
end
montage(mri, map); % Display images as a
% montage
% Include map in case
% Indexed
%
frame_select = input('Select frame for processing: ');
I = mri(:,:,:,frame_select); % Select frame for
% processing
%
% Now check to see if image is Indexed (in fact ’whos’ shows it
% is).
if isempty(map) == 0 % Check to see if
% indexed data
I = ind2gray(I,map); % If so, convert to
% intensity image
end
I1 = im2double(I); % Convert to double
% format
%
I_bright = immultiply(I1,1.2); % Increase the contrast
I_invert = imcomplement(I1); % Compliment image
x_slice = grayslice(I1,N_slice); % Slice image in 5 equal
% levels
%
[r c] = size(I1); % Multiple
for i = 1:r % horizontally by a
% Hamming window
I_window(i,:) = I1(i,:) .* hamming(c);
end
for i = 1:c % Multiply vertically
% by same window
I_window(:,i) = I_window(:,i) .* hamming(r);
end
I_window = mat2gray(I_window); % Scale windowed image
BW = im2bw(I1,Level); % Convert to binary
%
figure;
subplot(3,2,1); % Display all images in
% a single plot
imshow(I1); title('Original');
subplot(3,2,2);
imshow(I_bright), title('Brightened');
subplot(3,2,3);
imshow(I_invert); title('Inverted');
subplot(3,2,4);
I_slice = ind2rgb(x_slice, jet % Convert to RGB (see
(N_slice)); % text)
imshow(I_slice); title(’Sliced’); % Display color slices
subplot(3,2,5);
imshow(I_window); title(’Windowed’);
subplot(3,2,6);
imshow(BW); title(’Thresholded’);