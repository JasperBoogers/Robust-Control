function latex_lsim(sys,u,t)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    y = lsim(closed_loop(:,2), u,t);
end

