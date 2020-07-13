clear 
[I map] = imread('blood.tif');
%Averaging
I_avg = nlfilter(I,[5 5], 'mean2');


% Rescale all arrays
I_avg = mat2gray(I_avg);


imshow(I_avg)
%imshow(I)