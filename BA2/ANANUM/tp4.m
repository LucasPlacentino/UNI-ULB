# ------ tp 4 ------ (PA=LU ? QR ?)

# !!!!!!!!                                        !!!!!!!!
# --!!!!-- ATTENTION QUASI TOUT LE TEMPS A L'EXAM --!!!!--
# !!!!!!!!                                        !!!!!!!!

# (EXO 1)
# Ax=b
# le pivot est-il bien en valeur absolue la premiere colonne ...??...

# ... L_3 P_3 L_2 P_2 L_1 P_1 A 

# L'_j = P_i L_j P_i

# L_3  P_3 L_2 P_3 P_3 P_2 L_1 P_2 P_3 P_3 P_2
# ^^^L'_3      ^^^^^^^=I   ...??...
# voir photo 11/03/2022
#
#     ( 1         )
# P = (   0   1   )  
#     (     1     )  2 <---> 4
#     (   1   0   )
#     (         1 )
# PA: lignes
# AP: colonnes
#
# extraire colonne:  P(3,:)  ou P(2,:)
# extraire deux colonnes P([2,40],:)
#
#=>  P([4,2],:) = P([2,4],:);P([2,40],:)




# ------  EX 1 )  ------

P1 = eye(4)
P2 = eye(4)
P3 = eye(4)

A = eye(4)-100*diag(ones(3,1),1)+diag(ones(3,1),-1)-100*diag(ones(1,1),-3)
Astart = A;
P1([1,4],:) = P1([4,1],:);
A = P1*A;
L1 = eye(4);
L1([2:4],1) = -A([2:4],1)/A(1,1);
A=L1*A
# L1 sert à faire apparaitre des zeros dans la premiere colonne (elimination de gauss)
P2([2,4],:) = P2([4,2],:);
A=P2*A;
L2=eye(4);
L2([3:4],2)= -A([3:4],2)/A(2,2);
A=L2*A

P3([3,4],:) = P3([4,3],:);
A=P3*A;
L3=eye(4);
L3(4,3) = -A(4,3)/A(3,3); # ([4,4], ) = (4, )
A=L3*A

# voir photo L = (  ...    matrice identité dont les colonnes du triangle inférieur sont -Lp1 et -Lp2 et -Lp3
Lp3 = L3;   # Lp = "L prime" (L')
Lp2 = P3*L2*P3;
Lp1 = P3*P2*L1*P2*P3;
P = P3*P2*P1

L=eye(4);
L([2:4],1) = -Lp1([2:4],1);
L([3:4],2) = -Lp2([3:4],2);
L(4,3) = -Lp3(4,3)

U = A # U la matrice triangulaire finale de la resolution de Gauss
# Résulat à comparer avec la fonction lu() de Octave

# avec la focntion lu() intégrée à Octave:
[Lbis, Ubis, Pbis] = lu(Astart);
Lbis
Ubis
Pbis


# -----  EX 2 )  ------

# !!!  voir tp4ex2.m

