function T=sobel(I)
H1=[1 1 1;0 0 0;-1 -1 -1]
H2=[1 0 -1;1 0 -1;1 0 -1]
B=rgb2gray(I)
A=im2bw(B)
T=nhanchap1(A,H1)
S=nhanchap1(A,H2)
H=(T.^2+S.^2).^0.5
imshow(H)