files = dir('D:\Thyroid_Segmentation_Papers\Images\subject_8\GE_Logiq_E9\ground_truth\*.png') ; 
addpath ( 'D:\Thyroid_Segmentation_Papers\Images\subject_8\GE_Logiq_E9\ground_truth\')
addpath ( 'D:\Thyroid_Segmentation_Papers\Images\subject_8\GE_Logiq_E9\images\')

projectdir = 'D:\Thyroid_Segmentation_Papers\Images\subject_8\GE_Logiq_E9\ground_truth\';
exist(fullfile('D:\Thyroid_Segmentation_Papers\Images\subject_8\GE_Logiq_E9\ground_truth\','image02.png'),'file')
IMG_WIDTH  = 500
IMG_HEIGHT = 600


SUBDIVISION_NO_W  = 20
SUBIDIVISION_NO_H = 20

% Iterate over the files
for i = 1:length(files)
	thisfile = files(i).name;
end

us_image = imread('D:\Thyroid_Segmentation_Papers\Images\subject_8\GE_Logiq_E9\ground_truth\image02.png')
gt_image = imread('D:\Thyroid_Segmentation_Papers\Images\subject_8\GE_Logiq_E9\images\image02_gt.png')

us_resized_image = padarray(us_image, [45 32], 0, 'post')
gt_resized_image = padarray(gt_image, [45 32], 0, 'post')

w = IMG_WIDTH / SUBDIVISION_NO_W
h = IMG_HEIGHT / SUBIDIVISION_NO_H

result_vector = NaN(SUBDIVISION_NO_W * SUBIDIVISION_NO_H, 1)
cont = 1
for i = 1 to i <= h:
	for j = 1 to j <= w:
		% Store the index of the matrix.
		x{1} = us_resized_image(i, j)

		% Store the matrix.
		x{2} = us_resized_image(w:h)

		% Store whether if it's thyroid or not.
		x{3} = mean(us_resized_image) > 0.6

		result_vector(cont) = x

		cont = cont + 1
    end
end
