[x,map]=imread('spine.tif');
s=uint8(256*ind2gray(x,map)); 
imshow(s)
b=imhist(s);
imshow(s),figure, bar(b)
imshow(s>115 & s<125)
imshow(s>115)