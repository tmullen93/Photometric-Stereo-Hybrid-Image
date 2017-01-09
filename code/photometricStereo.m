function [albedoImage, surfaceNormals] = photometricStereo(imArray, lightDirs)
% PHOTOMETRICSTEREO compute intrinsic image decomposition from images
%   [ALBEDOIMAGE, SURFACENORMALS] = PHOTOMETRICSTEREO(IMARRAY, LIGHTDIRS)
%   comptutes the ALBEDOIMAGE and SURFACENORMALS from an array of images
%   with their lighting directions. The surface is assumed to be perfectly
%   lambertian so that the measured intensity is proportional to the albedo
%   times the dot product between the surface normal and lighting
%   direction. The lights are assumed to be of unit intensity.
%
%   Input:
%       IMARRAY - [h w n] array of images, i.e., n images of size [h w]
%       LIGHTDIRS - [n 3] array of unit normals for the light directions
%
%   Output:
%        ALBEDOIMAGE - [h w] image specifying albedos
%        SURFACENORMALS - [h w 3] array of unit normals for each pixel
%
% Author: Subhransu Maji
%
% Acknowledgement: Based on a similar homework by Lana Lazebnik


%%% implement this %% 

[imageHeight, imageWidth] = size(imArray(:,:,1));

N=zeros(imageHeight,imageWidth);
for x=1:imageHeight
    for y=1:imageWidth
        %N(x,y,:)=lightDirs\squeeze(imArray(x,y,:));
        normals=lightDirs\squeeze(imArray(x,y,:));
        N(x,y,1)=normals(1);
        N(x,y,2)=normals(2);
        N(x,y,3)=normals(3);
    end
end
albedoImage=sqrt(N(:,:,1).^2+N(:,:,2).^2+N(:,:,3).^2);

surfaceNormals(:,:,1)=N(:,:,1)./albedoImage;
surfaceNormals(:,:,2)=N(:,:,2)./albedoImage;
surfaceNormals(:,:,3)=N(:,:,3)./albedoImage;


