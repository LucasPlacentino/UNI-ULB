
% ----- EX 1 -----
%QR


x = R\(Q'*b)
% ou séparé
%Y = Q'*b
%x = R\Y

%précision, erreur relative
norm(x - sol)/norm(sol) % sol est la solution exacte (calculee a la main)

% ----- EX 2 -----
%theorie trapezes

% ----- EX 3 -----

x = -8:0.1:2
%airy(2,x)
plot(x, airy(2,x), '-r')

% on connait pas la dérivée donc que dichotomie ou fausse position

% on regarde sur le plot pour connaitre à peu près où sont les racines

f=@(x) airy(2,x)
[iter, racine1] = tp7dicho(f, -1.5, -0.5, 0.05) % f, a, b, epsilon % on peut passer aussi le crit d'arret genre 10^(-6)

% etc pour racines 2 et 3

% ----- EX 4 -----
%prob aux limites D:
% voir correctif TP12 ou correctif pompes exam 1819 2ndSess


