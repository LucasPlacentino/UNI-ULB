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



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 4bis --- methode de minimisation d'énergie ---
% minimisation d'énergie, gradient, (gradient conjugué?,) ...



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% 5 --- racines ---



%%%%%%%%%%%%%%%%%%



%% 6 --- integration ---



%%%%%%%%%%%%%%%%%%%%%%


%% 7 --- equadiff CI ---



%%%%%%%%%%%%%%%%%%%%%%%%


%% 8 --- equadiff CL ---



%%%%%%%%%%%%%%%%%%%%%%%%


