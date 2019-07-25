%Calculating prominence
function prominence_vector = prominence(glcms);
for z = 1:length(glcms);
            B = 0;
            for i = 1:length(glcms);
                for j = 1:length(glcms);
                    current_matrix = glcms (:,:,z);
                    mu_vector = average(glcms);
                    var_vector = var(glcms,mu_vector);
                    correlation_value = stats.Correlation(z)
                    B = B + ((i+j-2*mu_vector(z))^4*current_matrix(i,j))/(4*var_vector(z)^(2)*(1+correlation_value)^2);
                    if B < 0;
                        prominence = -1 * abs(B)^(1/4);
                    elseif B == 0;
                        prominence = 0;
                    elseif B > 0;
                        prominence = 1 * abs(B)^(1/4);
                    end
                end
            end
            prominence_vector(z) = z + prominence;
        end
        prominence_vector
end