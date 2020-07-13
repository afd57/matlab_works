I = imread('ucgen.jpg');
redBand = I(:, :, 1); 
greenBand = I(:, :, 2); 
blueBand = I(:, :, 3);

if strcmpi(class(I), 'uint8')
    % Flag for 256 gray levels.
    eightBit = true;
else
    eightBit = false;
end

redThresholdLow = graythresh(redBand);
redThresholdHigh = 255;
greenThresholdLow = 0;
greenThresholdHigh = graythresh(greenBand);
blueThresholdLow = 0;
blueThresholdHigh = graythresh(blueBand);
if eightBit
	redThresholdLow = uint8(redThresholdLow * 255);
	greenThresholdHigh = uint8(greenThresholdHigh * 255);
	blueThresholdHigh = uint8(blueThresholdHigh * 255);
end
% Use values that I know work for the onions and peppers demo images.
redThresholdLow = 85;
redThresholdHigh = 255;
greenThresholdLow = 0;
greenThresholdHigh = 70;
blueThresholdLow = 0;
blueThresholdHigh = 90;


redMask = (redBand >= redThresholdLow) & (redBand <= redThresholdHigh);
greenMask = (greenBand >= greenThresholdLow) & (greenBand <= greenThresholdHigh);
blueMask = (blueBand >= blueThresholdLow) & (blueBand <= blueThresholdHigh);

redObjectsMask = uint8(redMask & greenMask & blueMask);
imshow(redObjectsMask,[])