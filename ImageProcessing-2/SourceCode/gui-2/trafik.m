function [output1  output2 output3 output4 output5] = trafik(input)

he = input;
output1 = he;
%Convert the image to L*a*b* color space using makecform and applycform.

redBand = he(:, :, 1); 
greenBand = he(:, :, 2); 
blueBand = he(:, :, 3);

if strcmpi(class(he), 'uint8')
    % Flag for 256 gray levels.
    eightBit = true;
else
    eightBit = false;
end

redThresholdLow = graythresh(redBand);
redThresholdHigh = 255;
greenThresholdLow = 0;
greenThresholdHigh = graythresh(greenBand);
blueThresholdLow = 0;
blueThresholdHigh = graythresh(blueBand);
if eightBit
	redThresholdLow = uint8(redThresholdLow * 255);
	greenThresholdHigh = uint8(greenThresholdHigh * 255);
	blueThresholdHigh = uint8(blueThresholdHigh * 255);
end
% Use values that I know work for the onions and peppers demo images.
redThresholdLow = 85;
redThresholdHigh = 255;
greenThresholdLow = 0;
greenThresholdHigh = 70;
blueThresholdLow = 0;
blueThresholdHigh = 90;

redMask = (redBand >= redThresholdLow) & (redBand <= redThresholdHigh);
greenMask = (greenBand >= greenThresholdLow) & (greenBand <= greenThresholdHigh);
blueMask = (blueBand >= blueThresholdLow) & (blueBand <= blueThresholdHigh);

redObjectsMask = uint8(redMask & greenMask & blueMask);
output2 = redObjectsMask;

I_bw = redObjectsMask;


%I_bw = imcomplement(I_bw);
%im_er = imfill(I_bw,'hole');

%se = strel('square',10);
%im_er = imerode(I_bw,se);
%figure
%imshow(im_er)
%im_er = imfill(im_er,'hole');
se = strel('square',5);
im_C = imclose(I_bw,se);
im_f = imfill(im_C,'hole');
output3 = im_f;
[B,L] = bwboundaries(im_f,'noholes');

for k=1:length(B)
    sz = size(B{k});
    boyut(k) = sz(1)*sz(2);
end
k = find(boyut>(max(boyut)-1));
boundary = B{k};
min_y = min(boundary(:,1));
max_y = max(boundary(:,1));

min_x = min(boundary(:,2));
max_x = max(boundary(:,2));

kose1=[min_x min_y];
kose2=[min_x max_y];
kose3=[max_x min_y];
kose4=[max_x max_y];
%figure
%imshow(im_f)
%hold
%plot(kose1(1),kose1(2),'*')
%plot(kose2(1),kose2(2),'*')
%plot(kose3(1),kose3(2),'*')
%plot(kose4(1),kose4(2),'*')


im_c = imcrop(im_f,[kose1(1) kose1(2) (kose4(1)-kose1(1)) (kose4(2)-kose1(1))]);
output4 = im_c;

%beyaz noktalarýn alaný
alan = sum(im_c);    %*
alan = sum(alan);    %*
%**********************

%þekilin tespiti
alan2 = size(im_c,1)*size(im_c,2);

%ucgen için kontrol

ucgen_alan  = alan2 / 2;
daire = pi * (size(im_c,1)/2)^2;
rect = alan2;


alanlar = [ucgen_alan - alan , daire - alan , rect-alan];

for i=1:length(alanlar)
    if alanlar(i)<0
        alanlar(i) = alanlar(i)*(-1);
    end
end
   
sonuc = min(alanlar);
sonuc = find(alanlar==sonuc);

output5 = sonuc;


end

