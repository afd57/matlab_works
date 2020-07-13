lamda = [1,3,5,7];
poss = [0 0 0 0];
x_ekseni = 1:1:15;

for i=1:4
    for x=1:15
        poss(x) = (exp(-1*lamda(i))*lamda(i)^x)/factorial(x);
    end
    figure
    plot(x_ekseni,poss,'+')
    xlabel('X');
    % Create ylabel
    ylabel('Pois(x)');
end