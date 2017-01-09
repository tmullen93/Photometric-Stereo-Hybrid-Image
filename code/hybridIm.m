function hybridim = hybridIm(im1, im2, sigma1, sigma2)
%date directory

%guass for hillary

N=3*sigma1*2;

[X,Y]=meshgrid(-N:N,-N:N);

filt=1./(2.*pi.*sigma1.^2).*exp(-(X.^2+Y.^2)./(2.*sigma1.^2));
imfilt(:,:,1)=filter2(filt,im1(:,:,1));
imfilt(:,:,2)=filter2(filt,im1(:,:,2));
imfilt(:,:,3)=filter2(filt,im1(:,:,3));


%guass for trump

N=3*sigma2*2;

[X,Y]=meshgrid(-N:N,-N:N);
filt=1./(2.*pi.*sigma2.^2).*exp(-(X.^2+Y.^2)./(2.*sigma2.^2));
im2filt(:,:,1)=filter2(filt,im2(:,:,1));
im2filt(:,:,2)=filter2(filt,im2(:,:,2));
im2filt(:,:,3)=filter2(filt,im2(:,:,3));


hybridImage=im2filt+im1-imfilt;

hybridim=(hybridImage-min(min(min(hybridImage))))/(max(max(max(hybridImage)))-min(min(min(hybridImage))));

