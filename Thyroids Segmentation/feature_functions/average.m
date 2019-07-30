%Calculating mu
function mu_vector = average(glcms);
    for z = 1:length(glcms);
        mu = 0;
        for i = 1:length(glcms); 
            for j = 1:length(glcms);
                current_matrix = glcms (:,:,z);
                mu = mu + (i*current_matrix(i,j));
            end
        end
        mu_vector(z) =  mu;
    end
end