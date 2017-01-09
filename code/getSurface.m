function  heightMap = getSurface(surfaceNormals, method)
% GETSURFACE computes the surface depth from normals
%   HEIGHTMAP = GETSURFACE(SURFACENORMALS, IMAGESIZE, METHOD) computes
%   HEIGHTMAP from the SURFACENORMALS using various METHODs.
%
% Input:
%   SURFACENORMALS: height x width x 3 array of unit surface normals
%   METHOD: the intergration method to be used
%
% Output:
%   HEIGHTMAP: height map of object
[imageHeight, imageWidth,~]=size(surfaceNormals);
partX=surfaceNormals(:,:,1)./surfaceNormals(:,:,3);
partY=surfaceNormals(:,:,2)./surfaceNormals(:,:,3);
cumRowPartX=cumsum(partX,2);
cumColPartY=cumsum(partY);
switch method
    case 'column'
        %%% implement this %%%
        leftCol=cumColPartY(:,1);
         heightMap=bsxfun(@plus, cumRowPartX,leftCol);
        
    case 'row'
        %%% implement this %%%
        
        topRow=cumRowPartX(1,:);
        heightMap=bsxfun(@plus, cumColPartY,topRow);
    case 'average'
        %%% implement this %%%
        leftCol=cumColPartY(:,1);
        heightMap=bsxfun(@plus, cumRowPartX,leftCol);
        topRow=cumRowPartX(1,:);
        heightMap=(bsxfun(@plus, cumColPartY,topRow)+heightMap)/2;
        
    case 'random'
        %%% implement this %%%
        N=40;
        heightMap=zeros(imageHeight,imageWidth);
        for i=1:N
            heightMap=heightMap+randomHeightMap(imageHeight, imageWidth,cumRowPartX, cumColPartY);
        end
        
        heightMap=heightMap/N;
        
end
end





function heightMap = randomHeightMap(imageHeight, imageWidth,cumRowPartX, cumColPartY)
heightMap=zeros(imageHeight,imageWidth);
for i=1:imageWidth
    for j=1:imageHeight
        randXold=randi(i);
        randYold=randi(j);
        height=cumRowPartX(1,randXold)+cumColPartY(randYold,randXold);
        
        while randXold~=i ||randYold~=j
            randXnew=randi([randXold,i]);
            height=height+cumRowPartX(randYold,randXnew)-cumRowPartX(randYold,randXold);
            randXold=randXnew;
            if randYold~=j
               
                randYnew = randi([randYold,j]);
                height=height+cumColPartY(randYnew,randXold)-cumColPartY(randYold,randXold);
                
                randYold=randYnew;
            end
        end
        
        heightMap(j,i)=height;
        
    end
end
end
