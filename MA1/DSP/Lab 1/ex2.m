% Exercise 2 - Lab Session 1 - DSP 2025
close all
clear

% sinusoidal signal:
f = 100;
tmin = 0;
tmax = 0.01;
t = linspace(tmin,tmax,100);
y = sin(2*pi*f*t);

plot(t,y);

% -----------------

% step signal:
n = -10:10;
u = [zeros(10,1); ones(11,1)];

figure;
stem(n,u, 'filled', 'LineWidth',1);
title('Unit step signal');
% unit sample sequence
u2 = [zeros(10,1); 1; zeros(10,1)];
figure;
stem(n,u2, "filled", 'LineWidth',1);
title('Unit sample signal');

% unit ramp signal
%u3 = linspace(0,size(n,2)-1,size(n,2));
u3 = [zeros(10,1); transpose(linspace(0,10,11))];
figure;
stem(n,u3, "filled", 'LineWidth',1);
title('Unit ramp signal');

% another sine signal
f2 = 100;
t2 = linspace(0,0.01,20);
figure;
stem(t2,sin(2*pi*f2*t2),"filled", 'LineWidth',1);
title('Sine and Cosine signals ($$f=100Hz$$)')
hold on;
stem(t2,cos(2*pi*f2*t2),"filled", 'LineWidth',1);
hold off;


% ---------------

% load and display images
I = imread("lenagray.png");
%convert the intensity image I to double precision:
I = im2double(I);
figure; imshow(I);

