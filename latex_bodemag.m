function [] = latex_bodemag(ss,tit)
set(groot,'defaulttextinterpreter','latex');  
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
bodemag(ss)
grid on
setoptions(gcr,'MagUnits','abs', 'MagScale', 'log');
title(tit,'interpreter', 'latex')
xlabel('Frequency','interpreter', 'latex')
ylabel('Magnitude','interpreter', 'latex')
end

