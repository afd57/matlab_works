%resim kesme 
clc
clear
I = imread('elma_agaci.jpg');
%I(:,:,2) = I(:,:,2) - 30;
%I(:,:,1) = I(:,:,1) + 30;

I_gray = rgb2gray(I);
imshow(I_gray)


manualMask = imfreehand;
posns = getPosition(manualMask);
[m,n] = size(I_gray);
excludeMask = poly2mask(posns(:,1),posns(:,2),m,n);

th = im2double(I_gray) .* im2double(excludeMask);
t = [0.1 0.2];
i = 1;
for x=1:(size(th,1))
    for y=1:(size(th,2))
        if th(x,y) ~= 0
            t(i) = th(x,y);
            i=i+1;
        end
    end

end
graythresh(t)
bw = im2bw(I_gray,graythresh(t));

bw = imfill(bw,'hole');
imshow(bw)
se = strel('disk',11);

bw_e = imerode(bw,se);

figure 
imshow(bw_e)





