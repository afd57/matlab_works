clear
I = imread('zebra.png');
imshow(I)

ffI = fft2(I);
figure 

fshtI = (fftshift(ffI));
imshow(fshtI)
figure 
mesh(mat2gray(log(fshtI)))


%mask = zeros(400,400);
%mask(150:250,150:250) = 1;


%figure
%imshow(fshtI)
%figure
%imshow(mask .* fshtI)

%f2shtI = fftshift(mask .* fshtI);
%resim = ifft2(f2shtI);
%figure 
%Imshow(resim,[]);




