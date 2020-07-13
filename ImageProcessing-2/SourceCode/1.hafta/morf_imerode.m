%imerode
originalBW = imread('Resim1.png');
originalBW = im2bw(originalBW);
se = strel('square',5);        
erodedBW = imerode(originalBW,se);
imshow(originalBW), figure, imshow(erodedBW)