% correction exam juin 2022
% trouve pas la correctio de l'exam :(

% ------ 1)    Factoriqation QR  -------
% voir TP4 ex2 (~et TP5)

% A = ? test (tp4) :
A = eye(4)-100*diag(ones(3,1),1)+diag(ones(3,1),-1)-100*diag(ones(1,1),-3)
%b = .......

%function [Q R] = factqr (A)
  
x=A(:,1); % x est une matrice colonne formée par la première colonne de A
x(1) = x(1) + sign(x(1))*norm(x); % change le premier element de x
v1 = x/norm(x); % le vect v1 est le vect x normé
%! qu'est-ce que ça fait ??? :
A = (eye(4)-2*v1*transpose(v1))*A; % ? transforme la matrice A ? % correct ???
%    ^^^^^^^^^^^^^^^^^^^^^^^^^ = Q1
% A = Q1*A

% ou : (voir corrigé)
% A =- v1*(2*(transpose(v1)*A));

Q1=eye(4)-2*v1*transpose(v1); % ça mtn ou plus tard

x=A(:,2); % x est un vect colonne formé de la deuxieme colonne de A
x(1) = x(1) + sign(x(1))*norm(x); % meme chose qu'avant mais avec le nouveau vect x
v2 = x/norm(x); % meme chose, v2 est le nouveau x normé
A = (eye(4)-2*v2*transpose(v2))*A; %meme chose qu'avant mais avec v2 % correct ???
%    ^^^^^^^^^^^^^^^^^^^^^^^^^ = Q2
Q2=eye(4)-2*v2*transpose(v2); % puis voir corrigé

x=A(:,3);
x(1) = x(1) + sign(x(1))*norm(x); % meme chose qu'avant mais avec le nouveau vect x
v3=x/norm(x); %meme chose avec nouveau vect x
A = (eye(4)-2*v3*transpose(v3))*A; % correct ???
%    ^^^^^^^^^^^^^^^^^^^^^^^^^ = Q3
Q3=eye(4)-2*v3*transpose(v3);

x=A(:,4);
x(1) = x(1) + sign(x(1))*norm(x);
v4 = x/norm(x);
A = (eye(4)-2*v4*transpose(v4))*A;
# Q4=eye(4)-2*v4*transpose(v4); % pas besoin % ?

R = A

# Créer la matrice Q :
#    Q = Q1*Q2*Q3
# mais 4x4 3x3 2x2 
# Qi est en fait identité avec en bas à gauche la matrice avec les infos

Q=Q1*Q2*Q3

%sinon: ?
%Q = eye(4);
%Q(3:4,3:4)=(eye(2)-2*v3*transpose(v3))*Q(3:4,3:4);
%Q(2:4,2:4)=(eye(3)-2*v2*transpose(v2))*Q(2:4,2:4);
%Q(1:4,1:4)=(eye(4)-2*v1*transpose(v1))*Q(1:4,1:4);

% ou: ?
%Q = eye (4) ;
%Q (3:4 ,3:4) -= v3 *(2*( trasnpose(v3) * Q (3:4 ,3:4) )) ;
%Q (2:4 ,2:4) -= v2 *(2*( transpose(v2) * Q (2:4 ,2:4) ) );
%Q -= v1 *(2*( trasnpose(v1) * Q) ) ;
  
%endfunction


% === puis pour résoudre prob: ? ====
% x = R\(Q\b) % // x= U\(L\b)
% OU ???
% x = R\Q'*b % ????

% test loop:

#R = A;
#n = size(R,1);
#for k = 1:n
#  x = R(k:m,k);
#  vk = x+sign(x(1))*norm(x)*e1;
#  vk = vk/norm(vk);
#  
#  R(k:m,k:n) = R(k:m,k:n)-vk*(2*(transpose(vk)*R(k:m,k:n)));
#endfor
#R


% ---- 1)   Factorisation PA=LU  ------
% voir TP4 ex1 (et TP3 ex3)

% différence avec simple LU ? (LU avec pivotage?)
% - LU parfois pas possible (pivot sur zéro) alors nécessite pivot => PALU
% - meme flops que LU
% - PALU existe pour toute matrice régulière
% - PALU réputée stable ne pratique

% A = ? test
A = eye(4)-100*diag(ones(3,1),1)+diag(ones(3,1),-1)-100*diag(ones(1,1),-3)
%b=.....
% U=A
% (comme ça on modifie pas la matrice A de départ pendant le calcul)
% il faut juste alors un pue modifier le code en dessous

P1 = eye(4);
P2 = eye(4);
P3 = eye(4);

P1([1,4],:) = P1([4,1],:); % on switch les LIGNES 1 et 4 de P1
% ^ (change direct les deux lignes)

A = P1*A;

%pour les L on va remplacer les éléments de chaque colonne, qui sont
%en dessous de la diagonale 

% construction de L1
L1 = eye(4);
L1([2:4],1) = -A([2:4],1)/A(1,1);
% remplace le 2e, 3e et 4e élément de la 1e colonne de L1
% par l'opposé du:
% 2e, 3e et 4e élément de la première colonne de A, divisé par le 1e element
% (info: ce 1e element étant donc sur la diagonale)

A=L1*A;
% L1 sert à faire apparaitre des zeros dans la premiere colonne
% (elimination de gauss)

% --- meme chose avec P2 ---
P2([2,4],:) = P2([4,2],:); %switch lignes 2 et 4 de P2

A=P2*A;


%construction de L2
L2=eye(4);
L2([3:4],2) = -A([3:4],2)/A(2,2);
% remplace le 3e et 4e element de la 2e colonne de L2
% par l'opposé du:
% 3e et 4e element de la 2e colonne de A, divisé par le 2e element
% (info: ce 2e element étant sur la diagonale)

A=L2*1;

% --- meme chose avec P3 ---
% (4e element de la 3e colonne (sous la diagonale donc))
P3([3,4],:) = P3([4,3],:);
A=P3*A;
L3=eye(4);
L3(4,3) = -A(4,3)/A(3,3); % ([4,4], ) = (4, )
A=L3*A;

% L = ( ... matrice identité dont les colonnes du triangle inférieur sont -Lp1 et -Lp2 et -Lp3
Lp3 = L3;  % Lp: "L prime" (L')
Lp2 = P3*L2*P3;
Lp1 = P3*P2*L1*P2*P3;
P = P3*P2*P1
L=eye(4) % matrice identité
% triangle inférieur sera les colonnes opposées de Lp1 Lp2 et Lp3
L([2:4],1) = -Lp1([2:4],1);
L([3:4],2) = -Lp2([3:4],2);
L(4,3) = -Lp3(4,3)

U = A # U la matrice triangulaire finale de la resolution de Gauss
%(ici on a modifié la matrice A de départ pendant le calcul)

% === résoudre prob : ? ===
%x = U\(L\(P*b))   % // x=U\(L\b) de simple fact LU (LU=A)


% ------ 2)   ?????  ----------





