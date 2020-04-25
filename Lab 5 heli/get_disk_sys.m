function ds = get_disk_sys()

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
K_3 = K_3_ish*1; % * V_s
K_pp = 20;
K_pd = 15.058;
V_s_0 = 8;

%Lab 1&2 above
    A_K = [0 1 0 0 0 0;
           0 0 0 0 0 0;
           0 0 0 1 0 0;
           0 0 0 0 0 0;
           0 0 0 0 0 1;
         K_3 0 0 0 0 0]
    B_K = [0 0;
           0 K_1;
           0 0;
         K_2 0;
           0 0;
           0 0]
    C_K = [0 1 0 0 0 0;
           0 0 0 1 0 0;
           0 0 0 0 0 1;
           1 0 0 0 0 0;
           0 0 1 0 0 0]
    sys_K = ss(A_K, B_K, C_K, 0);

    ds = c2d(sys_K, 0.002 );
end