function output = prepareData(imArray, ambientImage)
% PREPAREDATA prepares the images for photometric stereo
%   OUTPUT = PREPAREDATA(IMARRAY, AMBIENTIMAGE)
%
%   Input:
%       IMARRAY - [h w n] image array
%       AMBIENTIMAGE - [h w] image 
%
%   Output:
%       OUTPUT - [h w n] image, suitably processed
%
% Author: Subhransu Maji
%

% Implement this %


[~,~,n]=size(imArray);
oneLightPointArray=zeros(size(imArray));
output=zeros(size(imArray));

for j= 1:n
    % Step 1. Subtract the ambientImage from each image in imArray
   im = imArray(:,:,j)-ambientImage;
    
    % Step 2. Make sure no pixel is less than zero
    im=im-min(min(im));
    
    % Step 3. Rescale the values in imarray to be between 0 and 1
    imMax=max(max(im));
    output(:,:,j) = (im)/(imMax);
end



