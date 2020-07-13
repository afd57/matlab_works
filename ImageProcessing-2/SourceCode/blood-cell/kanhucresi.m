I = imread('blood.jpg');
I_gray = rgb2gray(I);
level = graythresh(I_gray);

I_bw = im2bw(I_gray,level);
imshow(I_gray)
I_bw = imcomplement(I_bw);


figure

se = strel('disk',3);
im_er = imerode(I_bw,se);
imf = imfill(im_er,'hole');
imf_er = imerode(imf,se);

im_di = imdilate(imf_er,se);
im_di = imdilate(im_di,se);
cc = bwconncomp(im_di)


[B,L] = bwboundaries(im_di,'noholes');

L = bwlabel(im_di);

s = regionprops(L, 'BoundingBox', 'Extrema', 'Centroid');

boxes = cat(1, s.BoundingBox);
left_edge = boxes(:,1);
[sorted, sort_order] = sort(left_edge);
s2 = s(sort_order);

%imshow(im_er_di, 'InitialMag', 'fit')
imshow(imf)
hold on
for k = 1:numel(s2)
   centroid = s2(k).Centroid;
   %text(centroid(1), centroid(2), sprintf('%d', k));
   
   text(centroid(1),centroid(2),sprintf('%d', k),'FontWeight','bold','EdgeColor',[1 0 0],'Color',[0.8471 0.1608 0]);

end
hold off



