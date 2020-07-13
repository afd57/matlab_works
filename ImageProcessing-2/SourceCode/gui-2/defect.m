function [output1  output2 output3 output4] = defect()

I = imread('def3.jpg');
I_g = rgb2gray(I);
output1 = I_g;
I_bw = im2bw(I_g,0.2);
output2 = I_bw;

se = strel('square',2);

im_di = imdilate(I_bw,se);
output3 = im_di;

se = strel('square',5);
im_op = imopen(im_di,se);
output4 = im_op;

end
