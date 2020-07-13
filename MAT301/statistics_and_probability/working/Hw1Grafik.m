N=4;
p=0.2;
pk=0;
for k=1:4,
   combinasyon=factorial(N)/(factorial(N-k)*factorial(k));
   Pk=combinasyon*p^k *(1-p)^(N-k);
   pk(k)=Pk;
end
% Create figure
figure1 = figure('PaperSize',[20.98 29.68],'Name','HW1');
% Create axes
axes('Parent',figure1,'XTick',[1 2 3 4],...
    'Position',[0.1628 0.2039 0.6833 0.721],...
    'FontWeight','bold',...
    'FontAngle','oblique');
box('on');
grid('on');
hold('all');
% Create xlabel
xlabel('k','LineWidth',3);
% Create ylabel
ylabel('P[k]');
% Create title
title('Hw-1','LineWidth',6,'FontSize',14,'FontAngle','oblique');
% Create stem
stem(pk,'LineWidth',3);