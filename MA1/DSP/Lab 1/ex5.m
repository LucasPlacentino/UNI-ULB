% Exercise 5 - Lab Session 1 - DSP 2025
close all
clear

tmin = 0;
tmax = 0.1;
t = linspace(tmin, tmax, 100);
f = 50;
figure;
stem(t,cos(2*pi*f*t),"filled","LineWidth",1); hold on;
T = 1/800; %sampling period, test at 800Hz, 100Hz and 50Hz
nmin = ceil(tmin/T);
nmax = floor(tmax/T);
n = nmin:nmax;
x1 = cos(2*pi*f*n*T);
stem(n,x1,"filled","LineWidth",1);hold off;

% When we don't respect the Shannon-Nyquist Theorem (here 100 and 50Hz),
% we don't sample the correct signal, there's aliasing.
