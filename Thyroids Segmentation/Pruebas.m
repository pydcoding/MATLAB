IMG_WIDTH  = 500;
IMG_HEIGHT = 600;

SUBDIVISION_NO_W  = 20;
SUBIDIVISION_NO_H = 20;

projectdir_us = 'D:\Thyroid_Segmentation_Papers\Images\subject_8\GE_Logiq_E9\images\';
projectdir_gt = 'D:\Thyroid_Segmentation_Papers\Images\subject_8\GE_Logiq_E9\ground_truth\';

us_files = dir( fullfile(projectdir_us, '*.png') );
gt_files = dir( fullfile(projectdir_gt, '*.png') );

nFiles_us = length(us_files);
nFiles_gt = length(gt_files);

for i = 1:nFiles_us
    
    current_us_File = fullfile(projectdir_us, us_files(i).name);
    current_gt_File = fullfile(projectdir_gt, gt_files(i).name);
   
    us_image = imread(current_us_File);
    gt_image = imread(current_gt_File);
    
    us_resized_image = padarray(us_image, [45 32], 0, 'post');
    gt_resized_image = padarray(gt_image, [45 32], 0, 'post');
    
    w = IMG_WIDTH / SUBDIVISION_NO_W;
    h = IMG_HEIGHT / SUBIDIVISION_NO_H;

    result_vector = NaN(SUBDIVISION_NO_W * SUBIDIVISION_NO_H, 1);
    cont = 1;
    for i = 1:h
        for j = 1: w
            % Store the index of the matrix.
            x{1} = us_resized_image(i, j)

            % Store the matrix.
            %x{2} = us_resized_image(w:h)

            % Store whether if it's thyroid or not.
            %x{3} = mean(us_resized_image) > 0.6

            result_vector(cont) = x

            cont = cont + 1
        end
    end

end