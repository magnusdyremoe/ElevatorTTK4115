% FOR HELICOPTER NR 3-10
% This file contains the initialization for the helicopter assignment in
% the course TTK4115. Run this file before you execute QuaRC_ -> Build 
% to build the file heli_q8.mdl.

% Oppdatert h�sten 2006 av Jostein Bakkeheim
% Oppdatert h�sten 2008 av Arnfinn Aas Eielsen
% Oppdatert h�sten 2009 av Jonathan Ronen
% Updated fall 2010, Dominik Breu
% Updated fall 2013, Mark Haring
% Updated spring 2015, Mark Haring


%%%%%%%%%%% Calibration of the encoder and the hardware for the specific
%%%%%%%%%%% helicopter
Joystick_gain_x = -0.5;
Joystick_gain_y = -12;


%%%%%%%%%%% Physical constants
g = 9.81; % gravitational constant [m/s^2]
l_c = 0.46; % distance elevation axis to counterweight [m]
l_h = 0.66; % distance elevation axis to helicopter head [m]
l_p = 0.175; % distance pitch axis to motor [m]
m_c = 1.92; % Counterweight mass [kg]
m_p = 0.72; % Motor mass [kg]

%Inhertia
J_p = 2*m_p*l_p*l_p;
J_e = m_c*l_c*l_c+2*m_p*l_h*l_h;
J_lambda = m_c*l_c*l_c+2*m_p*(l_h*l_h+l_p*l_p);

%Motor constant
K_f = 3.4

%Equations of motion
L_1 = l_p * K_f
L_2 = l_h * K_f
L_3 = l_h * K_f
V_s_0 = ((l_h*2*g*m_p)+l_c * m_c * g)/(L_2)
K_1 = L_1 / J_p
K_2 = L_2 / J_e
K_3_nesten = L_3 / J_lambda %K_3 = L_3 * V_s / J_lambda



