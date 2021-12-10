function [] = latex_step(sys,plot_title)
set(groot,'defaulttextinterpreter','latex');  
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
sys.OutputName = latex_mathChars(sys.OutputName);

step(sys);
warning off
title(append('\textbf{Step plot of ',plot_title,'}'),'interpreter', 'latex');
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