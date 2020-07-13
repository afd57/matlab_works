f = imread('cameraman.tif');
%f = zeros(50,50);
F = fft2(f); % Take FT; pad to 128 by 128
F = abs(fftshift(F)); % Shift center; get magnitude
%
%imshow(f,'notruesize'); % Plot object
.....labels..........
figure;
mesh(F); % Plot Fourier transform as function
.......labels..........
%figure;
F = log(F); % Take log function
I = mat2gray(F); % Scale as intensity image
%imshow(I);