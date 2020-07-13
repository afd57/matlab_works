

%[I] = imread('texture3.tif'); % Load image and
I = im2double(I); % Convert to double
%
range = inline('max(max(x))— % Define Range function min (min(x))');
I_f = nlfilter(I,[7 7], range); % Compute local range
I_f = mat2gray(I_f);