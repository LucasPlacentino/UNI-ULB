# tp11

clear all
close all

# arrivé en retard à cause du train - vérif le début du tp10

# meme chose que tp 10 mais y est un vecteur

# stabilité euler progressive
# h*beta < 2
# choisir val propre qui nous donnera le h
# on prend le beta (une des val propres) le plus grand,
#   pour avoir notre h le plus grand qui serait encore correct

# stabilité euler retrograde
# toujours stable


# toutes les val propres doivent avoir une partie réelle positive
# pour une sol de prob de cauchy bornée



lte = log(2)/19;
li = log(2)/(6.7*3600);
lxe = log(2)/(9.2*3600);

# vecteur de fonction
#f=@(t,y) [ -lambda_Te * y(1) ; lambda_Te * y(1) - lambda_I * y(2) ; ... ];

f=@(t,y) [ -lte * y(1) ; lte * y(1) - li * y(2) ; li * y(2) - lxe * y(3) ];

y0 = [1,0,0]; # à l'instant initial que 1 mole de Telurium

h1 = 2/lte;   # h de la limite de stabilité, pour h*beta = 2 (h = 54.822)
h2 = 1.1*h1;   #
h3 = 0.9*h1;   #
h4 = (1/lte)*0.9;   # pour h*beta < 1 (h = 27.411 * 0.9)

tmax = 600; # changer pour tester

# pour tester stabilité de euler pro:
# tester h*beta < 2
#        h*beta < 1
#    et  h*beta > 2
# voir comportement
# => on voi que ça varie bien en comparant:
#        h*beta = 1.9, h*beta = 2 et h*beta = 2.1 (et h*beta = 0.9 < 1)

# tester les différent h en enlevant le # :
#t = 0:h1:tmax; # ocsillations commencent (h*beta = 2)
#t = 0:h2:tmax; # bcp d'oscillations (h*beta > 2)
t = 0:h3:tmax; # oscillation cessent (h*beta < 2)
#t = 0:h4:tmax; # tres propre (h*beta < 1)

ypro = tp11eulerpro(f, y0, t);

plot(t,ypro(1,:),'-*r') # Telurium pro
hold on
plot(t,ypro(2,:),'-*b') # Iode pro
hold on
plot(t,ypro(3,:),'-*g') # Xenon pro
hold on
#legend('Te pro','I pro','Xe pro')

yret = tp11eulerret(f, y0, t);
plot(t,yret(1,:),'-y') # Te ret
hold on
plot(t,yret(2,:),'-m') # Iode ret
hold on
plot(t,yret(3,:),'-c') # Xenon ret
hold on
#legend('Te ret','I ret','Xe re);
legend('Te pro','I pro','Xe pro','Te ret','I ret','Xe ret');

# pour tester la stabilité de euler ret:
# on peut tester avec plein de h et verifier qu'ils sont tous
#     tres proches de la solution donc stable
# =======> on voit bien que c'est toujours stable peu importe la valeur de h

hold off
# d) chercher la val max de N_Xe (max de sa courbe)
#tmax ~= 40606
# chercher expérimentalement hmax pour trouver N_Xe ~= 0.4275 à 5% près
# chercher un hmax pour ret et un pour pro, lequel est le + favorable ?

hd = 1;
tmaxd = 20;
td = 0:hd:tmaxd;

# on veut N_Xe (nbre de mole de Xenon):
#ypro(3) # ?
#yret(3) # ?
plot(td,ypro(3,:),'-r') # Xenon pro
hold on
plot(td,yret(3,:),'-b') # Xenon ret
hold on

#[y_max,i] = max(y(3))
#t(i) = tmax
#...
# pas fini


# EX 2

# pas fait


