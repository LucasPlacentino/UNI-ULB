#tp 7-8

clear all

# methode dichotomie
# crit d arret de limite d'iteration
#

# methode fausse position
# crit d arret different de dicho,pas une histoire de reduction d intervalle
# on va evaluer si f(x^(k+1)) < espilon


# methode Newton-Raphson
# on choisi un x_0 suffisamment proche de la racine
# on trace une tangente
# iteration : x^(k+1) = x^k - f(x^k)/f'(x^k)
# mais il faut connaitre la dérivée de cette focntion!
# => si racine est extremum : cette methode est super pas précise
# deux problemes:
#  - si ça converge pas
#  - ...

# p:= f(x^k)/f'(x^k)
# while f(x^(k+1)) > f(x^k)
#   x^(k+1) = x_k - alpha*p
#   alpha = alpha/2
# endwhile
# x^(k+1) = x^k
# puis recommence an haut (ligne 22: p=...)
#on peut mettre les alpha dans un vecteur et le sortir au return pour voir ceux qui ont été utilisés

# pour la fonction exponentielle du b) on peut utiliser les 4 methodes
# pour la Bessel ( a) ) (on va plot)
# pour le c) on va en discuter, sans doute N.R. pas bon

f1 = @(x) besselj(0,x)
f2 = @(x) e.^((-x.^(2))+(22.*x)-120)-0.5
f3 = @(x) (16.*x.^(5))-(20.*x.^(3))+(5.*x)-1

f3prime = @(x) 80.*x.^(4)-60.*x.^(2)+5
f2prime = @(x) (-2.*x+22).*(e.^((-x.^(2))+(22.*x)-120))

x2=8:0.01:14;
plot(x2, f2(x2), '-b'); grid on; hold on;

#set(gca,'XLIM',[-1,1]) #pour echelle graph en x sans la recalculer

%racines en 9.7 et 12.3
[n2rl, sol2rl] = tp7nrrecherchelin(f2, f2prime, 13)

[n2nr, sol2nr] = tp7newtonraphson(f2, f2prime, 13)

#[n2, sol2] = tp7nrrecherchelin(f2, f2prime, 13)

#[n2, sol2] = tp7nrrecherchelin(f2, f2prime, 9.5)

#[n2, sol2] = tp7nrrecherchelin(f2, f2prime, 9)

#[n2, sol2] = tp7nrrecherchelin(f2, f2prime, 8)

x3=-3:0.01:3;
plot(x3, f3(x3), '-r'); grid on;

set(gca, 'YLIM', [-3,3])
set(gca, 'XLIM', [-1.1,13])

% racines en -0.8, -0.3 et 1
roots([16 0 -20 0 5 -1]) # trouve les roots, pas hesiter à `help roots`
#convergence non quadratique
#racines dont dérivées sont nulles
% N-R => PAS BON comme dérivées nulles
% N-R RL => PAS BON
[n3rl, sol3rl] = tp7nrrecherchelin(f3, f3prime, -1)

[n3rl, sol3rl] = tp7nrrecherchelin(f3, f3prime, 0.3)

[n3rl, sol3rl] = tp7nrrecherchelin(f3, f3prime, 0.8)

% dicho => PAS BON car besoin de chaque signe
[n3dicho, sol3dicho] = tp7dicho(f3, -1, -0.7, 0.01)

[n3dicho, sol3dicho] = tp7dicho(f3, 0.2, 0.4, 0.01)

[n3dicho, sol3dicho] = tp7dicho(f3, 0.9, 1.1, 0.01)

% FAUSSE POS => PAS BON
[n3fp, sol3fp] = tp7faussepos(f3, -1, -0.8)

[n3fp, sol3fp] = tp7faussepos(f3, 0.2, 0.4)

[n3fp, sol3fp] = tp7faussepos(f3, 0.9, 1.1)
# etc
