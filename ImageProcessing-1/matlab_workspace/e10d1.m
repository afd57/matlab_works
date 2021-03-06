%%Constant pattern%%------------------
clear
N = 400;
Nu_cyc = 4;
x = (1:N)*Nu_cyc/N; 
I_sin(1,:) = 0.5 * sin(2*pi*x) + 0.5;
%%------------------------------------
%I_sin matrisimizin 1.satırı fig 1.
%%Bunlardan at alta koyduğumuz zaman daha net anlaşılabilecek bir resim 
%çıkacak fig2.


for i=1:40
    I(i,:) = I_sin(1,:);
end

I_uint8 = im2uint16(I);
I_uint16 = im2uint16(I);
I_double = im2double(I);

IMF = cat(3,I_uint8,I_uint8,I_uint8)
imshow(IMF)