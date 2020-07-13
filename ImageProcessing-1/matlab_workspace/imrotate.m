I = fitsread('');
I = mat2gray(I);
J = imrotate(I,-1,'bilinear','crop');
figure, imshow(I)
figure, imshow(J)