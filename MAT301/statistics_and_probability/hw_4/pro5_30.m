%soruyu keseden top �ekme gibi modellecem siyah top �ekme 0.25 
x=[0,0,0];

for k=1:100 % deney say�m�z
    for i=1:20 %torbadan 1 den 20 ye kadar top �eker
        a=rand(1,1);
        if(a<0.25)
            x(k)=i;% ilk siyah gelme s�ras�n� kaydeder
            break % 2.for dan ��kar 
        end
    end 
end %deney tekrarlan�r

hist(x)