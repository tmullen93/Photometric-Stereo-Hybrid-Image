%date directory
clear all;
dataDir     = fullfile('C:\Users\Terry\Documents\2016 School Year\Computer Vision\P2\data\hybrid'); % Path to your data directory
%flip and shift hillary
hillaryflip = imread([dataDir,'\hybridHillary.jpg']);
hillaryShift = im2double(flip(hillaryflip,2));
hillaryShift = hillaryShift(1:end-100,50:end,:);
hillary=padarray(hillaryShift,[49 49],'post');
hillarySize=size(hillary);

%shrink trump
trumpBig = imread([dataDir,'\hybridTrump.jpg']);
trumpBig= trumpBig(1:end-150,:,:);
trumpBig = padarray(trumpBig, [49 0]); 
trump = im2double(imresize(trumpBig, [hillarySize(1) hillarySize(2)]));




%guass for hillary
sigma=30;
N=3*sigma*2;

[X,Y]=meshgrid(-N:N,-N:N);

filt=1./(2.*pi.*sigma.^2).*exp(-(X.^2+Y.^2)./(2.*sigma.^2));
hillaryfilt(:,:,1)=filter2(filt,hillary(:,:,1));
hillaryfilt(:,:,2)=filter2(filt,hillary(:,:,2));
hillaryfilt(:,:,3)=filter2(filt,hillary(:,:,3));


%guass for trump
sigma=15;
N=3*sigma*2;

[X,Y]=meshgrid(-N:N,-N:N);
filt=1./(2.*pi.*sigma.^2).*exp(-(X.^2+Y.^2)./(2.*sigma.^2));
trumpfilt(:,:,1)=filter2(filt,trump(:,:,1));
trumpfilt(:,:,2)=filter2(filt,trump(:,:,2));
trumpfilt(:,:,3)=filter2(filt,trump(:,:,3));

size(hillary)
size(trump)
size(trumpfilt)

hybridImage=hillary+trump-trumpfilt;

normHybrid=(hybridImage-min(min(min(hybridImage))))/(max(max(max(hybridImage)))-min(min(min(hybridImage))));
image(vis_hybrid_image(normHybrid(50:end-50,50:end,:)))
