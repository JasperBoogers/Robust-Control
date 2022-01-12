function output = matrix2latex(M)
format_ = '%s %6.3f'; % print 3 decimal places, align to 6 characters
complex_m = any(imag(M),'all');
if complex_m
    format_ = '%s %6.3f%+6.3fi'; % 
end
% Get matrix dimensions
m = size(M, 1);
n = size(M, 2);

% Create first line
s = sprintf('  \\begin{bmatrix}\n  ');

% Add matrix content
for k = 1:m
    for l = 1:n
        if complex_m
            s = sprintf(format_, s, real(M(k, l)), imag(M(k,l)));
        else
            s =sprintf(format_, s, M(k, l));
        end
        if l < n
            s = sprintf('%s &', s);
        end
    end
    if k < m
        s = sprintf('%s \\cr', s);
    end
    s = sprintf('%s\n  ', s);
end

% Add last line
s = sprintf('%s\\end{bmatrix}\n', s);

% Print the result
%disp(s);
output =s;
end
