clear
boundary = [0 0];
se = ones(5);
IM = imread('Resim1.png');
IM = im2bw(IM);

imshow(IM)

cc = bwconncomp(IM);
object_number = cc.NumObjects;

[B,L] = bwboundaries(IM,'noholes');

for i=1:object_number
    obje = false(size(IM));
    obje(cc.PixelIdxList{i}) = true;
    alan = sum(obje);
    alan = sum(alan);
    boundary(i) = alan;
end