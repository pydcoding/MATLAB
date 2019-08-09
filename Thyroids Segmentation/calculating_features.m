 tic; %how many time takes
offsets = [0 1; -1 1;-1 0;-1 -1; 0 -1 ; 1 -1; 1 0 ;1 1];%define how many offsets we use

for k = 1:length(file_result_vector);
    contador = 1;
    for h = 1: length(texture_patches);
        
        pixel_value_matrix = file_result_vector{1, k}{1, h}{1, 1}{1, 2}; %taking matrix of 20x20 from vector
        [glcms,SI] = graycomatrix(pixel_value_matrix,'Offset',offsets);
        
        %Calculating energy, contrast, correlation and homogeneity
        stats = graycoprops(glcms); %Da 8 valores porque glcms tiene una matriz para cada offset
        x_features{1} = stats;
        
        %Calculating entropy
        %entropy_vector = entropy(glcms);
        %x_features{2} = entropy_vector;
        
        %Calculating shade
        shade_vector = shade(glcms,stats);
        
        x_features{2} = shade_vector;
        
        %Calculating prominence
        prominence_vector = prominence(glcms,stats);
        x_features{3} = prominence_vector;
        
        result_features_vector{contador} = x_features;
        contador = contador + 1;
        
    end 
    file_result_vector_features{k} = result_features_vector;
 end
    
    toc;