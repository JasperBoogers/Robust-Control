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
K = pid(0,-0.265,0, 'InputName', 'Error (rad/s)', 'OutputName', 'Beta (deg)');
L = feedback(G*K,1);
S = 1/(1+L);
T = L/(1+L);

figure(2);
subplot(2,2,1); bode(L); title('Controller TF');
subplot(2,2,2); bodemag(S); title('Sensitivity');
subplot(2,2,3); bodemag(T); title('Complementary Sensitivity');
subplot(2,2,4); step(L); stepinfo(L)

% put controller in MIMO system
L_mimo = feedback(FWT, K, [1], [1], -1);
figure(3); step(L_mimo(1,3));

%% Mixed Sensitivity Design
%see next script
