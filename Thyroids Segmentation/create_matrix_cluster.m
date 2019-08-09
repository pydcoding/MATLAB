
%First create the matrix with the choosen feature

file_result_vector_features = importdata('D:\Thyroid_Segmentation_Papers\calculated_features\Subject 3\GE Logiq E9\matlab.mat');
contador= 1;
for k = 1:length(file_result_vector_features);
    for j = 1:length(file_result_vector_features{1, k});
        for i = file_result_vector_features{1, k}{1, j}{1, 3};
          
            matriz(contador) = i;
            contador = contador + 1;
        end
    end

end
cluster_matrix = reshape(matriz,[8,length(matriz)/8]).';

%%
cont =1;
for l = 1:length(file_result_vector);
    for z = 1:length(file_result_vector{1, l});
        for x = file_result_vector{1, l}{1, z}{1, 1}{1, 3};
           
            matrix(cont) = x;
            cont = cont + 1;
        end
    end
end
thyroid_vector = reshape(matrix,[1,length(matrix)]).';
%%

%assign the cluster to which it corresponds
X = all_cluster_matrix;
%X = cluster_matrix;
belonging_cluster = kmeans(X,2);

%%
%See what number correspond to thyroid and which with non-thyroid (el que
%sea menor es tiroide)

%belonging_cluster_bin = belonging_cluster - 1;
%counter1 = 0;
%counter0 = 0;
%for number =1:length(belonging_cluster_bin);
%    if belonging_cluster_bin(number) == 1;
%        counter1 = counter1 + 1;
%    elseif belonging_cluster_bin(number) == 0;
%        counter0 = counter0 + 1;

%    end

%end
%%
%Compare cluster assignation with initial assignation
belonging_cluster_bin = belonging_cluster - 1;
accuracy_numerator  = 0;
for i = 1:length(belonging_cluster_bin);
    if belonging_cluster_bin(i) ~= thyroid_vector(i); %considering thyroid as 0
        accuracy_numerator = accuracy_numerator +1;
    end
end

accuracy = accuracy_numerator/length(belonging_cluster_bin)
