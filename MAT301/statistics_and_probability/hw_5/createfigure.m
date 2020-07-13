function createfigure(X1, Y1)
%CREATEFIGURE(X1,Y1)
%  X1:  vector of x data
%  Y1:  vector of y data

%  Auto-generated by MATLAB on 27-Nov-2013 18:54:48

% Create figure
figure1 = figure('PaperSize',[20.98 29.68]);

% Create axes
axes('Parent',figure1,'XTick',[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15],...
    'XGrid','on',...
    'Position',[0.13 0.1056 0.775 0.815]);
box('on');
hold('all');

% Create plot
plot(X1,Y1,'MarkerFaceColor',[0 0 0],'MarkerSize',8,'Marker','v',...
    'LineStyle','none');

% Create xlabel
xlabel('X');

% Create ylabel
ylabel('Pois(x)');
