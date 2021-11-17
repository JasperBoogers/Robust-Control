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

%% SISO controller
SISO_ss = FWT(1,1); % Beta to Omega
figure(1);
subplot(1,2,1); margin(SISO_ss);
subplot(1,2,2); pzmap(SISO_ss);
