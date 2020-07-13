clear
clc
he = imread('2.jpg');
he1 = he;
h = fspecial('gaussian',5,5);
he = imfilter(he,h,'replicate');

imshow(he)

manualMask = imfreehand;
posns = getPosition(manualMask);
[m,n] = size(he);
excludeMask = poly2mask(posns(:,1),posns(:,2),m,n/3);

%Convert the image to L*a*b* color space using makecform and applycform.


cform = makecform('srgb2lab');
lab_he = applycform(he,cform);

ab = double(lab_he(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);

nColors = 3;
% repeat the clustering 3 times to avoid local minima
[cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', ...
                                      'Replicates',3);

pixel_labels = reshape(cluster_idx,nrows,ncols);
imshow(pixel_labels,[]), title('image labeled by cluster index');

                                  
segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);

for k = 1:nColors
    color = he;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
end

excludeMask = im2double(excludeMask);
sonuc = [0 0];
for k=1:nColors
    I_gray = rgb2gray(segmented_images{k});
    I_gray = im2double(I_gray);
    sonuc(k) = sum(sum(I_gray .* excludeMask));
end

k = find(sonuc == max(sonuc));
figure
imshow(segmented_images{k})
I_gray = rgb2gray(segmented_images{k});

bw = im2bw(I_gray , graythresh(I_gray));
figure , imshow(bw)
se = strel('disk',5);

bw_e = imerode(imclose(bw,se),se);
%bw_e = imerode(bw,se);
%^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
% imfiil kullanmak hatali!!
%bw_e = imfill(bw_e,'hole');
%vvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
figure
imshow(bw_e)
D = -bwdist(~bw_e); 
figure, imshow(D,[]), title('Distance transform of ~bw')

Ld = watershed(D);
bw2 = bw_e;
bw2(Ld == 0) = 0;

imshow(bw2)
mask = imextendedmin(D,2);
D2 = imimposemin(D,mask);
Ld2 = watershed(D2);
bw3 = bw_e;
bw3(Ld2 == 0) = 0;
bw3 = imfill(bw3,'hole');
imshow(bw3)

cc = bwconncomp(bw3)

obje = false(size(bw));
figure
imshow(he1)
hold
[B,L] = bwboundaries(bw3,'noholes');

stats = regionprops(L,'Area','Centroid');
ang=0:0.01:2*pi; 
xp=5*cos(ang);
yp=5*sin(ang);

for k=1:length(B);
     area = stats(k).Area;
     centroid = stats(k).Centroid;
     %plot(centroid(1),centroid(2),'ko')
     %plot(centroid(1)+xp,centroid(2)+yp,'LineWidth',1);
        text(centroid(1),centroid(2),sprintf('%d', k),'FontWeight','bold','EdgeColor',[0 0 0],'Color',[0 0 0]);
end