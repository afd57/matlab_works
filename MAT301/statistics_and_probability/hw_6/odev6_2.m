pk=[0,0,0,0];
X=1:10000;
Y=1:10000;
Z=1:10000;
px=poisspdf(X,5);
py=poisspdf(Y,8);
pz=poisspdf(Z,9);

for i=1:10000
    pk(i)= px(i)*py(i)*pz(i);
end

plot(pk)
