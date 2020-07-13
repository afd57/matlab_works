%soruyu keseden top çekme gibi modellecem siyah top çekme 0.25 
x=[0,0,0];

for k=1:100 % deney sayýmýz
    for i=1:20 %torbadan 1 den 20 ye kadar top çeker
        a=rand(1,1);
        if(a<0.25)
            x(k)=i;% ilk siyah gelme sýrasýný kaydeder
            break % 2.for dan çýkar 
        end
    end 
end %deney tekrarlanýr

hist(x)