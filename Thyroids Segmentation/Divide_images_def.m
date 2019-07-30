close all, clear all;

IMG_WIDTH  = 500;
IMG_HEIGHT = 600;

SUBDIVISION_NO_W  = 25;
SUBIDIVISION_NO_H = 30;

projectdir_us = 'D:\Thyroid_Segmentation_Papers\Images\subject 8\GE_Logiq_E9\images\';
projectdir_gt = 'D:\Thyroid_Segmentation_Papers\Images\subject 8\GE_Logiq_E9\ground_truth\';

us_files = dir(fullfile(projectdir_us, '*.png'));
gt_files = dir(fullfile(projectdir_gt, '*.png'));

nFiles_us = length(us_files);
nFiles_gt = length(gt_files);

%Going through the images of the file
for z = 1:nFiles_us 
    
    current_us_File = fullfile(projectdir_us, us_files(z).name);
    current_gt_File = fullfile(projectdir_gt, gt_files(z).name);
   
    us_image = imread(current_us_File);
    %figure, imshow(us_image);
    
    gt_image = imread(current_gt_File);
    
    %Convert image of 541x451 into 600x500
    us_resized_image = padarray(us_image, [45 32], 0, 'post'); 
    gt_resized_image = padarray(gt_image, [45 32], 0, 'post');
    
    w = IMG_WIDTH / SUBDIVISION_NO_W;
    h = IMG_HEIGHT / SUBIDIVISION_NO_H;

    count = 1;
    
    % Iterate over the image in 'w' and 'h' steps
    for i = 1:h:(IMG_HEIGHT - h +1); 
        for j = 1:w:(IMG_WIDTH - w +1);
            
            % Store the index of the matrix.
            coord = [j, i];

            % Store the matrix.
            patch = us_resized_image(j:j+h-1, i:i+w -1);

            % Store whether it's thyroid or not.
            label = mean(reshape(us_resized_image(j:j+h-1,i:i+w-1)',[],1)) > 0.6;
            
            new_value = {coord, patch, label};
            
            new_patch = {new_value};
            
            if(sum(sum(patch)) ~= 0) %save only squares that are not black
                hold on;
                %rectangle('Position', [i, j, 20, 20], 'EdgeColor', 'g');
                
                texture_patches{count} = new_patch;
                count = count + 1;
                
            end
        end
    end
   file_result_vector{z} = texture_patches;
end