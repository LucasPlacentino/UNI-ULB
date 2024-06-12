% entrainement juin 2024


%% 1 --- LU ---
A_lu = ones(5) + diag([4 4 4 4 4])
b_lu = [9;9;9;9;9]
x_lu_exacte = [1;1;1;1;1];

[L_lu U_lu] = entrainementLU2024(A_lu) % voir fichier .m pour l'algo
% on peut vérif que LU=A
L_lu*U_lu
x_lu = U_lu\(L_lu\b_lu) % on peut faire \ car systeme triangulaire

erreur_relative_lu = norm(x_lu_exacte - x_lu)/norm(x_lu_exacte)

%%%%%%%%%%%%%



%% 2 --- PALU ---
%si pas LU stable

## A =
##        1  -100     0     0
##        1     1  -100     0
##        0     1     1  -100
##     -100     0     1     1
A_palu = [1 -100 0 0; 1 1 -100 0; 0 1 1 -100; -100 0 1 1]
A=A_palu;

Asv = A;
format short
% Pour choisir la où permutation, on prend l'élément le plus grand en val absolue
% sous la diagonale de la colonne, dans ce cas-ci ligne 4 -100
% => permute ligne 1 et 4
P1 = eye(4);
P1([1,4],:) = P1([4,1],:); % ligne 4 et 1 permutée

A=P1*A

% construction de L1:
L1 = eye(4)
L1(2:4,1) = -A(2:4,1)./A(1,1);

A=L1*A

% On continue...on regarde ce que A est devenue maintenant et on prend l'élément
% le plus grand en val absolue sous la diagonale dans la colonne 2, dans ce cas
% -100 en ligne 4
% => on permute la ligne 2 et 4
P2 = eye(4);
P2([2,4],:) = P2([2,4],:); % lignes 2 et 4

A=P2*A

% construction de L2:
L2 = eye(4)
L2(3:4,2) = -A(3:4,2)./A(2,2);

A=L2*A

% On continue...on regarde ce que A est devenue maintenant et on prend l'élément
% le plus grand en val absolue sous la diagonale dans la colonne 3, dans ce cas
% en ligne 4
% => permute ligne 3 et 4
P3 = eye(4);
P3([3,4],:) = P3([4,3],:);

A=P3*A

% construction de L3:
L3 = eye(4);
L3(4:4,3) = -A(4:4,3)./A(3,3);

A=L3*A

% on a fini dans ce cas ci
U=A

% on a donc L3*P3*L2*P2*L1*P1*A = U
Lp3 = L3;
Lp2 = P3*L2*P3;
Lp1 = P3*P2*L1*P2*P3;
P = P3*P2*P1;
% ou aussi Lp3*Lp2*Lp1*P*A = U

% en utilisant les proprietés 1 & 2 du chapitre 3 il suffit de copier-coller les
% colonnes correspondantes de Lpi dans L, et d’inverser 1 le signe des éléments
% sous la diagonale principale
L = eye(4);
L(4,3)   = -Lp3(4,3);
L(3:4,2) = -Lp2(3:4,2);
L(2:4,1) = -Lp1(2:4,1);

% on peut vérifier avec
[l u p] = lu(Asv)
printf("norm(L-l) = %g\n", norm(L-l))
printf("norm(U-u) = %g\n", norm(U-u))
printf("norm(P-p) = %g\n", norm(P-p))

% pour solution
% permuter b:
%b_p = P*b
%x = U\(L\b_p)
% soit
%x = U\(L\(P*b)) % on peut utiliser "\" car triangulaire (n^2 flops pour chaque "\")

%x = U\(L\(P*(A’*b))); % ??

%%%%%%%%%%%%%%%



%% 3 --- QR ---
A = Asv
format short

x = A(1:4,1);
x(1) = x(1) + sign(x(1))*norm(x);
v1 = x/norm(x);

A(1:4,1:4) -= v1*(2*(v1'*A(1:4,1:4)));
  % Q1 = eye(4)- 2*v1*v1’;
  % A = Q1*A;
  %
  % transformation 2

x = A(2:4,2);
x(1) = x(1) + sign(x(1))*norm(x);
v2 = x/norm(x);

A(2:4,2:4) -= v2*(2*(v2'*A(2:4,2:4)));
  % Q2 = eye(4); Q2(2:4,2:4) = eye(3)- 2*v2*v2’;
  % A = Q2*A;
  %
  % transformation 3

x = A(3:4,3);
x(1) = x(1) + sign(x(1))*norm(x);
v3 = x/norm(x);

A(3:4,3:4) -= v3*(2*(v3'*A(3:4,3:4)));
  % Q3 = eye(4); Q3(3:4,3:4) = eye(2)- 2*v3*v3’;
  % A = Q3*A;
  %
  % calculer Q

R = A
Q = eye(4);
Q(3:4,3:4) -= v3*(2*(v3'*Q(3:4,3:4)));
Q(2:4,2:4) -= v2*(2*(v2'*Q(2:4,2:4)));
Q(1:4,1:4) -= v1*(2*(v1'*Q(1:4,1:4)))

% on peut vérifier avec
[q r] = qr(Asv) % qr(Asv,0) ?
% et
printf("norm(Asv - Q*R) = %g\n", norm(Asv-Q*R))

% pour solution
%x = R\(Q'*b)

%%%%%%%%%%%%%


% Conditionnement matrice A :
%cond(A)
% ou encore
%norm(inv(A’*A)*A’)*norm(A)
% ou encore
%norm(pinv(A))*norm(A) % pinv(A) étant de pseudo-inverse de A



%% 4 --- methode stationnaire ---
% Jacobi, Gauss-Seidel, ...
% Ax=b

% Jacobi (pour un sys tridiagonal):
%A=
%b=
%tol = 1e-3 % tolerance
%maxit = 500 % nbre max d'iterations
%x0 = zeros(length(b),1) % approx initiale

%[x iter rr] = entrainementJacobi2024(A,b,tol,maxit,x0)


% Gauss-Seidel (pour un sys tridiagonal):

%A=
%b=
%tol = 1e-3
%maxit = 500
%x0 = zeros(length(b),1)

%[x iter rr] = entrainementGaussSeidel2024(A,b,tol,maxit,x0)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 4bis --- methode de minimisation d'énergie ---
% minimisation d'énergie, gradient, (gradient conjugué?,..



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% 5 --- racines ---
% dichotomie, fausse position, Newton-Raphson sans ou avec recherche linéaire

% Si on connait pas les dérivées de la fonction, on ne peut utiliser que
% les méthodes de dichotomie et de fausse position

% Dichotomie:
%x =
%f = @(x) []
%a=
%b=
%tol=

%[x iter] = entrainementDico2024(f,a,b,tol) % algo facile


% Fausse position:
%x =
%f = @(x) []
%a=
%b=
%tol=

%[x iter] = entrainementFaussePosition2024(f,a,b,res,maxit)
% algo: x = a - f(a)*(b-a)/(f(b)-f(a)) puis on change x en a ou b en fonction


% Si on connait (ou peut trouver) la dérivée de la fonction, on peut utiliser
% les méthodes de Newton-Raphson (avec ou sans recherche linéaire)

% Newton-Raphson (sans rechlin):
% Voir formulaire exam
% Voir tp7newtonraphson.m
%[x iter r] = tp7nrrecherchelin(f, fp, x0, res, maxit)

% Newton-Raphson avec recherche linéraire:
% Voir forumailre exam
% Voir tp7nrrecherchelin.m
%[x iter r] = tp7nrrecherchelin(f, fp, x0, res, maxit)


%%%%%%%%%%%%%%%%%%


% Faire un mesh:

##F = @(x) [x(1).^2 - x(2) - 1; (x(1)-2).^2 + (x(2)-0.5).^2 - 1]
##%Fp = @(x) [2.*x(1),-1; 2.*(x(1)-2), 2.*x(2)-1]
##X = -1:0.1:3;
##Y = -1:0.1:3;
##for i = 1:length(X)
##  for j = 1:length(Y)
##    Z(i,j) = min(norm(F([X(i);Y(j)])),1); % ou min( ,0.5)
##  endfor
##endfor
##mesh(X,Y, Z) % (set(gca,'Zlim',[-0.5,0.5]) dans command window)
##xlabel ("x"); ylabel ("y"); zlabel ("z")

% puis on peut faire les Newton-Raphson avec x0 = [x,y] approximatif trouvés
% visuellement avec le mesh



%% 6 --- integration ---

% Trapèzes (Newton-Cotes d'ordre 1 en gros):
%f = @(x) [];
%a=
%b=
%ni=  % nombre de sous-intervalles (entier > 0)
%val = entrainementTrapezes2024(f,a,b,ni)

% E_glob = (-1/12) * (b-a) * h^2 * f''(c)     où c appartient à ]a,b[
% mais c ? on prend majorant, selon la fonction
% si on a une erreur max => on veut un certain h, on prend alors comme ni
% à mettre en arg de la function: ni = ceil((b-a)/h)


% Simpson (Newton-Cotes d'ordre 2):
% exacte pour tout polynome de degré inférieur à 3, car erreur dépend de la dérivée 4ème
%f = @(x) [];
%a=
%b=
%ni=  % nombre de sous-intervalles (entier > 0)
%val = entrainementSimpson2024(f,a,b,ni)

% E_glob ~= (b-a) * h^4 * f''''(c)


% Newton-Cotes:
% voir formule dans le formulaire :)


%%%%%%%%%%%%%%%%%%%%%%


%% 7 --- equadiff CI ---
% Méthodes d'Euler progressive, rétrograde, ou du second ordre: de Crank-Nicolson, de Heun (Runge-Kutta 2)

% Euler progressive:
% methode explicite
% absolument stable si h*beta > 2
f = @(t,y) [y.*cos(t)+sin(y)]
y0=1
h=0.01
t=0:h:10

y_pro = entrainementEulerPro2024(f,y0,t)

plot(t,y_pro,'b')
hold on


% Euler rétrograde:
% methode implicite (on devra utiliser fsolve)
% toujours absolument stable
y_ret = entrainementEulerRet2024(f,y0,t)

plot(t,y_ret,'r')
hold on

% Crank-Nicolson:
% implicite
% absolument stable quel que soit le pas h (comme Euler ret)

% Heun (Runge-Kutta d'ordre 2):
% explicite
% absolument stable si h*beta < 2 (comme Euler pro) (si beta réel)
% y_k+1 = y_k + 1/2 * h_k * ( f(t_k,y_k) + f(t_k+1, y_k + h_k*f(t_k,y_k) ) )

y_heun = entrainementHeun2024(f,y0,t)

plot(t,y_heun,'g')
hold on

%%%%%%%%%%%%%%%%%%%%%%%%


%% 8 --- equadiff CL ---



%%%%%%%%%%%%%%%%%%%%%%%%


