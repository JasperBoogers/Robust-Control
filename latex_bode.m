function latex_bode(sys, plot_title)
bode(sys)
xlabel('Frequency','interpreter', 'latex')
ylabel('Phase','interpreter', 'latex')
title('Bode plot of '+plot_title,'interpreter', 'latex')
hs = findall(gcf, 'type', 'axes');
ha = get(hs(3), 'title');
ha.String = ''; % remove the subtitle "From: u1 To: y1"
end
