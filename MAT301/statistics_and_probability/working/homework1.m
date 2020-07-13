function homework1(Y1)
%CREATEFIGURE(Y1)
%  Y1:  stem y

%  Auto-generated by MATLAB on 26-Sep-2013 19:50:57

% Create figure
figure1 = figure('PaperSize',[20.98 29.68],'Name','HW1');

% Create axes
axes('Parent',figure1,'XTick',[1 2 3 4],...
    'Position',[0.1628 0.2039 0.6833 0.721],...
    'FontWeight','bold',...
    'FontAngle','oblique');
% Uncomment the following line to preserve the X-limits of the axes
% xlim([0 5]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim([0 0.5]);
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
stem(Y1,'MarkerSize',3,'LineWidth',4,'Color',[1 0 0]);
