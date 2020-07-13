clear
[I] = imread('anahtar.jpg');
[I_gray] = rgb2gray(I);

threshold = graythresh(I);
bw = im2bw(I,threshold);
bw = bwareaopen(bw,30);
% fill a gap in the pen's cap
se = strel('disk',2);
bw = imclose(bw,se);

cc = bwconncomp(bw,4);
bw = im2uint8(bw);
for z=1:3
    I_crop_RGB(:,:,z) = I(:,:,z)-bw;
end

imshow(I_crop_RGB)