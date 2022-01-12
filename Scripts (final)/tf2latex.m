function output = tf2latex(tf)
    syms s
    for i_x = 1:size(tf,1)
        for i_y = 1:size(tf,2)
%             TF1 = tf(i_x,i_y);
%             fracparts=regexp(evalc('TF1'),'([^\n]*)\n[ ]*-[-]+[ ]*\n([^\n]*)','tokens');
%             TFlatex=['T(z)=\frac{' fracparts{1}{1} '}{' fracparts{1}{2} '}'];
            tf1 = tf(i_x,i_y);
            [num,den]=tfdata(tf1);
            d1 = digits(4); % records and sets accuracy
            TFlatex = latex(vpa(poly2sym(cell2mat(num),s)/poly2sym(cell2mat(den),s)));
            digits(d1); 
            name = latex_mathChars(tf1.InputName) + " \to " +latex_mathChars(tf1.OutputName)+"&=";
            disp(append(name,TFlatex));
        end
    end
end
