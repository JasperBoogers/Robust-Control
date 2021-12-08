function [] = latex_bodemag(sys,plot_title)
set(groot,'defaulttextinterpreter','latex');  
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
bodemag(sys)
grid on
setoptions(gcr,'MagUnits','abs', 'MagScale', 'log');
warning off
title(append('\textbf{Bode plot of ',plot_title, '}'),'interpreter', 'latex');
warning on
xlabel('Frequency','interpreter', 'latex')
ylabel('Magnitude','interpreter', 'latex')
hs = findall(gcf, 'type', 'axes');
ha = get(hs(3), 'title');
ha.String = ''; % remove the subtitle "From: u1 To: y1"
end

