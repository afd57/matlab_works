%soruyu keseden top çekme gibi modellecem siyah top çekme 0.25 
x=[0,0,0];

for i=1:20
    a=rand(1,1);
    if(a<0.25)
        x(i)=i;
    end
end 