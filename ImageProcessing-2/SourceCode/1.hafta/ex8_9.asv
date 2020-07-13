A = imread('text.png');
B = imcrop(A);
se1 = B;se2=~B;
bw = bwhitmiss(A,se1,se2);

[i,j] = find(bw==1);

subplot(1,3,1),imshow(A)
subplot(1,3,2),imagesc(B);axis image;
axis off
subplot(1,3,3),imshow(A);hold on;
plot(j,i,'r*');