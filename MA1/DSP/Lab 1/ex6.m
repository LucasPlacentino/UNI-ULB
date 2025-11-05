% Exercise 6 - Lab Session 1 - DSP 2025
close all
clear

% See function in ex6_my_uniform_quantizer.m
tmin = 0;
tmax = 0.03;
t = linspace(tmin, tmax, 100);
f = 50;
fun = cos(2*pi*f*t);
q_fun = ex6_my_uniform_quantizer(fun,5);

figure;
stem(q_fun,"filled","LineWidth",1); hold on;
stem(ex6_my_uniform_quantizer(fun,6),"filled","LineWidth",1); hold on;
stem(ex6_my_uniform_quantizer(fun,4),"filled","LineWidth",1); hold on;
stem(ex6_my_uniform_quantizer(fun,16),"filled","LineWidth",1); hold on;
hold off;

figure;
stem(fun-q_fun,'filled','LineWidth',1); hold on;
stem(fun-ex6_my_uniform_quantizer(fun,6),'filled','LineWidth',1); hold on;
stem(fun-ex6_my_uniform_quantizer(fun,4),'filled','LineWidth',1); hold on;
stem(fun-ex6_my_uniform_quantizer(fun,16),'filled','LineWidth',1); hold on;
hold off;
