RGB = imread('ex3.jpg');
imshow(RGB);
I = rgb2gray(RGB);
threshold = graythresh(I);
bw = im2bw(I,threshold);
imshow(bw)
% remove all object containing fewer than 30 pixels
if bw(1,1) == 1
    bw = imcomplement(bw);
end
bw = bwareaopen(bw,30);

bw = bwareaopen(bw,30);
% fill a gap in the pen's cap
se = strel('disk',2);
bw = imclose(bw,se);


cc = bwconncomp(bw,4)
imshow(bw)
