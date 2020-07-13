M=15;
p=0.8;
Pr=[0,0,0,0];
i=0;

for k=1:15
    Pr(k)  = nchoosek(M,i)*(p^i)*((1-p)^(M-i));
    i=i+1;
end
stem(Pr);

figure1 = figure('PaperSize',[20.98 29.68]);

% Create axes
axes('Parent',figure1,'YGrid','on',...
    'XTick',[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15],...
    'XMinorTick','on',...
    'XGrid','on',...
    'FontName','Imprint MT Shadow');
box('on');
hold('all');

% Create stem
stem(Pr,'MarkerSize',15,'Marker','.','LineWidth',2);

% Create xlabel
xlabel('k','FontSize',12);

% Create ylabel
ylabel('P[k]','FontSize',12);

% Create title
title('M=15 p=0.8','FontSize',14);