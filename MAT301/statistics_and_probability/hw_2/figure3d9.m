%birthday.m
clear all
rand('state' ,0)
BD='[0:365]';
event=zeros(10000,1); % initialize to no successful events
for ntrial=1:10000
    for i=1:80
    x(i,1)=ceil(365*rand(1,1)) ; % Random bir �ekilde do�um gunu atad�
    end
    y=sort(x); % arranges birthdays in ascending order
    z=y(2:23)-y(1:22) ; % compares successive birthdays to each other
    w=find(z==0) ; % flags same birthdays
    if length(w)>0
        event (ntrial)=1; % event occurs if one or more birthdays the same
    end
end
prob=sum(event)/10000
