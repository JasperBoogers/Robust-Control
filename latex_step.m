function [] = latex_step(sys,plot_title)
set(groot,'defaulttextinterpreter','latex');  
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
step(sys);
warning off
title(append('\textit{Step plot of ',plot_title,'}'),'interpreter', 'latex');
warning on
xlabel('Time','interpreter', 'latex');
ylabel('Amplitude','interpreter', 'latex');
hs = findall(gcf, 'type', 'axes');
ha = get(hs(2), 'title');
ha.String = ''; % remove the subtitle "From: u1 To: y1"
end

