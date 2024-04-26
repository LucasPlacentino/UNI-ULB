openinout; %Permet l'accès aux ports du calculateur analogique.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%METTEZ VOTRE CODE ICI
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fs = 1000;
duration = 10;

%[time, data] = acqui(fs, duration);
load('test-echelon.mat');

figure
plot(time, data(:,1), time, data(:,2), time, data(:,3))
ylabel('Tension [V]')
xlabel('Temps [s]')
title('Test en échelon')
legend('Échelon de réf', 'Signal de commande', 'Signal capteur moteur')

max2 = max(data(:,2))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Traitement des données pour Simulink
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
REF = [time, data(:,1)]; %(Référence) échelon de réf
COM = [time, data(:,2)]; %(Commande) Réarrange la structure des données pour leur utilisation dans Simulink.
OUT = [time, data(:,3)]; %(Sortie) Réarrange la structure des données pour leur utilisation dans Simulink.

closeinout %Permet de retirer l'accès aux ports du calculateur analogique.