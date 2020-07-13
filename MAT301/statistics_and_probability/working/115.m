number=0;
x=0;
for i=l:4 % set up simulation for 4 coin tosses
if rand(l,l)<0.75 %toss coin with p=0.75
x(i,1)=1; %head
else

x(i,1)=0; % t a i l
end
number=number+x(i,l); % count number of heads
end