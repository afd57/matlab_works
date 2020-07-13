iki=0.333;
dort=iki+0.33;
alti=dort+0.33;
cift=0;
tek=0;
b=7;

for i=1:100
    
    x = randsample(setdiff(1:6, b), 1);
    if x==2;
        cift = cift +1;
    elseif x==4;
        cift = cift +1;
    elseif x==6;
        cift = cift +1;
    else
        tek = tek +1;
    end
end

X=[cift,tek];

figure1 = figure('PaperSize',[20.98 29.68]);
colormap('gray');

axes('Visible','off','Parent',figure1,'PlotBoxAspectRatio',[1.2 1.2 1],...
    'DataAspectRatio',[1 1 1]);

title({'ODEV 3.19'});

% Create textbox
annotation(figure1,'textbox','String',{'CÝFT'},'FontSize',24,...
    'Position',[0.4109 0.4916 0.08828 0.1019],...
    'Color',[1 1 1]);

% Create textbox
annotation(figure1,'textbox','String',{'TEK'},'FontSize',24,...
    'Position',[0.5356 0.4673 0.08047 0.1019]);

pie(X);