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

%% Mixed Sensitivity Design

% obtain plant
MIMO_ss = minreal(tf(FWT(1:2,1:2)));

% calculate RGA
RGA = MIMO_ss.*transpose(inv(MIMO_ss));
[U,S,V] = svd(evalfr(RGA, 0.8*pi));

MIMO_zeros = tzero(MIMO_ss);
MIMO_poles = pole(MIMO_ss);

% build W matrices and generalized plant
Wp11 = tf([1/1.8, 0.8*pi], [1, 0.8*pi*1e-4]);
Wu22 = tf([5e-3, 7e-4, 5e-5], [1, 14e-4, 1e-6]);
Wp = [Wp11 0; 0 0.2];
Wu = [0.01 0; 0 Wu22];
P11=[Wp; zeros(2,2)]; P12=[Wp*MIMO_ss; Wu]; P21=eye(2); P22=MIMO_ss;
P = [P11 P12; P21 P22];

% H-infinity norm synthesis
[K, CL, gamma] = hinfsyn(P, 2, 2);
L_ref = feedback(MIMO_ss, K, [1,2], [1,2], -1);
L_dist = feedback(FWT, K, [1,2], [1,2], -1);