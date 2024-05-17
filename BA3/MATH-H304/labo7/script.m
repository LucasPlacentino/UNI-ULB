wn = 100;
zeta = 0.7;


f=tf([wn^2], [1 2*zeta*wn wn^2])
% bode(f)

% rlocus(f);
pole(f)

