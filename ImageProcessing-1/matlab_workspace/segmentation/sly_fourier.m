clear
I = imread('round.jpg');
I_resize = imresize(I,[200 200]);
I_gray = rgb2gray(I_resize);
figure
imshow(I_gray)
xlabel({'RESIM'});
F_I_gray = fft2(I_gray);
figure
F_I_gray = fftshift(F_I_gray);
imshow(F_I_gray)
%*************************mask********************************
mask = zeros(200,200);
mask(80:120,80:120) = 1;
mask = imcomplement(mask);

figure
imshow(mask)
xlabel({'MASK'});
figure
imshow(mask.*F_I_gray)
xlabel({'mask.*F_I_gray'});
F_I_gray = mask.*F_I_gray;
F_I_gray = fftshift(F_I_gray);
figure
imshow(F_I_gray)
resim2 = ifft2(F_I_gray);
figure
imshow(resim2,[])
xlabel({'Filitre ile carpilmis resim'});