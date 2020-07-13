%4.29
x=[0,0,0,0];
succes=0;
fail=0;
nknow=0;
for i=1:5 %5 trial
    a=rand;
    if(a<0.5) %P[succes]=1/2
        succes=succes+1;
    elseif(a<0.75)%P[failure]=1/4
        fail = fail+1;
    else%P[dontknow]=1/4
        nknow = nknow +1;
    end
end

x=[succes fail nknow]
%pie(x)