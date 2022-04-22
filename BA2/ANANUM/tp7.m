#tp 7-8

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
# pour le c) on va en discuter, sans doute N.R. pas bone

f1 = @(x) besselj(0,x)
f2 = @(x) e.^((-x.^(2))+(22.*x)-120)-0.5
f3 = @(x) (16.*x.^(5))-(20.*x.^(3))+(5.*x)-1

f3prime = @(x) 80.*x.^(4)-60.*x.^(2)+5
f2prime = @(x) (-2.*x+22).*(e.^((-x.^(2))+(22.*x)-120))


# SET(GCA,'XLIM',[-1,1]) pour echelle graph en x sans la recalculer

# [n2, sol2] = tp7nrrecherchelin(f2, f2prime, 13)
# etc
