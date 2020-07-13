clear
I = imread('cameraman.tif');
imshow(I)

ffI = fft2(I);
fshtI = fftshift(ffI);

mask1 = ones(256,256);
mask = zeros(256,256);
mask(64:192,64:192) = 1;
mask2 = mask - mask1;

figure
imshow(fshtI)
figure
imshow(mask2 .* fshtI)

f2shtI = fftshift(mask2 .* fshtI);
resim = ifft2(f2shtI);
figure 
Imshow(resim,[]);




