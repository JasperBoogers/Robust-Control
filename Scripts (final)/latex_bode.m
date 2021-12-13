function latex_bode(sys, plot_title)
set(groot,'defaulttextinterpreter','latex');  
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
bode(sys)
grid on
xlabel('Frequency','interpreter', 'latex')
ylabel('Phase','interpreter', 'latex')
warning off
title(append('\textbf{Bode plot of ',plot_title, '}'),'interpreter', 'latex');
warning on
hs = findall(gcf, 'type', 'axes');
ha = get(hs(3), 'title');
ha.String = ''; % remove the subtitle "From: u1 To: y1"
end
