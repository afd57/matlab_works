I = imread('squirtle.png'); 
filtre = fspecial('gaussian', [10 10], 10); 
I_f = imfilter(I,filtre); 