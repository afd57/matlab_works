function [output1  output2 output3 output4] = defect2()

I = imread('def1.jpg');
output1 = I;
I_g = rgb2gray(I);
I_bw = im2bw(I_g,0.3);
output2 = I_bw;
se = strel('square',2);

im_di = imdilate(I_bw,se);
output3 = im_di;

se = strel('square',5);

im_op = imopen(im_di,se);
output4 = im_op;

end