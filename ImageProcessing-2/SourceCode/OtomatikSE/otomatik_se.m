clear
boundary = [0 0];
alanlar= [0 0];
density = [0 0];
se = ones(5);
IM = imread('Resim1.png');
IM = im2bw(IM);

imshow(IM)

cc = bwconncomp(IM);
object_number = cc.NumObjects;

[B,L] = bwboundaries(IM,'noholes');


imshow(IM)
hold
for i=1:object_number
    obje = false(size(IM));
    obje(cc.PixelIdxList{i}) = true;
    alan = sum(obje);
    alan = sum(alan);
    alanlar(i) = alan;
    if 0.02 > (alan*100)/(size(IM,1)*size(IM,2))
        boundary = B{i};
        min_y = min(boundary(:,1));
        max_y = max(boundary(:,1));
        min_x = min(boundary(:,2));
        max_x = max(boundary(:,2));
        
        kose1=[min_x min_y];  
        kose2=[min_x max_y];
        kose3=[max_x min_y];  
        kose4=[max_x max_y];    
        
        plot(kose1(1),kose1(2),'.')
        plot(kose2(1),kose2(2),'.')
        plot(kose3(1),kose3(2),'.') 
        plot(kose4(1),kose4(2),'.')
        im_m2 = [kose4(1)-kose1(1)+1 kose4(2)-kose1(2)+1];
        density(i) = alan / (im_m2(1)*im_m2(2));
    end
    
end

 
 
 
 % strel de olusturan structure elemet ile noise leri and le
 % uyusma oranina gore filtreyi sec
 % hit or miss transform ile secilebiliyor mu ? bkz!!!!!!
 
 