clear all
clc

%% parameters

% load ss
load('Assignment_Data_SC42145.mat');

% operational parameters
P_rated = 1.8E6; % W
T_rated = 1E4; % Nm
W_rated = 180; % rad/s
V_lin = 16; % m/s

s = tf('s');

%% Matrix setup
G = minreal(tf(FWT(1,1:2)));

w_hpf = 1;
w_lpf= 1e-2;
LPF = tf(w_lpf, [1, w_lpf]);
HPF = tf([1,0],[1, w_hpf]);

M = 1;
w_b = 1;
A = 1e-4;


Wu = [LPF, 0; 0 HPF];
Wp = tf([1/M, w_b], [1, w_b*A]);
P = [Wp Wp*G; zeros(2) Wu; 1 -G];

% H-infinity norm synthesis
[K, CL, gamma] = hinfsyn(P, 2, 1);
L_ref = feedback(MIMO_ss, K, [1,2], [1,2], -1);
L_dist = feedback(FWT, K, [1,2], [1,2], -1);