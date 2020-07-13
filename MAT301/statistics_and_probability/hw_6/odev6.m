Pz=[0,0,0,0];
X=1:10000;
Posx=poisspdf(X,5);
Y=1:10000;
Posy=poisspdf(Y,8);
Z=1:10000;
Posz=poisspdf(Z,9);

for i=1:10000
    Pz(i)= Posx(i)*Posy(i)*Posz(i);
end
plot(Pz,'+')