%openinout; %Permet l'accès aux ports du calculateur analogique.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%METTEZ VOTRE CODE ICI
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fs = 1000;
duration = 15;

%[time, data] = acqui(fs, duration);
load('1v-1.4v.mat');

figure
plot(time, data(:,1), time, data(:,2))
ylabel('Tension [V]')
xlabel('Temps [s]')
title('Test en échelon')
legend('Échelon OUT', 'Signal COM')

%max2 = max(data(:,2))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Traitement des données pour Simulink
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%REF = [time, data(:,1)]; %(Référence) échelon de réf
COM = [time, data(:,2)]; %(Commande) Réarrange la structure des données pour leur utilisation dans Simulink.
OUT = [time, data(:,1)]; %(Sortie) Réarrange la structure des données pour leur utilisation dans Simulink.

%closeinout %Permet de retirer l'accès aux ports du calculateur analogique.