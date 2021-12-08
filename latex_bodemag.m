function [] = latex_bodemag(sys,plot_title)
set(groot,'defaulttextinterpreter','latex');  
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
bodemag(sys)
grid on
setoptions(gcr,'MagUnits','abs', 'MagScale', 'log');
title('Bode plot of '+plot_title,'interpreter', 'latex')
xlabel('Frequency','interpreter', 'latex')
ylabel('Magnitude','interpreter', 'latex')
end

