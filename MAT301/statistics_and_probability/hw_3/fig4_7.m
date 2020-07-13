fair = [0,0,0,0];
weight = [0,0,0,0];
a=rand;

%random bir şekilde para seçildi
if(a<0.5)
    a=1; %fair coin
else
    a=2; %weight coin
end

for i=1:100
    
    switch a
        case 1%fair
            fc = rand;
            if(fc<0.1)
                %tura
                fair(i)=1;
                a=1;
            else
                %yazi
                fair(i)=0;
                a=2;
            end
            
        case 2%weight
            w_c = rand;
            if(w_c<0.7)
                weight(i)=1;
                a=1;
                %tura
            else
                %yazi
                weight(i)=0;
                a=2;
            end
    end
end


i=[1:1:100];

% Create figure
figure1 = figure('PaperSize',[20.98 29.68]);
% Create axes
axes('Parent',figure1);
% Uncomment the following line to preserve the Y-limits of the axes
ylim([-1 2]);
box('on');
hold('all');
% Create stem
stem1 = stem(fair,'Marker','+','LineStyle','none');
baseline1 = get(stem1,'BaseLine');
set(baseline1,'LineStyle','none');
title('Fair','FontSize',14,'FontAngle','oblique');


% Create figure
figure2 = figure('PaperSize',[20.98 29.68]);
% Create axes
axes('Parent',figure2);
% Uncomment the following line to preserve the Y-limits of the axes
ylim([-1 2]);
box('on');
hold('all');
% Create stem

stem1 = stem(weight,'Marker','+','LineStyle','none');
baseline1 = get(stem1,'BaseLine');
set(baseline1,'LineStyle','none');
title('Weight','FontSize',14,'FontAngle','oblique');

