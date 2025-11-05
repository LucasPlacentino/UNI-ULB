% Exercise 3 - Lab Session 1 - DSP 2025
close all
clear

% --- Convolution ---

% conv command
%step signal:
n = -20:20; %length 41
u = [zeros(20,1); ones(21,1)]; %length 41
%f = zeros(length(u)-4,1); %length 37
%f signal:

%for i = 1:length(u)-4 %or else the f(1:4) will be padded with zeros
%    f(i) = u(i+4)-u(i+4-4) %length should be 37
%end
f = u(5:end)-u(1:end-4);
figure;
stem(n(5):n(end),f,"filled",'LineWidth',1);
title('Our f signal');

%g signal:
for i = 1:length(n)-8
    j=i+8;
    g(i) = i.*u(j) - 2*(j-4).*u(j-4) + (j-8).*u(j-8);
end
%g = n.*u - 2*(n-4).*u
% double func does a step
%g = n.*u - 2*(n-4).*double(n >= 4) + (n-8).*double(n >= 8);
%g = n.*(n>=0) - 2*(n-4).*(n>=4) + (n-8).*(n>=8);

%convolution of f and g:
convolution_f_g = conv(f,g);
l = length(convolution_f_g);
fprintf("Length of conv(f,g) is length(f)+length(g)-1 = %d here.\n",l)
figure;
stem(-floor(l/2):floor(l/2),convolution_f_g,"filled","LineWidth",1);
title("Convolution of f and g signals");

