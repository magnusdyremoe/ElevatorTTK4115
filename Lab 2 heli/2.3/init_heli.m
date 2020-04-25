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
Joystick_gain_x = -2;
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

%K_f = 3.4
%V_s_0 = ((l_h*2*g*m_p)+l_c * m_c * g)/(l_h*K_f)
V_s_0 = 8
K_f = ((l_h*2*g*m_p)+l_c * m_c * g)/(l_h*V_s_0)

%Equations of motion
L_1 = l_p * K_f
L_2 = l_h * K_f
L_3 = l_h * K_f

K_1 = L_1 / J_p
K_2 = L_2 / J_e
K_3_nesten = L_3 / J_lambda %K_3 = L_3 * V_s / J_lambda

%% Exercise 2.3
%PD controller constants

omega_0 = 2;
zeta = 1;

K_pp = (omega_0)^2 / K_1
K_pd = 2 * zeta * omega_o / K_1

%Transfer function
numerator = K_1 * K_pp
denominator = [1, K_pd * K_1, K_pp*K_1]
sys = tf(numerator, denominator)
p = pole(sys)

