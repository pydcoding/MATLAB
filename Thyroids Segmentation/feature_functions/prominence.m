%Calculating prominence
function prominence_vector = prominence(glcms,stats);
for z = 1:length(glcms);
            B = 0;
            for i = 1:length(glcms);
                for j = 1:length(glcms);
                    current_matrix = glcms (:,:,z);
                    mu_vector = average(glcms);
                    var_vector = var(glcms,mu_vector);
                    correlation_value = stats.Correlation(z);
                    if correlation_value > 0;
                        B = B + ((i+j-2*mu_vector(z))^4*current_matrix(i,j))/(4*var_vector(z)^(2)*(1+correlation_value)^2);
                        if B < 0;
                            prominence = -1 * abs(B)^(1/4);
                        elseif B == 0;
                            prominence = 0;
                        elseif B > 0;
                            prominence = 1 * abs(B)^(1/4);
                        end
                    else
                        prominence = NaN;
                    end
                end
            end
            prominence_vector(z) = prominence;
        end
 
end