clear
I = imread('def3.jpg');
I_g = rgb2gray(I);
imshow(I_g)
I_bw = im2bw(I_g,0.2);
figure
imshow(I)
se = strel('square',2);

im_di = imdilate(I_bw,se);
figure
imshow(im_di)

se = strel('square',5);
im_op = imopen(im_di,se);
figure

[i,j]= find(im_op==0);
imshow(imread('def3.jpg'))
hold on
plot(j,i,'r+');
