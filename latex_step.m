function [] = latex_step(sys,plot_title)
set(groot,'defaulttextinterpreter','latex');  
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
step(sys)
title(append('\textbf{Step plot of ',plot_title,'}'),'interpreter', 'latex')
xlabel('Time','interpreter', 'latex')
ylabel('Amplitude','interpreter', 'latex')
hs = findall(gcf, 'type', 'axes');
ha = get(hs(2), 'title');
ha.String = ''; % remove the subtitle "From: u1 To: y1"
end

