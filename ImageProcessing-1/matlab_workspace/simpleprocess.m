clear
%I = imread('lena_bw.png');
%I_crop = I(200:300 , 200 : 300);

%I_rotate  = imrotate(I, deg, method, bbox);

I = imread('lena_bw.png');
J = imrotate(I,45,'bilinear','crop');
figure, imshow(I)
figure, imshow(J)