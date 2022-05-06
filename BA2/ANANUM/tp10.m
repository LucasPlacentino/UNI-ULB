# TP10

clear all
close all

# problèmes de Cauchy

# { dy(t)/dt = f(t, y(t))      (1)
# { y(t=0) = y_0               (2)

#  VOIR PHOTO 6/05/22 (ou pas D: )

# euler progressive, parce qu'on va vers l'avant, methode dite explicite

# euler retrograde, vers l'arrière, methode implicite car pas moyen d'isoler direcement t(k+1)

# y_k+1 = y_k + h*f(t_k+1, y_k+1)   l'inconnue est y_k+1

# g=@(x) [ x - y_k - h*f(t_k+1, x) = 0]   implicite

# => on va utiliser la methode octave y_k+1 = fsolve(g, y_k)
# (pour fsolve: g la fctn et y_k aux alentours où il faut chercher)
# fsolve c'est pour euler retrograde ?


# Ordre

# (( |y_k+1 - y_exact| <= C |y_k -y_exact|^n ))
# |y_k+1 - y_exact| <= C*h(^n)    (voir slide 14) (methode d'euler: n=1 premier ordre)
# ce qui donnerrait la toute + meilleur solution: h le plus petit
# regarder sur un graph plotté des erreurs successives
# on observe qu'à chaque fois qu'on double le pas, l'erreur est deux fois plus grande ainsi de suite (linéairement)
# d'ordre 2 l'erreur augmenterait de manière quadratique


# y_k+1 = y_k + §(0 à t)( f(t, y(t)) dt )

# methode de Crank-Nicholson
# implicite

# voir photo 6/05/22

# methode de Heun (ou runge-kutta d'ordre 2)
# explicite

# = y_k + h* (f(t_k+1 , y_k+1) + f(t_k,y_k))/2

# voir photo 6/05/22


# prenons un k constant
# ici pas d'influence du h (plus h petit plus c'est précis)
# stabilité: euler progressive pas toujours stable, retrograde toujours stable


# EX 1
h = 0.001; # PAS
t = 0:h:10; # pas (h) de 0.01
# on peut essayer des pas plus granbd pour voir l'erreur augmenter
g=@(t,y) [y.*cos(t) + sin(y)];

# a) ?

# b)
y0=1; # = ? comment savoir?

y1 = tp10eulerpro(g, y0, t);
y2 = tp10eulerret(g, y0, t);

#plot(t, y1, '-r')
#hold on;
#plot(t, y2, '-y')
#hold on;

# c)
# progressive:
t2 = 0:2*h:10; # h*2
y12= tp10eulerpro(g, y0, t2);
plot(t2, norm(y12-y1(1:2:end)), '-b')
#semilogy(t2, abs(y12-y1(1:2:end)), '-b')
hold on;
t4 = 0:4*h:10; # h*4
y14= tp10eulerpro(g, y0, t4);
plot(t4, abs(y14-y1(1:4:end)), '-b')
#semilogy(t4, abs(y14-y1(1:4:end)), '-b')
hold on;
t16 = 0:16*h:10; # h*16
y116= tp10eulerpro(g, y0, t16);
plot(t16, abs(y116-y1(1:16:end)), '-b')
#semilogy(t16, abs(y116-y1(1:16:end)), '-b')
hold on;

# retrograde:
y22= tp10eulerret(g, y0, t2);
plot(t2, norm(y22-y1(1:2:end)), '-g')
#semilogy(t2, abs(y22-y1(1:2:end)), '-g')
hold on;
y24= tp10eulerret(g, y0, t4);
plot(t4, abs(y24-y1(1:4:end)), '-g')
#semilogy(t4, abs(y24-y1(1:4:end)), '-g')
hold on;
y216= tp10eulerret(g, y0, t16);
plot(t16, abs(y216-y1(1:16:end)), '-g')
#semilogy(t16, abs(y216-y1(1:16:end)), '-g')
hold on;

