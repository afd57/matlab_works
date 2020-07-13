x=0:15;
y=poisspdf(x,7);
plot(x,y,'+')
xlabel('X');

% Create ylabel
ylabel('Pois(x)');
grid on

figure1 = figure('PaperSize',[20.98 29.68]);

% Create axes
axes('Parent',figure1,'XTick',[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15],...
    'XGrid','on',...
    'Position',[0.13 0.1056 0.775 0.815]);
box('on');
hold('all');

% Create plot
plot(x,y,'MarkerFaceColor',[0 0 0],'MarkerSize',8,'Marker','v',...
    'LineStyle','none');

% Create xlabel
xlabel('X');

% Create ylabel
ylabel('Pois(x)');