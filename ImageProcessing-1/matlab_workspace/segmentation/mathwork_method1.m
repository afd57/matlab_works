clear

I = imread ( 'rice.png' );
imshow (I)
figure
background = imopen(I,strel('disk',15));
I2 = I - background;
imshow(I2)

I3 = imadjust(I2);
imshow(I3);

level = graythresh(I3);
bw = im2bw(I3,level);
bw = bwareaopen(bw, 50);
imshow(bw)

cc = bwconncomp(bw)
