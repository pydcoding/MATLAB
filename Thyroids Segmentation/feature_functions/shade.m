%Calculating shade
function shade_vector = shade(glcms,stats);
for z = 1:length(glcms);
            A = 0;
            for i = 1:length(glcms);
                for j = 1:length(glcms);
                    current_matrix = glcms (:,:,z);
                    mu_vector = average(glcms);
                    var_vector = var(glcms,mu_vector);
                    correlation_value = stats.Correlation(z);
                    if correlation_value > 0;
                        A = A + ((i+j-2*mu_vector(z))^3*current_matrix(i,j))/(var_vector(z)^(3/2)*(sqrt(2*(1+correlation_value)))^3);
                        if A < 0;
                            shade = -1 * abs(A)^(1/3);
                        elseif A == 0;
                            shade = 0;
                        elseif A > 0;
                            shade = 1 * abs(A)^(1/3);
                        end
                    else
                        shade = NaN;
                    end
                end
            end
            shade_vector(z) = shade;
end
end