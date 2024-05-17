% %%% Le but de ce script est de définir les valeurs des paramètres utilisés
% %%% dans le fichier Simulink "SimuBFContinuDiscret"
% 
% %%% Système
% A0 = 5.075;      %Gain statique
% %tau1 = ;    %Constante de temps 1
% %tau2 = ;    %Constante de temps 2 (0 si 1er ordre)
% u0 = 1;      %Point de fonctionnement : grandeur réglante
% y0 = 5.782;      %Point de fonctionnement : grandeur réglée
% fs = 100;      %Fréquence d'échantillonnage
% fs_2 = 10;
% echelon = 1.5; %Amplitude de l'échelon de consigne
% 
% % Si votre système n'est pas intégrateur, décommentez la ligne suivante
% den = [2.328 1];
% 
% % Si votre système est intégrateur, décommentez la ligne suivante
% %den = [tau1*tau2 tau1+tau2 1 0];
% 
% 
% %%% Contrôleur
% kp = 6;     %Gain
% 
% 
% %%% Filtre anti-repli
% zeta = 0.7;   %Facteur d'amortissement
% T = 0.01;      %Position de la paire de pôle
% wn = 251.3274123;     %pulsation naturelle
% 
% G_analog=tf([A0],den)
% BO_analog=kp*G_analog
% %bode(BO_analog,{1e-2,1e4})
% margin(BO_analog)
% % Delay = exp(tf([-1/(2*fs) 0],[1]))
% % Delay_2 = exp(tf([-1/(2*fs_2) 0],[1]))
% % F=tf([wn^2],[1 2*zeta*wn wn^2])
% % BO_approx = kp*F*Delay*G_analog
% % BO_approx_2 = kp*F*Delay_2*G_analog
% % bode(BO_approx,BO_approx_2,"")
% 
% % rlocus(tf([p+1],[p(p+0.5)]))

% kp = 10^0.8 % 1
% ki = 0.429*kp
% sys = tf([5.075*kp 5.075*ki],[2.328 2.328*0.429 0])
% faa = tf([40^2],[1 0.707*40 40^2])
% %delay = exp(tf([-0.001 0],[1]))
% delay = pade(0.001,0)
% final_sys = sys*faa*delay
% %bode(sys, {1e-2,1e4})
% %margin(sys*faa*delay, {1e-2,1e4})
% %rlocus(final_sys)
% 
% Ts= 0.01 %sample time
% fs= 100
% u0=1;
% y0=5.782;
% echelon=1.5;
% A0=5.075;
% wn=251.3274123;
% den=[2.328 66.83 3753 1598 0]; % continu, du dessus le final_sys mais sans le délai)
% zeta=0.7;
% 
% final_sys_discret = c2d(final_sys,Ts,'tustin')
% %den = [1 -3.621 5 -3.136 0.7574]; % discretisé
% margin(tf([0.002329 0.004667 2.99e-05 -0.004627 -0.002319],[1 -3.621 5 -3.136 0.7574]))

% ---- pour labo 8 ----

kp = 6.3;
ki = 0.429*kp;
Ts= 0.01 %sample time
D = tf([kp ki], [1 0])
D_discret = c2d(D, Ts, 'tustin')

%Ts= 0.01 %sample time
fs = 100;
u0 = 1;
y0 = 5.782;
echelon = 1;
num_d = [6.314 -6.286]; % discret
den_d = [1 -1]; % discret
num = [6.3 2.7027]; % continu
den = [1 0]; % continu
zeta = 0.7;
wn = 40;

A0 = 5.075;
den_sys = [2.328 1];







