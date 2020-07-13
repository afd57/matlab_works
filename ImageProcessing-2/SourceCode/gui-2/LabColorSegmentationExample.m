fabric = imread('ucgen2.jpg');
figure(1), imshow(fabric), title('fabric');


load regioncoordinates;

nColors = 6;
sample_regions = false([size(fabric,1) size(fabric,2) nColors]);

for count = 1:nColors
  sample_regions(:,:,count) = roipoly(fabric,region_coordinates(:,1,count),...
                                      region_coordinates(:,2,count));
end

figure
imshow(sample_regions(:,:,2)),title('sample region for red');

