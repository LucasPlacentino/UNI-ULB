# tp12

close all
clear all

# schema du second ordre

# equadiff à résoudre
# avec CL:
# - soit Dirichlet 
# - soit Neumann
# on peut imposer dy(L)/dx = c_L

# travillons sur les points intérieur

# unicité de la solution
# - p, q, f continues
# - q non négative
#    -> Dirichlet (ex x=0 x=L)
#    -> p(x)<0 "au plus 1" Neumann
# à l'ex 1 on est dans le 2e cas

# on part de 0 jusque L
# i=1 (premier point du tableau) jusque i=m+1

# pour la dérivée seconde
# schéma centré du second ordre
# voir photo 20/05/2022 -> d²y/dx² = ( y(x+h) + y(x-h) - 2y(x) )/h²
# h et L-h (à l'intérieur du domaine)
# k=0 (en 0)
# x_k = h/m

# h²*( y_k - f(x_k) ) = y_(k+1) + y_(k-1) - 2y_k
# =>  -h²*f(x_k) = y_(k+1) + y_(k-1) - (2+h²)*y_k
#        ^ ex1 b)

# on va faire le meme dév que l'eq (5) slide 11 chap 9
#     mais avec le y en plus de notre exo

# dérivée seconde c'est la sdérivée de la dérivée :
# -d/dx(dy(0)/dx)
#       ^^^^^^^^^ dy(0)/dx = (y(h/2)-y(0))*2/h      Schéma progressif
# voir photo 20/05/2022
# D'où,
# -2/h² * ( y(h) - y(0) ) + y_0 = f(0)
# -y(h) + y_0 + h²/2 y_0 = h²/2 f(0)
# y(h) - (1+h²/2)y_0 = - h²/2 f(0)
#           ^^^^ ce qu'il y avait pas dans le slide
# version discrétisée du schéma numérique pour prendre ne compte la conditio nd eneumann au... :
# y_0 (1 + h²/2) -y_1 = h²/2 f(0)


# -y_(k+1) + (2+h²)y_h - y_(h-1) = h² f(x_k)
# voir photo 20/05/2022
# ici facilement la dernière car la condition à la limite est simplement d'ordre 1
# le systeme c'est une matrice tri-diagonale

# m=3,  h=1/3  h²=1/9   1+h²/2=19/18   2+h²=19/9
# voir photo 20/05/2022 ou feuille

# y = [ y_0 ; y_1 ; y_2 ]
# puis rajouter dirichlet, y_3 en concaténant
# y = [ y ; y_3 ]

# y(x) = sin²(pi(x+1)/2)
# y'(x) = pi/2 sin(pi(x+1))
# y''(x) = pi/2 cos(pi(x+1))
# f(x) = y(x) - y''(x)
yx=@(x) [(sin(pi*(x+1)/2))^2];
f=@(x) [(sin(pi*(x+1)/2))^2 - (pi/2 * cos(pi*(x+1)))];

a=0;
b=1;
m=20;
h=1/m;
#y = tp12f(h, f)
cl = yx(b); # (ici y(1) = 0)
y = tp12func(m, a, b, f, cl) #de manière générale, pour tout m et intervalle
plot(a:h:b, y, '-r*')
hold on

yexact(1)=yx(a);
for i=1:1:m-1 # le pas = 1?????
  yexact=[yexact ; yx(a+h*i)];
endfor
yexact = [yexact ; yx(b)];
#plot(

erreur = yexact-y
plot(a:h:b , erreur, '-b*')
hold on
