%se = strel('square',3);
se = ones(5);
IM = imread('Resim1.png');
IM = im2bw(IM);
figure
imshow(IM)

im_e = imerode(IM,se);
%figure
%imshow(im_e)
im_d = imdilate(im_e,se);
%figure
%imshow(im_d)
im_d_d = imdilate(im_d,se);
%figure
%imshow(im_d_d)
im_d_d_e = imerode(im_d_d,se);
figure
imshow(im_d_d_e)