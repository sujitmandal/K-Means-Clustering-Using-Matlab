% step 1 Read Image...
he = imread('D:\MatchinLarning works\matlab\clustering\LISC Database\Main Dataset\mixt\2.bmp');
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

%step 4.2..
mask3 = pixel_labels==3;
cluster3 = he .* uint8(mask3);

%Step 5: Segment the Nuclei....
L = lab_he(:,:,1);
L_blue = L .* double(mask3);
L_blue = rescale(L_blue);
idx_light_blue = imbinarize(nonzeros(L_blue));

blue_idx = find(mask3);
mask_dark_blue = mask3;
mask_dark_blue(blue_idx(idx_light_blue)) = 0;

blue_nuclei = he .* uint8(mask_dark_blue);
%output for Nuclei..
imshow(blue_nuclei)
title('Blue Nuclei');