lambda =10;
p=0.5;
sonuc = [0,0,0];
tura=0;
for i=1:1000
    M = poissrnd(lambda);
    %%--------------------------
    for k=1:M
        coin = rand;
        if(coin < p)
            %Tura
            tura=tura+1;
        else
            %YAzi
        end
    end
    %%--------------------------
    sonuc(1,i)=tura;
    tura=0;
end
hist(sonuc)