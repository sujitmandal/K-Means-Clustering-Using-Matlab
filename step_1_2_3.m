% step 1 Read Image...
he = imread('D:\MatchinLarning works\matlab\clustering\LISC Database\Main Dataset\neut\38.bmp');
%imshow(he), title('H&E image');
text(size(he,2),size(he,1)+15,...
     'Image courtesy of Alan Partin, Johns Hopkins University', ...
     'FontSize',7,'HorizontalAlignment','right');

%step 2 Convert Image from RGB Color Space to L*a*b* Color Space..
lab_he = rgb2lab(he);

%Step 3: Classify the Colors in 'a*b*' Space Using K-Means Clustering..
ab = lab_he(:,:,2:3);
ab = im2single(ab);
nColors = 3;
% repeat the clustering 3 times to avoid local minima
pixel_labels = imsegkmeans(ab,nColors,'NumAttempts',3);

%output of step 3
imshow(pixel_labels,[])
title('Image Labeled by Cluster Index');