%teleskop 
clear
im = imread('teleskop1.jpg');
im = rgb2gray(im);

level = graythresh(im);
im_bw = im2bw(im,level);
figure
imshow(im_bw)

%a = imcrop(im_bw);

se3 = strel('disk',6);
im_er = imerode(im_bw,se3);
im_er_di = imdilate(im_er,se3);

cc = bwconncomp(im_er_di)
figure
imshow(im_er_di)

L = bwlabel(im_er_di);

s = regionprops(L, 'BoundingBox', 'Extrema', 'Centroid');

boxes = cat(1, s.BoundingBox);
left_edge = boxes(:,1);
[sorted, sort_order] = sort(left_edge);
s2 = s(sort_order);

%imshow(im_er_di, 'InitialMag', 'fit')
imshow(im)
hold on
for k = 1:numel(s2)
   centroid = s2(k).Centroid;
   %text(centroid(1), centroid(2), sprintf('%d', k));
   
   text(centroid(1),centroid(2),sprintf('%d', k),'FontWeight','bold','EdgeColor',[1 1 1],'Color',[0.8627 0.8627 0.8627],'BackgroundColor',[0 0 0]);

end
hold off