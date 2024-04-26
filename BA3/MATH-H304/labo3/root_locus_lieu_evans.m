% lieux d'evans

%load("1v-1.4v.mat")


% second ordre
num = [5.027];
denom = [0.17 2.27 1];

figure
rlocus(tf(num,denom))


% premier ordre
num = [5.075];
denom = [2.328 1];

figure
rlocus(tf(num,denom))

