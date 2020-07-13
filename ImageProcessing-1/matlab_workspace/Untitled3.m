for m=1:n
    u =rand(1,1);
    if u<=1/8
        x(m,1)=0;y(m,1)=0;
    elseif u>1/8 & u<=1/4
        x(m,1)=0;y(m,1)=1;
    elseif u>1/4 & u<=1/2
        x(m,1)=1;y(m,1)=0;
    else
        x(m,1)=1;y(m,1)=1;
    end
end

if uy<=1^3 
    y(m,1)=0;
else
    y(m,1)=1;
end
