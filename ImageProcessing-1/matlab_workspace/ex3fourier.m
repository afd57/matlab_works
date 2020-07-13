clear
I = imread('plaka.jpeg')
I_resize = imresize(I,[256 256])

I_gray = rgb2gray(I_resize);

figure
imshow(I_gray)
xlabel({'RESIM'});

F_I_gray = fft2(I_gray);
figure

F_I_gray = fftshift(F_I_gray);
imshow(F_I_gray)
%mask1 = ones(256,256);
mask = zeros(256,256);
mask(60:196,60:196) = 1;
%mask = mask1 - mask;
%mask = imread('open_app.bmp');
%mask = imresize(mask,[256 256]);
%mask = ones(256,256) - mask;

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