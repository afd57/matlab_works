clear
I = imread('def3.jpg');
figure
imshow(I)
I_g = rgb2gray(I);
I_bw = im2bw(I_g,0.4);
figure
imshow(I_bw)
se = strel('square',2);

im_di = imdilate(I_bw,se);
figure
imshow(im_di)

se = strel('square',5);
im_op = imopen(im_di,se);
figure
imshow(im_op)
