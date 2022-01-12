<<<<<<< HEAD
function [] = latex_bodemag(sys,plot_title,linestyle)
set(groot,'defaulttextinterpreter','latex');  
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
bodemag(sys,linestyle)
grid on
setoptions(gcr,'MagUnits','abs', 'MagScale', 'log');
warning off
title(append('\textbf{Bode plot of ',plot_title, '}'),'interpreter', 'latex');
warning on
xlabel('Frequency','interpreter', 'latex')
ylabel('Magnitude','interpreter', 'latex')
hs = findall(gcf, 'type', 'axes');
% ha = get(hs(3), 'title');
% ha.String = ''; % remove the subtitle "From: u1 To: y1"

for i_ax = 1:numel(hs)
    hs(i_ax).YLabel.Interpreter = 'latex';
    ha = get(hs(i_ax), 'title');
    ha.Interpreter = 'latex';
end


end

=======
function [] = latex_bodemag(sys,plot_title,linestyle)
set(groot,'defaulttextinterpreter','latex');  
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
bodemag(sys,linestyle)
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

>>>>>>> 2bd0a3f9c62ab04981f7b8f65f2c57db9d144676
