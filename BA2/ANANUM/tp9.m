% TP 9

% integartion

% fct sur une certaine intevalle, on doit évaluer l'aire sous cette fct
% sur [a,b]

% ---methode des trapezes---

% sur intervalles réguliers
% aire trapeze = h * (f(a)+f(a+b)) /2
% petite base + grande base fois hauteur(l'intervalle) sur deux
% plus h est petit + c'est précis
% on risque que la longueur [a,b] soit pas un nombre entier de fois h
% alors h = (b-a)/n


% ---methode de Simpson---

% point au milieu de [a+h,a+2h] : a + 3/2h
% interpolation quadratique entre
% int = (f(a+h)+h*f(a+h3/2)+f(a+2h))/6
% exact pout tout polynome de degré au plus 3
% (vérifier à l'ex 1)


% Erreur globale
% |E_glob| = -1/12 * (b-a)*h^2*|f''(c)|
% c est un réel appartenant à [a,b]

% |E_glob| <= 10^-6
% h^2*|f''(c)| <= 10^-6

% on va sortir un h_erreur <= sqrt((12*10^-6)/((b-a)*|f''(c)|))
% n = (b-a)/h_erreur ; appartient PAS à N

% n = ceil(n)
% h_effetif = (b-a)/n <= h_erreur
% que quand la methode est pas exacte, que quand il y a une erreur à calculer

% si elle est exacte le h est indépendant de l'erreur (car pas d'erreur) donc h qu'on veut


% --- EX 1 ---
 
% prenons un bete polynome

% f(x) = 1
% f(x) = x^2
% [0,1]
% h = 1
% 
% als(simps-exact)

F=@(x) [x^2];
intF=@(x) [(x^3)/3];
G=@(x) [2*x^3];
intG=@(x) [2*(x^4)/4];
H=@(x) [x^5];
intH=@(x) [(x^6)/6];

[aireF] = tp9simpson(F, 0, 1, 100)
errF = aireF-(intF(1)-intF(0))
[aireG] = tp9simpson(G, 0, 1, 100)
errG = aireG-(intG(1)-intG(0))
[aireH] = tp9simpson(H, 0, 1, 100)
errH = aireH-(intH(1)-intH(0))


% --- EX 2 ---

% mathode des trapezs

A=@(x) [x.*e.^x];
a1=-2;
a2=1;
%Ap
App=@(x) [e.^x .*(x+2)];

B=@(x) [(2/sqrt(pi)) .* e.^(-x.^2)];
b1 = 0;
b2 = 2;
%Bp
%Bpp=@(x) [(4/sqrt(pi)*(e.^(-x.^2))*(2*x.^2 -1)];
Bpp=@(x) [(e.^x.^2 .* (8*x.^2 -4))/sqrt(pi)];

%C=@(x) [sin(x)./x];
C = @(x) [tp9sinxsurx(x)]
c1=0;
c2=pi;
%Cp
Cpp=@(x) [((2-x.^2).*sin(x) + 2*x.*cos(x))./x.^3];

% h <= 
% chercher majorant de f'' -> c
xplot = -2:0.1:pi;
yplot = Cpp(xplot);
plot(xplot,yplot,'-r')
majA=1; % à voir sur le plot de App
majB=2; % à voir sur le plot de Bpp
majC=0; % à voir sur le plot de Cpp
ha = sqrt((12*10^-6)/((a2-a1)*abs(App(majA))));
hb = sqrt((12*10^-6)/((b2-b1)*abs(Bpp(majB))));
%hc = sqrt((12*10^-6)/((c2-c1)*abs(Cpp(majC)))); % NaN dpnc 10^-8
hc = 10^(-8)

[aireA] = tp9trapezes(A, a1, a2, ha)
[aireB] = tp9trapezes(B, b1, b2, hb)
[aireC] = tp9trapezessincar( c1, c2, hc)



% ceil(...) ?