%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Changer le nom des variables "time" et "data" par le nom de vos propres variables. 
%Changer les colonnes prisent pour u (signal réglant) et y (signal réglé)
%avec les colonnes correspondantes de votre variable.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all; close all;
load('.mat') % chargez vos données experimentales
u=data(:,1)';
y=data(:,2)';
time=time;
Fs= ; % Fréquence d'echantillionage en s
Ts = 1/Fs; % Temps d'echantillionage en s
debut = /Ts; % Instant en secondes à partir duquel on prend les données à identifier
fin = /Ts; % Instant d'arrêt
u0=u(1,debut); % u0
y0=y(1,debut); % y0
SystemOrder=[0 1]; %Nombre de zeros de poles (0 et 1) respectivement
integrateur = 0 ; % Flag spécifiant si le system est intégrateur ou pas;
num =[]; %  
den = []; % 
Valeur_MG = [num den] ; % Valeurs du modele trouvées par méthodes graphiques 
%% Calcul et visualisation
sysIdent = IdentificationOpti(u(debut:fin)-u0,y(debut:fin)-y0,SystemOrder,Ts,integrateur,Valeur_MG)
plot(time(debut:fin),y(debut:fin)-y0,'r:','LineWidth',2);
hold on;
lsim(sysIdent,u(debut:fin)-u0,time(debut:fin));
