clear
RGB = imread('pillsetc.png');
imshow(RGB);
I = rgb2gray(RGB);
figure
threshold = graythresh(I);
bw = im2bw(I,threshold);
imshow(bw)
% remove all object containing fewer than 30 pixels
bw = bwareaopen(bw,30);
figure
% fill a gap in the pen's cap
se = strel('disk',2);
bw = imclose(bw,se);

% fill any holes, so that regionprops can be used to estimate
% the area enclosed by each of the boundaries
bw = imfill(bw,'holes');
cc = bwconncomp(bw,4)
imshow(bw)


obje = false(size(bw));
obje(cc.PixelIdxList{1}) = true;
imshow(obje);