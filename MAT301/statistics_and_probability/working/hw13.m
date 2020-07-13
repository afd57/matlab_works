%kodu helpten aldým

x = -2.9:0.1:2.9;
y = randn(100000,1);
hist(y,x) 

%***************************

h = findobj(gca,'Type','patch');
set(h,'FaceColor','r','EdgeColor','w')