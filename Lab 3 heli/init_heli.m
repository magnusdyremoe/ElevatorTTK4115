% FOR HELICOPTER NR 3-10
% This file contains the initialization for the helicopter assignment in
% the course TTK4115. Run this file before you execute QuaRC_ -> Build 
% to build the file heli_q8.mdl.

% Oppdatert høsten 2006 av Jostein Bakkeheim
% Oppdatert høsten 2008 av Arnfinn Aas Eielsen
% Oppdatert høsten 2009 av Jonathan Ronen
% Updated fall 2010, Dominik Breu
% Updated fall 2013, Mark Haring
% Updated spring 2015, Mark Haring


%%%%%%%%%%% Calibration of the encoder and the hardware for the specific
%%%%%%%%%%% helicopter
Joystick_gain_x = 1;
Joystick_gain_y = -1;


%%%%%%%%%%% Physical constants
g = 9.81; % gravitational constant [m/s^2]
l_c = 0.46; % distance elevation axis to counterweight [m]
l_h = 0.66; % distance elevation axis to helicopter head [m]
l_p = 0.175; % distance pitch axis to motor [m]
m_c = 1.92; % Counterweight mass [kg]
m_p = 0.72; % Motor mass [kg]
J_p = 2*m_p*l_p*l_p;
K_f = 0.125;
K_1 = K_f/J_p;
J_e = m_c*l_c*l_c+2*m_p*l_h*l_h;
K_2 = K_f/J_e;
J_lambda = m_c*l_c*l_c+2*m_p*(l_h*l_h+l_p*l_p);
K_3_ish = K_f/J_lambda; %ish
K_pp = 20;
K_pd = 15.058;
V_s_0 = 8;

%Lab 1&2 above
%Lab 3 below

A = [0,1,0; 0,0,0; 0,0,0]

B = [0,0;0,K_1;K_2,0]

C = [1,0,0;0,0,1]

Q = [10,0,0;0,1,0;0,0,1]

R = [1,0;0,1]


K = lqr(A,B,Q,R)

F = inv(C*inv(B*K-A)*B)





