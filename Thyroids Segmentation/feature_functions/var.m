%Calculating var
function  var_vector = var(glcms, mu_vector);
    for z = 1:length(glcms);
        var = 0;
        for i = 1:length(glcms); 
            for j = 1:length(glcms);
                current_matrix = glcms (:,:,z);
                var = var + (current_matrix(i,j)*(i - mu_vector(z))^2);
            end
        end
        var_vector(z) = var;
    end
end