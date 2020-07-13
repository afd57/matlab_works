function [output1 output2 output3 output4 output5 ] = uygulama_teleskop(boyut)
%teleskop
im = imread('teleskop1.jpg');
output1 = im;
im = rgb2gray(im);
output2 = im;
level = graythresh(im);
im_bw = im2bw(im,level);
output3 = im_bw;

%a = imcrop(im_bw);

se3 = strel('disk',boyut);
im_er = imerode(im_bw,se3);
output4 = im_er; 
im_er_di = imdilate(im_er,se3);
output5 = im_er_di;


end