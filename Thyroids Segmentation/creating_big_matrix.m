file_result_vector_features = importdata('D:\Thyroid_Segmentation_Papers\calculated_features\Subject 3\GE Logiq E9\matlab.mat');
contador= 1;
for k = 1:length(file_result_vector_features);
    for j = 1:length(file_result_vector_features{1, k});
        for i = file_result_vector_features{1, k}{1, j}{1, 1}.Contrast;
           
            matriz(contador) = i;
            contador = contador + 1;
        end
    end
end
Contrast_matrix = reshape(matriz,[8,length(matriz)/8]).';

contador= 1;
for k = 1:length(file_result_vector_features);
    for j = 1:length(file_result_vector_features{1, k});
        for i = file_result_vector_features{1, k}{1, j}{1, 1}.Energy;
           
            matriz(contador) = i;
            contador = contador + 1;
        end
    end
end
Energy_matrix = reshape(matriz,[8,length(matriz)/8]).';

contador= 1;
for k = 1:length(file_result_vector_features);
    for j = 1:length(file_result_vector_features{1, k});
        for i = file_result_vector_features{1, k}{1, j}{1, 1}.Homogeneity;
           
            matriz(contador) = i;
            contador = contador + 1;
        end
    end
end
Homogeneity_matrix = reshape(matriz,[8,length(matriz)/8]).';

contador= 1;
for k = 1:length(file_result_vector_features);
    for j = 1:length(file_result_vector_features{1, k});
        for i = file_result_vector_features{1, k}{1, j}{1, 1}.Correlation;
           
            matriz(contador) = i;
            contador = contador + 1;
        end
    end
end
Correlation_matrix = reshape(matriz,[8,length(matriz)/8]).';

contador= 1;
for k = 1:length(file_result_vector_features);
    for j = 1:length(file_result_vector_features{1, k});
        for i = file_result_vector_features{1, k}{1, j}{1, 2};
           
            matriz(contador) = i;
            contador = contador + 1;
        end
    end
end
Shade_matrix = reshape(matriz,[8,length(matriz)/8]).';

contador= 1;
for k = 1:length(file_result_vector_features);
    for j = 1:length(file_result_vector_features{1, k});
        for i = file_result_vector_features{1, k}{1, j}{1,3};
           
            matriz(contador) = i;
            contador = contador + 1;
        end
    end
end
Prominence_matrix = reshape(matriz,[8,length(matriz)/8]).';

all_cluster_matrix = [Contrast_matrix,Energy_matrix,Correlation_matrix,Homogeneity_matrix,Prominence_matrix,Shade_matrix];