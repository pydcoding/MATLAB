%contador = 0
offsets = [0 1; -1 1;-1 0;-1 -1; 0 -1 ; 1 -1; 1 0 ;1 1];%define how many offsets we use

for k = 1:length(file_result_vector);
    
    for h = 1: length(result_vector);
        
        pixel_value_matrix = file_result_vector{k, 1}{h, 1}{1, 2}; %taking matrix of 20x20 from vector
        [glcms,SI] = graycomatrix(pixel_value_matrix,'Offset',offsets);
        
        %Calculating energy, contrast, correlation and homogeneity
        stats = graycoprops(glcms); %Da 8 valores porque glcms tiene una matriz para cada offset
        
        %Calculating entropy
        
        
        %Calculating shade
        
        
        %Calculating prominence
        
        %contador = contador +1;
        
    end
end
