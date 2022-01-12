function [] = latex_step(sys,plot_title, t_lim, linestyle)
set(groot,'defaulttextinterpreter','latex');  
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
sys.OutputName = latex_mathChars(sys.OutputName);

step(sys, t_lim,linestyle);
grid on
warning off
if length(plot_title)>0
    title(append('\textbf{Step plot of ',plot_title,'}'),'interpreter', 'latex');
else
    title("");
end
warning on
xlabel('Time','interpreter', 'latex');
ylabel('Amplitude','interpreter', 'latex');
hs = findall(gcf, 'type', 'axes');
ha = get(hs(2), 'title');
ha.String = ''; % remove the subtitle "From: u1 To: y1"

%axs= findobj(allchild(gcf), 'flat', 'Type', 'axes');
for i_ax = 1:numel(hs)
    hs(i_ax).YLabel.Interpreter = 'latex';
    ha = get(hs(i_ax), 'title');
    ha.Interpreter = 'latex';
end
end