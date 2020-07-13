%6.15 kumarhane sorusu....
x=[0,0,0,0];
for i=1:50
    a=rand();
    if(a<=0.125) %0<a<0.125
        %1$
        x(i)=1;
    elseif(a<=0.375) %0.125<a<0.375  
        %2$
        x(i)=2;
    elseif(a<=0.875) %0.375<a<0.875
        %3$
        x(i)=3;
    elseif(a<=1) %0.875<a<1
        %4$
        x(i)=4;
    end
end

hist(x)
