function y = latex_lsim(sys,u,t,grid_format,u_2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    y = lsim(sys, u,t);    
    if nargin == 5
        y2 = lsim(sys,u_2,t);
    end

    n_outputs = size(y,2);
    
    
    ex_inputs = grid_format(1); %amount of exogenous inputs
    grid_x = ex_inputs;
    grid_y = n_outputs-grid_x+1;
    
    assert(sum(grid_format)==n_outputs);
    
    for i_plot = 1:n_outputs %amount of exogenous inputs
        if i_plot <= grid_format(1)
            subplot(grid_y,grid_x, i_plot);
            colr = "blue";
            labl = 'Input ';
        elseif i_plot <= grid_format(1)+grid_format(2)
            i_grid = grid_format(1)+1+(i_plot-1-grid_format(1))*2;
            subplot(grid_y,grid_x, [i_grid i_grid+1]);
            colr = "red";
            labl = 'Output ';
        else
            i_grid = grid_x*grid_y-grid_format(3)*2+1 +2*(i_plot-1-grid_format(1)-grid_format(2));

            subplot(grid_y,grid_x, [i_grid i_grid+1]);
            colr = 'magenta';
            labl = 'Control ';
        end
        plot(t,y(:,i_plot))
        if nargin==5
            hold on
            plot(t,y2(:,i_plot))
            if i_plot ==2
                legend("Simulation 1", "Simulation 2")
        end
        grid on
        if (i_plot<n_outputs)&&(i_plot>grid_format(1))
        set(gca,'xticklabel',[])
        else
            xlabel('Time (seconds)')
        end
        outputName = sys.OutputName(i_plot);
        
        outputName = latex_mathChars(outputName);
        

        ylabel(append(labl,outputName),'interpreter', 'latex', "Color", colr);
    end
  %  subplot(grid_y,grid_x,1)
   % title("\textbf{Simulation results}" ,'interpreter', 'latex');

    sgtitle('Simulation results') 
end

