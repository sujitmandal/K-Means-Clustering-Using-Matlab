% step 1 Read Image...
he = imread('C:\Users\SUJIT MANDAL\Desktop\Lenna.jpg');
%imshow(he), title('H&E image');
text(size(he,2),size(he,1)+15,...
     'Image courtesy of Alan Partin, Johns Hopkins University', ...
     'FontSize',7,'HorizontalAlignment','right');

%step 2 Convert Image from RGB Color Space to L*a*b* Color Space..
lab_he = rgb2lab(he);

%step 3
ab = lab_he(:,:,2:3);
ab = im2single(ab);
nColors = 3;
% repeat the clustering 3 times to avoid local minima
pixel_labels = imsegkmeans(ab,nColors,'NumAttempts',3);

%Step 4: Create Images that Segment the H&E Image by Color....
mask1 = pixel_labels==1;
cluster1 = he .* uint8(mask1);

%step 4.1...
mask2 = pixel_labels==2;
cluster2 = he .* uint8(mask2);
%output of step 4.1
imshow(cluster2)
title('Objects in Cluster 2');