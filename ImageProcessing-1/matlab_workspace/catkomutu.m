A = imread('cameraman.tif');
A = im2double(A);
fun = @(x) median(x(:));
B = nlfilter(A,[3 3],fun);
imshow(A), figure, imshow(B)