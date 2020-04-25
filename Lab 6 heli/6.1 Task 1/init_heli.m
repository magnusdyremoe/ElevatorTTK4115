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
Joystick_gain_x = -1;
Joystick_gain_y = -1.5;


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
K_3_nesten = L_3 / J_lambda  %K_3 = L_3 * V_s / J_lambda
K_3 = (L_3/J_lambda) * V_s_0


%PD controller constants
K_pp = 4;
K_pd = 1.5;
eq = 0.5; %apparently the equilibrium point for elevation

%LQR lab 3
%matrices from excersize 3.2
A_3 = [0 1 0 0 0;
       0 0 0 0 0;
       0 0 0 0 0;
       1 0 0 0 0;
       0 0 1 0 0];

B_3 = [0   0;
     0   K_1;
     K_2 0;
     0   0;
     0   0];

 %C_3 = [0 0 0 1 0;
 %     0 0 0 0 1];

Q_3 = [30 0 0 0 0;
       0 5 0 0 0;
       0 0 30 0 0;
       0 0 0 1 0;
       0 0 0 0 1];

R_3 = [1 0;
       0 1];

K = lqr(A_3,B_3,Q_3,R_3)

%F = inv(C*inv(B*K-A)*B)
%choosing our own F
F = [3 0;
     0 3]


%matrices for lab 5
 

A = [0 1 0 0 0 0;
     0 0 0 0 0 0;
     0 0 0 1  0 0;
     0 0 0 0  0 0;
     0 0 0 0 1 0;
     0 0 0 0 0 0;]

B = [0   0;
     0   K_1;
     0   0;
     K_2 0;
     0   0;
     0   0]

C = [0 1 0 0 0 0;
     0 0 0 1 0 0;
     0 0 0 0 0 1;
     1 0 0 0 0 0; 
     0 0 1 0 0 0];

 
 


%Port for the IMU

PORT = 16;

sys = ss(A, B, C, 0)
sysd = c2d(sys, 0.002)

A_d = sysd.a
B_d = sysd.b
C_d = sysd.c



Q_d = [1 0 0 0 0 0;
       0 1 0 0 0 0;
       0 0 1 0 0 0;
       0 0 0 1 0 0;
       0 0 0 0 1 0;
       0 0 0 0 0 1]
   
P_init = [0 0 0 0 0 0;
          0 0 0 0 0 0;
          0 0 0 0 0 0;
          0 0 0 0 0 0;
          0 0 0 0 0 0;
          0 0 0 0 0 0]

      
% from covar.m

R =[0.1034    0.0583    0.0373   -0.0107   -0.0010;
    0.0583    0.0628    0.0181   -0.0136   -0.0002;
    0.0373    0.0181    0.0210   -0.0035   -0.0009;
   -0.0107   -0.0136   -0.0035    0.0033   -0.0000;
   -0.0010   -0.0002   -0.0009   -0.0000    0.0007]









