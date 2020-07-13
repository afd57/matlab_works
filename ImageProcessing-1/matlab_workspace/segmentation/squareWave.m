function [f] = squareWave(time,per,plotChk,Amin,Amax,res)
%squareWave(t,per,plotChk,Amin, Amax,res) generates a square wave of length 
%t, having period per, minimum amplitude Amin if specified, and maximum
%amplitude Amax if specified. Default Amin and Amax are -1 and 1 
%respectively if not specified. If plotChk is set to 1, then the wave is 
%plotted. Default value of res is 1000.
%
%John Pritchard, 2011
%
%Example
%   [y] = squareWave(500,50);
%   OR
%   [y] = squareWave(500,50,1);
%   OR
%   [y] = squareWave(500,50,1,-1);
%   OR
%   [y] = squareWave(500,50,1,-1,1);
%   OR
%   [y] = squareWave(500,50,1,-1,1,1e5);


num_per = time/(per/2);         %number of periods
if nargin < 4, Amin = 0; Amax = 1; end     %default min/max amp is 0/1
if nargin < 5, Amax = 1; end    %default max amp is 1
if nargin < 6, pts = 1e3;       %default resolution of array is 1e3
else pts = res;  end            %resolution of array if specified

A = zeros(1,pts);               %Voltage array
t = 0:time/length(A):(time-time/length(A)); %time array

val = Amin;                    %Set low Voltage first
for i = 1:1:num_per
    for j = pts/num_per*(i-1)+1:1:pts/num_per*i     %Store values
        A(j) = val; 
    end
    if val == Amin, val = Amax; %This toggles from Amin - Amax
    else val = Amin;
    end
end

%This decides whether to plot or not
if (nargin > 2) && (plotChk == 1)
    plot(t,A)
    if Amin == 0, axis([0 time -Amax 2*Amax]);
    else axis([0 time 2*Amin 2*Amax]);
    end
    xlabel('Time')
    ylabel('Amplitude')
    title('Square Wave Generator')
end

f = A;
end