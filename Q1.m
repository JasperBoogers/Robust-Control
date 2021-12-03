clc
clear
close all

%% parameters

% load ss
load('Assignment_Data_SC42145.mat');

% operational parameters
P_rated = 1.8E6; % W
T_rated = 1E4; % Nm
W_rated = 180; % rad/s
V_lin = 16; % m/s

s = tf('s');

%% SISO controller

% plant
G = FWT(1,1); % Beta to Omega
figure(1);
subplot(1,2,1); margin(G);
subplot(1,2,2); pzmap(G);

% controller
wn=0.199;
K1 = -0.39*tf([25,1,1],1); % complex zero at 0.2 rad for increased phase
K2 = tf(1,[1,0]); % integrator for reference tracking
K3 = tf(1, [1,1]); % real pole for noise rejection
notch = tf([(1/(wn))^2, 1/(wn*10), 1], [(1/(wn))^2, 1/(wn*25), 1]);

K = pid(K1*K2*K3);
K.InputName = 'Error (rad/s)';
K.OutputName = 'Beta (deg)';
L = K*G;
CL = feedback(L, 1);
S = 1/(1+L);
T = L/(1+L);

figure(2);
subplot(2,2,1); bode(CL); title('Loop TF');
subplot(2,2,2); bodemag(S); title('Sensitivity'); xlim([1e-3 1e3]);
subplot(2,2,3); bodemag(T); title('Complementary Sensitivity'); xlim([1e-3 1e3]);
subplot(2,2,4); step(CL); title('Step Response of Closed Loop System'); stepinfo(CL)

[GM, PM, Wcg, Wcross] = margin(L);


% put controller in MIMO system
L_mimo = feedback(FWT, K, [1], [1], -1);
figure(3); step(L_mimo(1,3)); title('Disturbance Rejection of step response');
