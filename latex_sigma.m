<<<<<<< HEAD
function [] = latex_sigma(sys,w,color,plot_title)
set(groot,'defaulttextinterpreter','latex');  
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
sigma(sys,w,color)
grid on
setoptions(gcr,'MagUnits','abs', 'MagScale', 'log');
warning off
if nargin>3
    title(append('\textbf{Singular values of ',plot_title, '}'),'interpreter', 'latex');
end
warning on
xlabel('Frequency','interpreter', 'latex')
ylabel('Singular values','interpreter', 'latex')
%hs = findall(gcf, 'type', 'axes');
%ha = get(hs(3), 'title');
%ha.String = ''; % remove the subtitle "From: u1 To: y1"
end

=======
function [] = latex_sigma(sys,plot_title)
set(groot,'defaulttextinterpreter','latex');  
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
sigma(sys)
grid on
setoptions(gcr,'MagUnits','abs', 'MagScale', 'log');
warning off
title(append('\textbf{Singular values of ',plot_title, '}'),'interpreter', 'latex');
warning on
xlabel('Frequency','interpreter', 'latex')
ylabel('Singular values','interpreter', 'latex')
%hs = findall(gcf, 'type', 'axes');
%ha = get(hs(3), 'title');
%ha.String = ''; % remove the subtitle "From: u1 To: y1"
end

>>>>>>> 2bd0a3f9c62ab04981f7b8f65f2c57db9d144676
