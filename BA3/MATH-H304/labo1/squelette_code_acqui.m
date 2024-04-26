openinout; %Permet l'accès aux ports du calculateur analogique.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%METTEZ VOTRE CODE ICI
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fs = 1000
duration = 15

[time, data] = acqui(fs, duration); % juste le pc du labo

closeinout %Permet de retirer l'accès aux ports du calculateur analogique.

% load('test-1.mat')

figure
plot(time,data(:,1),time,data(:,2)) % ?
% pour le data(:,2) :
title("Positionneur d'anneau blanc: essai X")
xlabel('Temps [s]')
ylabel('Vitesse moteur [V]')
legend('Signal entrée (tension moteur)','Signal sortie (vitesse moteur)')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Traitement des données pour Simulink
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
COM = [time', Data(:,1)]; %(Commande) Réarrange la structure des données pour leur utilisation dans Simulink.
OUT = [time', Data(:,2)]; %(Sortie) Réarrange la structure des données pour leur utilisation dans Simulink.
% 
% % ? :
% simout_time = out.simout.Time
% simout_data_1 = out.simout.Data(:,1)
% simout_data_2 = out.simout.Data(:,2)
% 
% plot(simout_time, simout_data_1, simout_time, simout_data_2)