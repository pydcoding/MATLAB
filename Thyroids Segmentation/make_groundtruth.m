%%Author: Prabal Poudel
%%Date: 04/07/2019

close all; clear all;

%Change this path for different subjects
k = 'D:\Thyroid_Segmentation_Papers\Images\subject 16\';
PatientNames = dir(fullfile(k));
PatientNames = {PatientNames.name}';
N1 = num2str(PatientNames{3});
N2 = num2str(PatientNames{4});
N3 = num2str(PatientNames{5});
N4 = num2str(PatientNames{6});

GTN1 = strcat(k,N1,'\','ground_truth\');
IMGN1 = strcat(k,N1,'\','images\');
%Make ground_truth and image folders if they do not exist
if ~exist(GTN1, 'dir')
       mkdir(GTN1)
end
if ~exist(IMGN1, 'dir')
       mkdir(IMGN1)
end

GTN2 = strcat(k,N2,'\','ground_truth\');
IMGN2 = strcat(k,N2,'\','images\');
%Make ground_truth and image folders if they do not exist
if ~exist(GTN2, 'dir')
       mkdir(GTN2)
end
if ~exist(IMGN2, 'dir')
       mkdir(IMGN2)
end

GTN3 = strcat(k,N3,'\','ground_truth\');
IMGN3 = strcat(k,N3,'\','images\');
%Make ground_truth and image folders if they do not exist
if ~exist(GTN3, 'dir')
       mkdir(GTN3)
end
if ~exist(IMGN3, 'dir')
       mkdir(IMGN3)
end

GTN4 = strcat(k,N4,'\','ground_truth\');
IMGN4 = strcat(k,N4,'\','images\');
%Make ground_truth and image folders if they do not exist
if ~exist(GTN4, 'dir')
       mkdir(GTN4)
end
if ~exist(IMGN4, 'dir')
       mkdir(IMGN4)
end

ImagePath1 = strcat(k,N1,'/');
ImagePath11 = dir(fullfile(ImagePath1));
ImagePath11 = {ImagePath11.name}';
Vol1 = dicomread(strcat(ImagePath1,num2str(ImagePath11{3})));
metadata1 = dicominfo(strcat(ImagePath1,num2str(ImagePath11{3})));

ImagePath2 = strcat(k,N2,'/');
ImagePath22 = dir(fullfile(ImagePath2));
ImagePath22 = {ImagePath22.name}';
Vol2 = dicomread(strcat(ImagePath2,num2str(ImagePath22{3})));
metadata2 = dicominfo(strcat(ImagePath2,num2str(ImagePath22{3})));

ImagePath3 = strcat(k,N3,'/');
ImagePath33 = dir(fullfile(ImagePath3));
ImagePath33 = {ImagePath33.name}';
Vol3 = dicomread(strcat(ImagePath3,num2str(ImagePath33{3})));

ImagePath4 = strcat(k,N4,'/');
ImagePath44 = dir(fullfile(ImagePath4));
ImagePath44 = {ImagePath44.name}';
Vol4 = dicomread(strcat(ImagePath4,num2str(ImagePath44{3})));

%CHANGE THESE 3 VALUES FOR IMAGES FROM DIFFERENT MACHINES
v = Vol1;
image_location = IMGN1;
gt_location = GTN1;

for i = 1:size(v,4)
    
    imshow(v(:,:,:,i))
    I = v(:,:,:,i);
    
    %writing the original image
    imwrite(I, strcat(image_location, 'image0', num2str(i), '.png'));
    
    disp('Please mark the thyroid region.');

    % Draw ground truth contour for thyroid only if it is visible, else
    % just click once in the image
    
    h1 = imfreehand('Closed',true);
    F = createMask(h1);
    filename_to_write = strcat('image0', num2str(i), '_gt.png') ;
    imwrite(F,strcat(gt_location,filename_to_write));
    
end
