IMG_WIDTH  = 500;
IMG_HEIGHT = 600;

SUBDIVISION_NO_W  = 20;
SUBIDIVISION_NO_H = 20;

projectdir_us = 'D:\Thyroid_Segmentation_Papers\Images\subject_8\GE_Logiq_E9\images\';
projectdir_gt = 'D:\Thyroid_Segmentation_Papers\Images\subject_8\GE_Logiq_E9\ground_truth\';

us_files = dir(fullfile(projectdir_us, '*.png'));
gt_files = dir(fullfile(projectdir_gt, '*.png'));

nFiles_us = length(us_files);
nFiles_gt = length(gt_files);

file_result_vector = cell(nFiles_us, 1);
%Going through the images of the file
for z = 1:nFiles_us 
    
    current_us_File = fullfile(projectdir_us, us_files(z).name);
    current_gt_File = fullfile(projectdir_gt, gt_files(z).name);
   
    us_image = imread(current_us_File);
    gt_image = imread(current_gt_File);
    
    %Convert image of 541x451 into 600x500
    us_resized_image = padarray(us_image, [45 32], 0, 'post'); 
    gt_resized_image = padarray(gt_image, [45 32], 0, 'post');
    
    w = IMG_WIDTH / SUBDIVISION_NO_W;
    h = IMG_HEIGHT / SUBIDIVISION_NO_H;

    result_vector = cell(SUBDIVISION_NO_W * SUBIDIVISION_NO_H, 1);
  
    cont = 1; 
    % Iterate over the image in 'w' and 'h' steps
    for i = 1:w:(IMG_WIDTH - w); 
        for j = 1:h:(IMG_HEIGHT - h);
            
            % Store the index of the matrix.
            x{1} = [i, j];

            % Store the matrix.
            x{2} = us_resized_image(i:i+w, j:j+h);

            % Store whether it's thyroid or not.
            x{3} = mean(reshape(us_resized_image(i:i+w, j:j+h)',[],1)) > 0.6;

            result_vector{cont} = x;

            cont = cont + 1;
        end
    end
    file_result_vector{z} = result_vector;
end
