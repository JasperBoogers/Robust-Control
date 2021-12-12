function output = latex_mathChars(input)
    output = replace(input,"Beta",'$\beta');
    output = replace(output,"tau_e","$\tau_e$");
    output = replace(output,"Omega","$\omega$");

end