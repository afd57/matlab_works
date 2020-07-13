I = imread('raporex1.bmp');

I_gray = rgb2gray(I);

bw = im2bw(I_gray,0.7);

imshow()