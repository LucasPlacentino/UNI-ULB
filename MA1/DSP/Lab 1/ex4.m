% Exercise 4 - Lab Session 1 - DSP 2025
close all
clear

% i (let's not generalize and do it for a filter of length 3):
filter_1 = [3 5 1]; % odd length
n = linspace(-5,5,100);
signal = sin(2*pi*100*n);
padded_signal = [0, signal, 0];
for k = 1:length(n)
% the filter vector needs to flipped (so [x y z] but use [z y x]) in
% order to be convolution, otherwise it's correlation (see fig in lab docs)
    filtered_signal(k) = filter_1(3)*padded_signal(k)+filter_1(2)*padded_signal(k+1)+filter_1(1)*padded_signal(k+2);
end
figure;
stem(n,signal,'filled','LineWidth',1);
hold on;
stem(n,filtered_signal,'filled','LineWidth',1);
hold off;

% ii:
filter_2 = 1/3*[1 1 1];
signal_2 = rand(100,1);
%signal_2 = signal;
convolved_signal = conv(signal_2,filter_2,'same'); %signal firts, filter second.
figure;
stem(-floor(length(signal_2)/2)+1:floor(length(signal_2)/2),signal_2,'filled',"LineWidth",1);
hold on;
stem(-floor(length(convolved_signal)/2)+1:floor(length(convolved_signal)/2),convolved_signal,'filled',"LineWidth",1);
hold off;
