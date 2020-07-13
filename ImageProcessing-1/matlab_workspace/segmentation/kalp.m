clear
RGB = imread('iphone.jpg');
%RGB = imread('pillsetc.png');
%RGB = imread('ex3.jpg');
imshow(RGB);
I = rgb2gray(RGB);
threshold = graythresh(I);
bw = im2bw(I,threshold);

% remove all object containing fewer than 30 pixels
if bw(1,1) == 1
    bw = imcomplement(bw);
end
bw = bwareaopen(bw,30);

bw = bwareaopen(bw,30);
% fill a gap in the pen's cap
se = strel('disk',2);
bw = imclose(bw,se);

[B,L] = bwboundaries(bw,'noholes');

% Display the label matrix and draw each boundary

hold on
for k = 1:length(B)
  boundary = B{k};
  plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 3)
end
cc = bwconncomp(bw)
%%cc = bwconncomp(bw,4)
%imshow(bw)

