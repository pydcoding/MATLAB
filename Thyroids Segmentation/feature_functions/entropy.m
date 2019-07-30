function entropy_vector = entropy(glcms);

for z = 1:length(glcms);
entropy_sum = 0;
    for i = 1:length(glcms);
        for j = 1:length(glcms);
            current_matrix = glcms (:,:,z);
            entropy_sum = entropy_sum + (-log(current_matrix(i,j))*current_matrix(i,j));
        end
     end
     entropy_vector(z) = entropy_sum;
end

end