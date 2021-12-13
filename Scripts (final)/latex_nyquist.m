function latex_nyquist(sys, plot_title)
set(groot,'defaulttextinterpreter','latex');  
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
nyquist(sys)
grid on
xlabel('Real axis','interpreter', 'latex')
ylabel('Imaginary axis','interpreter', 'latex')
warning off
title(plot_title,'interpreter', 'latex');
warning on
hs = findall(gcf, 'type', 'axes');
ha = get(hs(2), 'title');
ha.String = ''; % remove the subtitle "From: u1 To: y1"
end
