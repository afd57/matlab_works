% 1d cosine function
x=-4*pi:pi/20:4*pi;
y=cos(x);
subplot(2,1,1);
plot(x,y);
% Fourier transform of a cosine function of frequency w is 2 diracs at -w and +w
fy=fftshift(fft(y));
subplot(2,1,2);
plot(x,fy);

% Generate a simple 2d wave function
figure;
x=-4*pi:pi/20:4*pi;
y2=cos(x)'*cos(x); 
subplot(2,1,1);
surf(y2);
fy=fft2(y2);
subplot(2,1,2);
% Display real part
imagesc(abs(fftshift(fy)));

% change the frequency and phase of the wave.
figure;
x=-4*pi:pi/20:4*pi;
y2=cos(x)'*cos(2*x+pi/8); 
subplot(2,1,1);
surf(y2);
fy=fft2(y2);
subplot(2,1,2);
imagesc(abs(fftshift(fy)));