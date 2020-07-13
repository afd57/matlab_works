%imdilate 
bw = imread('text.png');
se = strel('disk',4);
bw2 = imdilate(bw2,se);
imshow(bw), title('Original')
figure, imshow(bw2), title('Dilated')