function [outputArg1,outputArg2] = evalN(N)
omega = logspace(-3,3,150);
Nf = frd(N, omega);



% NS
NS = max(real(eig(N)));

fprintf("Nominal stability: %s (%f) \n", mat2str(NS<1), NS)

% NP
N_22 = Nf(5:end,5:end);

%method1: h_inf norm of N_22
norm(N_22, inf);

%method2: max singular value
NP = max(max(sigma(N_22)));

%method3: structured singular value
NPblk=[2 4]; % 2 inputs to 4 outputs, full perturbation
[mubnds, ~] = mussv(N_22, NPblk, 'c');
muNP = mubnds(:,1);  %upper bound
[muNPinf, muNPw] = norm(muNP, inf);

fprintf("Nominal performance: %s (%f) \n", mat2str(NP<1), NP)

% RS
N_11 = Nf(1:4,1:4);

%structured singular value
RSblk = ones([4,2]);  %diagonal perturbation
[mubnds, ~] = mussv(N_11, RSblk, 'c');
muRS = mubnds(:,1); %upper bound
[muRSinf, muRSw] = norm(muRS, inf);

fprintf("Robust stability: %s (%f) \n", mat2str(muRSinf<1), muRSinf)


% RP
RPblk = [RSblk; NPblk]; 
[mubnds, ~] = mussv(Nf, RPblk, 'c');
muRP = mubnds(:,1);  %upper bound
[muRPinf, muRPw] = norm(muRP, inf);

fprintf("Robust performance: %s (%f) \n", mat2str(muRPinf<1), muRPinf)

end

