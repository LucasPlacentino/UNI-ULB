# ---- TP3 -----

# conditionnement
# sol exacte (calcul mathematique) =/= sol algo (calcul numerique)
# a une erreur liée à la sol de l'algo

# (||y^ - y||)/||y|| <= C_1*C_2*K(A)*u   -> stab. directe
# C_1 ~= 1   C_2 >(=?) 1
# erreur relative est bornée par le conditionnement du problème

# K(A) ?   K(A) = ||A^-1||_2*||A||_2 en octave K(A)=cond(A)
# LE CONDITIONNEMENT DEPEND DU PROBLEME QU'ON SE POSE

# Ax=b A représente le problème à résoudre
# x = A\b -> derrière ce \ c'est octave qui choisi l'algo le plus optimisé
# le \ est l'algo, n'est pas lié à A

A1 = ones(5)+4*eye(5)


# diag(ones(1,4),1) unitaire mais diag déplacé de une diag vers le haut
# A = eye(5)
# A = A+diag(ones(1,3),-2) il faut que ici le |3| + |-2| = taille de la matrice

A2 = eye(5);
A2 = A2 + diag(ones(1,4),-1);
A2 = A2 - 1000*diag(ones(1,4),1)

A3 = A2 - 1000*diag(ones(1,1),-4)

b1 = [9;9;9;9;9]
#b1 = 9*ones(5,1)
b2 = [999;998;998;998;-2]
b3 = [999;998;998;998;998]
#b3 = 998*ones(5,1)
#b3(1,1) = b3(1,1)+1

condA1 = cond(A1) # 2.2500
condA2 = cond(A2) # 333150032.71740
condA3 = cond(A3) # 1.0027

u=1.1*10^(-16)
errRelA1 = condA1 * u # 2.4750e-16
errRelA2 = condA2 * u # 0.000000036647
errRelA3 = condA3 * u # 1.1029e-16

# ----- ex 2 -----  voir fichier LUtp3ex2.m
# LUx=b    où Ux=y
#1 Ly=b => y=L\b        attention \ : matrice\truc
#2 Ux=y => x=U\y
# x=U\(L\b)   ULB moyen mémotechnique  (ici le x est x chapeau)

[L U] = LUtp3ex2(A1);
A1;
LfoisU1 = L*U;
x1 = U\(L\b1)
norm(x1-ones(5,1)/sqrt(5))
errRelA1
#ici errRelA1 > donc correct

[L U] = LUtp3ex2(A2);
A2;
LfoisU2 = L*U;
x2 = U\(L\b2)
norm(x2-[-1;-1;-1;-1;-1]/sqrt(5))
errRelA2
#ici errRelA2 > donc correct

[L U] = LUtp3ex2(A3);
A3;
LfoisU3 = L*U;
x3 = U\(L\b3)
norm(x3-[-1;-1;-1;-1;-1]/sqrt(5))
errRelA3
#ici errRelA3 < donc il faut passer à l'ex 3 pour calculer avec PA=LU



# -------- ex 3 --------

#[L, U, P] = lu(A1);
#x1_lu_octave = U\(L\(P*b1))

#[L, U, P] = lu(A2);
#x2_lu_octave = U\(L\(P*b2))

[L, U, P] = lu(A3);
x3_lu_octave = U\(L\(P*b3))
norm(x3_lu_octave-[-1;-1;-1;-1;-1])/sqrt(5)
errRelA3
# ici errRelA3 >>> 0 donc c'est correct


