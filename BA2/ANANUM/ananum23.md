# Synthèse Ananum (2023)
------------------------
## Chap 1
### Virgules flottantes

$$\pm\overline{0.d_{1}d_{2}...d_{t}}\cdot\beta^e = \pm \beta^e\sum^{t}_{i=1}\frac{d_{i}}{\beta^i}$$  

- $\beta\,$: est la **base** (2=binaire, 10=décimal)
- $t\,$: est le **nombre de chiffres significatifs**
- $d_i\,$: est l'**$i$ème chiffre significatif** ($0 \le d_i \le \beta -1$)  
  L'ensemble des chiffres significatifs $\overline{0.d_1d_2...d_t}$ forment la **mantisse**
- $e\,$: est l'**exposant** ($e_{min} \le e \le e_{max}$)

> Exemple: avec $t=3$ chiffres significatifs  
> - $2$ est $\overline{0.200}\cdot 10^1$ en décimale (mais aussi $\overline{0.020}\cdot 10^2$ et $\overline{0.002}\cdot 10^3$)  
>   vérification: $10^1(\frac{2}{10^1}+\frac{0}{10^2}+\frac{0}{10^3}) = 2$  
> - $1/2$ est $\overline{0.500}\cdot 10^0$ endécimale et $\overline{0.100}\cdot 2^0$ en binaire  
>   vérification: $10^0(\frac{5}{10^1}+\frac{0}{10^2}+\frac{0}{10^3}) = \frac{1}{2} = 2^0(\frac{1}{2^1}+\frac{0}{2^2}+\frac{0}{2^3})$  

La représentation avec $d_1 \ne 0$ est **normalisée**.  
(En binaire cela implique que $d_1 = 1$)  

L'ensemble des réels possédant une représentation normalisée est noté $\mathbb{F}$  
> Exemple:  
> ![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/38eb6755-ecf7-49e0-97be-019d79fc810c)

### Erreur d'arrondi

$\text{fl}(x) = \,$ le réel dans $\mathbb{F}$ le plus proche de $x \in \mathbb{R}$  
> Exemple (avec le précédent):  
> ![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/b680ded8-2a95-467a-a979-f0745b373ef9)

$u$: l'unité d'arrondi  
$u := \frac{1}{2}\beta^{1-t} \ge \frac{|fl(x)-x|}{|x|}$  

**erreur absolue**: $\epsilon_{abs} = |\widehat{x}-x|$  
**erreur relative**(pour $x \ne 0$): $\epsilon_{rel} = \frac{|\widehat{x}-x|}{|x|}$  

En _double_ (64bit): $u \simeq 1.1*10^{-16}$  

### Conditionnement
Stabilité directe  
En x s'il exite $C_1$, $C_2 \ge 1$ tq:  
$$||\widehat{y}-y|| \le C_1 ||f(x+\delta x)-f(x)||$$  
qu'on peut diviser par $||y||$ à gauche et $||f(x)||$ à droite  
Pour au moins un $\delta x$ tq $||\delta x||/||x|| \le C_2 u$  

Le **conditionnement**:  
$\kappa(x) := \underset{\epsilon \rightarrow 0}{\lim} (\underset{||\delta x|| \le \epsilon||x||}{\sup}(\frac{||f(x+ \delta x)-f(x)|| / ||f(x)||}{||\delta x|| / ||x||}))$  
Le **conditionnement** est le **pire des facteurs** par lequel il faut multiplier les erreurs relatives dans $x$ pour obtenir les erreurs relatives dans $f(x)$ (avec erreurs -> 0)  

$\kappa(x) = \sup\frac{\text{erreur relative résultat}}{\text{erreur relative données}}$  

- conditionnement ne dépend pas de l'algo, mais bien du problème considéré (via $y=f(x)$)  
- si $\kappa(x) >> 1$ problème mal conditionné  
- si f(x) différenciable (et f'(x) matr Jacobienne):  
    $\kappa(x) = \frac{||f'(x)||.||x||}{||f(x)||}$  

**erreur inverse** $\Delta x$ d'un algo $\widehat{y}$:  
tq $f(x+ \Delta x) = \widehat{y}$  

----

## Chap 2

Système linéaire $Ax=b$  

### Conditionnement système linéaire
> #### cas 1
> Perturbations $\delta b$ de $b$  
> $\kappa = \sup_{||\delta b||}(\frac{||\delta x||/||x||}{||\delta b||/||b||}) \le \frac{||A^{-1}||.||b||}{||x||} = \frac{||A^{-1}||.||Ax||}{||x||} \le ||A^{-1}||.||A||$  
> 
> #### cas 2
> Perturbations $\delta A$ de $A$  
> $\kappa = \sup_{||\delta A||}(\frac{||\delta x||/||x||}{||\delta A||/||A||}) \le ||A^{-1}||.||A||$  
> 

Erreurs dans les données A,b d'un système linéaire sont amplifiées par (au plus):  
$\kappa(A) := ||A^{-1}||.||A||$  
$\kappa(A)$: conditionnement de la matrice $A$  

_en Octave: `cond()`_  

### Factorisation LU
$LUx=b$ où $Ux=y$  
(par ex: $L_2L_1Ax=L_2L_1b$ où en fait $L_2L_1A=U$ => $A=LU$)  

`x = U\(L\b)`  
`L\b` est un système triangulaire (inférieur) (`L` est une matrice triangulaire inférieure et `b` matrice colonne)  
`U\(L\b)` est un système triangulaire (supérieur) (`U` est une matrice triangulaire supérieure et `(L\b)` matrice colonne)  
$\Rightarrow$ on peut utiliser donc `\` à l'exam comme ce sont des systèmes triangulaires :D  

#### Algo Octave:
```matlab
function [L U] = factLU (A)
    n = size(A, 1); # ordre de la matrice (plutot que length(A))
    for k = 1:n
        for j = k:n
        # on construit ligne par ligne
            U(k,j) = A(k,j);
        endfor
        L(k,k) = 1;
        for i = k+1:n
            L(i,k) = A(i,k)/A(k,k);
            # on cree les coeff de l'elimination de Gauss (dans la premiere colonne quand k vaut 1)
        endfor
        for i = k+a:n
            for j = k+1:n
                A(i,j) = A(i,j) - ( L(i,k) * A(k,j) );
            endfor
        endfor
    endfor
endfunction
```

puis on fait  
```matlab
A=...;
[L U] = factLU(A)
x = U\(L\b) # moyen mémo ULB, attention parantheses
```

- coût LU: $\frac{2}{3}n^3 + O(n^2)$ flops
- si fact LU existe, elle est **unique**
- existe **pas toujours** pour matrices régulières
- **pas stable** (alors on va faire avec pivot => PALU)

### Factorisation PALU

$PA=LU$

- même coût que LU
- **existe** pour toute matrice régulière
- réputée **stable en pratique**

Permet le calcul du dét(A) ($A$ matrice $n\times n$):  
$\text{det}(A) = \text{det}(U)/\text{det}(P)$  
$\:= (-1)^p a_{11}^{}(1) \cdot\cdot\cdot a_{nn}^{(n)}$  
> ($\text{det}(L) = 1$, comme éléments diagonaux $=1$ et matrice triangulaire)  
> ($\text{det}(U)=$ produit des éléments diagonaux $a_{kk}^{(k)}, k=1,...\,,n$ $\Rightarrow \text{det}(U)= a_{11}^{(1)} \cdot\cdot\cdot a_{nn}^{(n)}$)  
> ($\text{det}(P_i) = \pm1$, où $-$ si la permutation a effectivement eu lieu, $+$ si on a pas permuté $\Rightarrow \text{det}(P) = (-1)^p$ avec $p$ le nombre de permutations effectuées)  
> 
> **Rappel**: pour deux matrices **carrées** $B$, $C$:  
> $\text{det}(BC)=\text{det}(B)\text{det}(C)$

Permet aussi l'inversion matricielle (_slide 25 ch2_)  
> si $x_i$ est la colonne $i$ de $A^{-1}$ alors elle est la sol de $Ax_i=e_i$  
> avec $e_i$ le vecteur de la base canonique (sa composante $i$ vaut $1$ et les autres valent $0$)  

Calculer $A^{-1}$ en  
1. calulant la factorisation $PA=LU$ de $A$  
    > ($\frac{2}{3}n^3+\mathcal{O}(n^2)$ flops)  
2. permutant (pour $i=1, ...\, ,n$) $e_{pi}=Pe_i$  
    > ($0$ flops, au plus $n(n-1)$ permutations)  
3. résolvant (pour $i=1, ...\, ,n$) $Ly_i=e_{pi}$  
    > ($n^3$ flops)  
4. résolvant (pour $i=1, ...\, ,n$) $Ux_i=y_i$  
    > ($n^3$ flops)  

pour $\frac{8}{3}n^3+\mathcal{O}(n^2)$ flops en tout  

#### Algo Octave:
```matlab
function [L U P] = factPALU (A)
    #n = size(A,1);
    P1 = eye(4);
    P2 = eye(4);
    P3 = eye(4); # ? 3 matrices P car A d'ordre 4??
    U = A; # on pourrait juste tout faire avec A et à la fin mettre U=A

    P1([1,4],:) = P1([4,1],:); % on switch les LIGNES 1 et 4 de P1
    # ^ (change direct les deux lignes)

    U = P1*U;

    #pour les L on va remplacer les éléments de chaque colonne, qui sont
    #en dessous de la diagonale 

    # construction de L1
    L1 = eye(4);
    L1([2:4],1) = -U([2:4],1)/U(1,1);
    # remplace le 2e, 3e et 4e élément de la 1e colonne de L1
    # par l'opposé du:
    # 2e, 3e et 4e élément de la première colonne de U (//ou A), divisé par le 1e element
    # (info: ce 1e element étant donc sur la diagonale)

    U=L1*U;
    # L1 sert à faire apparaitre des zeros dans la premiere colonne
    # (elimination de gauss)

    # --- meme chose avec P2 ---
    P2([2,4],:) = P2([4,2],:); # switch lignes 2 et 4 de P2

    U=P2*U;

    #construction de L2
    L2=eye(4);
    L2([3:4],2) = -U([3:4],2)/U(2,2);
    # remplace le 3e et 4e element de la 2e colonne de L2
    # par l'opposé du:
    # 3e et 4e element de la 2e colonne de A, divisé par le 2e element
    # (info: ce 2e element étant sur la diagonale)

    U=L2*U;

    # --- meme chose avec P3 ---
    # (4e element de la 3e colonne (sous la diagonale donc))
    P3([3,4],:) = P3([4,3],:);
    U=P3*U;
    L3=eye(4);
    L3(4,3) = -U(4,3)/U(3,3); # ([4,4], ) = (4, )
    U=L3*U;

    # L = ( ... matrice identité dont les colonnes du triangle inférieur sont -Lp1 et -Lp2 et -Lp3
    Lp3 = L3;  # Lp: "L prime" (L')
    Lp2 = P3*L2*P3;
    Lp1 = P3*P2*L1*P2*P3;
    P = P3*P2*P1
    L=eye(4) # matrice identité
    # triangle inférieur sera les colonnes opposées de Lp1 Lp2 et Lp3
    L([2:4],1) = -Lp1([2:4],1);
    L([3:4],2) = -Lp2([3:4],2);
    L(4,3) = -Lp3(4,3)

    # ici U a déjà été modifié de la matrice A de départ pendant le calcul

endfunction
```

qu'on peut faire:  
```matlab
A=...;
[L U P] = factPALU(A)
# x = ?? U\(L\(P*b)) ??
```

On peut ensuite aussi utiliser la func `lu()` de Octave pour (seulement) vérifier (`[L U P] = lu(A)`)  

#### Résolution sys
$x = U^{-1}L^{-1}(P*b)$ ?

##### Étapes et Coûts
(matrice A est $m \times n$)
1. Former $A^T A$, $A^Tb$  
  **coût = $mn^2$ (symétrie) $+ 2mn$ flops**
2. Calculer la fact LU avec pivot $LU = P(A^T A)$  
  **coût = $\frac{2}{3}n^3$ flops**
3. résoudre $Ly = P(A^T b)$ et $Ux=y$  
  **coût = $2n^2$ flops**

## Chap 3

### Factorisation QR
Matrice $Q$ orthogonale : carrée et $Q^TQ = I$  

$R = (r_{ij})$ trapézoidale suéprieure si $r_{ij}=0$ pour tout $i>j$  

$A = QR$  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/d449b37b-ef3e-4d7c-8b9a-a26efbffb4a9)

#### Algo Octave:
(on peut le faire en boucle `for`):  
```matlab
function [Q R] = factQR (A)
  x = A(:,1);
  x(1) = x(1) + sign(x(1))*norm(x);
  v1 = x/norm(x);
  # H = I - 2*v*transpose(v)
  A = (eye(4)-2*v1*transpose(v1))*A;
  #    ^^^^^^^^^^^^^^^^^^^^^^=Q1
  x = A(:,2);
  x(1) = x(1) + sign(x(1))*norm(x);
  v2 = x/norm(x);
  A = (eye(4)-2*v2*transpose(v2))*A;
  
  x = A(:,3);
  x(1) = x(1) + sign(x(1))*norm(x);
  v3 = x/norm(x);
  A = (eye(4)-2*v3*transpose(v3))*A;
  
  x = A(:,4);
  x(1) = x(1) + sign(x(1))*norm(x);
  v4 = x/norm(x);
  A = (eye(4)-2*v4*transpose(v4))*A
  
  # Créer la matrice Q :
  #   Q = Q1*Q2*Q3
  # mais 4x4 3x3 2x2 
  # Qi est en fait identité avec en bas à gauche la matrice avec les infos
  # voir photo Q = ....
  Q = eye(4);
  Q(3:4,3:4)=(eye(2)-2*v3*transpose(v3))*Q(3:4,3:4);
  Q(2:4,2:4)=(eye(3)-2*v2*transpose(v2))*Q(2:4,2:4);
  Q(1:4,1:4)=(eye(4)-2*v1*transpose(v1))*Q(1:4,1:4)
  
endfunction
```

pour ensuite:  
```matlab
A=...;
[Q R] = factQR(A)
```

on peut ensuite aussi (seulement) vérifier avec `qr(A)` d'Octave (ou `qr(A,0)` pour une QR réduite)  

- coût: $2n^2(m-n/3)+O(mn)$ pour une matrice A de dimensions $m \times n$  

#### Résolution sys
$x = \hat{R}^{-1}\hat{Q}^T b$

($\hat{R}$ est triangulaire (supérieure) donc devrait être facile à inverser)  
($Q^{-1}=Q^T$ car Q orthogonale)

##### Étapes et Coûts
(matrice A est $m \times n$)
1. Factorisation $\hat{Q}\hat{R}=A$  
  **coût = $2n^2(m-\frac{n}{3})$ flops**
2. Former $\hat{Q}^T b$  
  **coût = $4mn$ flops**
3. Résoudre $\hat{R} x = \hat{Q}^T b$  
  **coût = $n^2$ flops**

### Interlude: propriétés Norme Euclidienne
? nécessaire ?

### Conditionnement systèmes surdéterminés
? nécessaire ?  
> ??  

## Chap 4
Méthodes itératives pour systèmes linéaires  
=> résoudre $Ax=b$ de manière itérative  
$(k)$ num d'itération  
erreur $e^{(k)} = x - \widehat{x}(k)$  
$Ae^{(k)} = b - A x^{(k)}$  
On peut définir $B \simeq A$ si B est plus facile à inverser  

$x^{(k+1)} = x^{(k)} + e^{(k)}$ -> il faut que cette erreur tende vers 0 après les itérations  
=> $x^{(k+1)} = x^{(k)} + B^{-1}(b - Ax^{(k)})$  

On devra mettre un critère d'arrêt  
$\frac{||r^{(k)}||}{||b||} \le 10^{-3}$ ($10^{-3}$ par exemple ici)  


$\frac{||\widetilde{x}-x||}{||x||} \le k(A) \frac{||r^{(k)}||}{||b||}$  


### Méthodes stationnaires
> ?
### Jacobi
> matrice tri-diagonale  
> première ligne, que 1 voisin  

$B_J = D_A$  
($D_A$: diagonale de A)  

#### Algo Octave:

```matlab
function [pfait, rsurb, sol] = tp6(A, b, critdarret)
    
    x = zeros(size(A,1),1);
    n = size(A,1) 

    p = 1;
    pfait = p;
    residu = norm(b-A*x);
    rsurb = residu/norm(b);

    while rsurb > critdarret && p < 200
    
        x(1) = (1/A(1,1))*(b(1) - A(1,2)*x(2));

        for i = 2:n-1
            x(i)=(1/A(i,i))*(b(i) - A(i, i-1)*x(i-1) - A(i, i+1)*x(i+1));
        endfor
        %A(n,n);
        %x(n)=(1/A(n,n))*(b(n) - A(n, n-1)*x(n-1));
        x(n)=(1/A(n,n))*(b(n) - A(n, n-1)*x(n-1));

        sol = x;
        pfait = p;
        residu = norm(b-A*x);
        rsurb = residu/norm(b);

        p++;

    endwhile

endfunction
```

Exemple de crit d'arret: $10^{-3}$  


### Gauss-Seidel
Algo: en gros pareil que Jacobi mais sans $x(0)$  

$B_{GS} = L_A$  
Rappel: $A = L_A + U_A - D_A$  
($L_A$: triangulaire lower de A  
$U_A$: triangulaire upper de A  
$D_A$: diagonale de A)  

#### Algo Octave:

```matlab
function [pfait, rsurb, sol] = tp6ex2(A, b, critdarret)

    n = size(A,1);
    x = zeros(n,1)

    p = 1;
    pfait = p;
    residu = norm(b-A*x);
    rsurb = residu/norm(b);

    while rsurb > critdarret && p < 200
        
        x(1) =  (1/A(1,1))*(b(1) - A(1,2)*x(2))

        for i = 2:n-1
            x(i) = (1/A(i,i))*(b(i) - A(i,i-1)*x(i-1) - A(i,i+1)*x(i+1))
        endfor

        x(n) = (1/A(n,n))*(b(n) - A(n, n-1)*x(n-1));

        pfait = p;
        residu = norm(b-A*x);
        rsurb = residu/norm(b);
        sol = x;

        p++;

    endwhile  
  
endfunction
```

Exemple de crit d'arret: $10^{-3}$  


On peut comparer  
$\frac{||\widetilde{x}-x||}{||x||}$ de Jacobi et Gauss-Seidel.  


### Minimisation d'énergie
Norme énergie: $||v||_A = \sqrt{v^TAv}$  

Principe: choisi une direction $p \ne 0$ et que forme solution approchée à l'iter $k+1$ est  
$$x^{(k+1)}(\alpha) = x^{(k)} + \alpha p$$  
Trouver la valeur de $\alpha$ qui minimise $f(x^{(k+1)})$  
$$\alpha = \frac{p^Tr^{(k)}}{p^TAp}$$

---
> [!WARNING] 
> **/!\ système avec A symétrique définie positive**  

L'énergie d'un système est définie par la fonction:  
$$\begin{align}
f(x^{(k)}) := ||x-x^{(k)}||^k_A &= (x-x^{(k)})^T A (x-x^{(k)}) \\
&= x^{(k)T} Ax^{(k)} -2x^{(k)T}Ax + x^TAx \\
&= x^{(k)T} Ax^{(k)} -2x^{(k)T}b + \text{cste}
\end{align}$$

Soit une direction $p \ne 0$  

$\alpha = \frac{p^Tr^{(k)}}{p^TAp}$ minimise l'énergie $f(x^{(k+A)}$ de  
$$x^{(k+1)}(\alpha) = x^{(k)} + \alpha p$$

#### Algo:
> TODO
```matlab
...
```

### Méthode du gradient
> ?

#### Algo
> TODO

### Méthode du gradient conjugué
> ?

### Controle de convergence
> ?

### Critère d'arret
Norme du résidu...

> **TP6: interpollation ?**

## Chap 5
Équations et systèmes non-linéaires  

### Dichotomie
Critère d'arrêt de limite d'iterations

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/fe5dd4b7-aa39-497d-8f3b-2bf10b529ff6)

#### Algo Octave:
```matlab
function [niterations, sol] = algodicho(f, a, b, espilon)
  niterations = 0;
  while abs(a-b) > espilon & niterations < 69
    niterations++;
    x = (a + b)/2;
    if f(a)*f(x) < 0
      b = x;
    endif
    if f(b)*f(x) < 0
      a = x;
    endif

    # critère d'arret:
    if f(x) < 10^(-6) # plutot que f(x(k)) == 0 car précision
      sol = x;
      break
    endif
  endwhile
endfunction
```
puis  
```matlab
[nbr_iter sol] = algodicho(f, a, b, epsilon) #on peut aussi passer un critère d'arret plutot que de le hardcoder
```

### Fausse position
Critère d'arrêt: on va évaluer si $f(x^{(k+1)}) < \epsilon$  
> ?

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/49dbf298-4f79-48a5-8df9-e3681053a6c3)


#### Algo Octave:
```matlab
function [n, sol] = algofaussepos(f, a, b)
  n = 0;
  while n < 69
    n++;
    x = a - f(a)*((b-a)/(f(b)-f(a)));
    if f(a)*f(x) < 0
      b = x;
    endif
    if f(b)*f(x) < 0
      a = x;
    endif

    # critere d'arret
    if f(x) < 10^(-6) # plutot que f(x(k)) == 0 car précision
      sol = x;
      break
    endif
  endwhile
endfunction
```
puis  
```matlab
[n_iter sol] = algofaussepos(f, a, b) #on peut aussi passer un critère d'arret plutot que de le hardcoder
```

### Newton-Raphson
Principe: prendre pour $x_{k+1}$ la racine du développement de Taylor de premier ordre autour de $x_k$  
Cela revient,pour autant que $f'(x_k) \ne 0$, à déterminer $x_{k+1}$ qui satisfait:  
$$f(x_k) + f'(x_k)(x_{k+1}-x_k) = 0$$  
et donc $x_{k+1} = x_k - \frac{f(x_k)}{f'(x_k)}$

---
> [!WARNING] 
> **ATTENTION**: **il faut connaitre la dérivée de cette fonction**  

On choisi un $x_0$ suffisamment proche de la racine (en regardant un plot par ex)  
Si racine est un extremum: cette methode est pas super précise  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/ec25e90e-df1f-4f2b-93c2-a8a7e79d647d)


Deux problèmes:  
- si ça converge pas  
![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/990cd124-3b3e-4fc9-aa13-24458c25c171)

- si c'est cyclique  
![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/8c18a67d-aee0-45c8-a8a4-ab8889688475)

Convergence d'une suite $x_k$, $k=0,1...$ vers $x$ est d'ordre $p$ s'il existe une constante $C$ tq:
$$|x-x_{k+1}| \le C|x-x_k|^p$$  
- si $p=1$ et $C<1$ **convergence linéaire**  
- si $p=2$ **convergence quadratique**  
- si $\lim_{k\to\infty} \frac{|x-x_{k+1}|}{|x-x_k|} = 0$ **convergence superlinéaire**

#### Algo Octave:
```matlab
function [n, sol] = algonewtonraphson(f, fprime, x0)
  n = 0;
  %x = x0 - f(x0)/fprime(x0); % si scalaire
  x = x0 - fprime(x0)\f(x0); % pour vectoriel ET scalaire

  #while (fprime(x) > 10^(-4)) & (fprime(x) < -10^(-4)) & n < 50
  # critere d'arret
  while n < 69
    n++;
    %x = x - f(x)/fprime(x); % si scalaire
    x = x - fprime(x)\f(x); % pour vectoriel ET scalaire
  endwhile
  sol = x;
endfunction
```
puis  
```matlab
[n_iter sol] = algorewtonraphson(f, fprime, x0) #on peut aussi passer un critère d'arret plutot que de le hardcoder
```

### N-R avec recherche linéaire
Principe: même chose que N-R mais avec un facteur d'amortissement $\alpha_k$ dans l'incrément, qui réduit à chaque itération (on le divise par 2)  
Équation =>  
$$x_{k+1} = x_k - \alpha_k\frac{f(x_k)}{f'(x_k)}$$  
En cherchant un facteur $\alpha_k$ qui satisfait $|f(x_{k+1})| < |f(x_k)|$  
Elle permet d'empêcher un comportement cyclique avec un simple N-R.

> Taylor: $f(x_{k+1}) = f(x_k) + f'(c)(x_{k+1}-x_k) = f(x_k)(1-\alpha_k \frac{f'(c)}{f(x_k)})$  
> ...  

---
**Besoin aussi de f' comme N-R**
On utilise un facteur d'amortissement $\alpha_k > 0$, qu'on va diviser par 2 jusqu'à l'arret (on commence avec $\alpha=1$)  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/295ba8ef-a799-43cf-b093-d0abf5d85c0f)


#### Algo Octave:
```matlab
function [n, sol] = algonrrecherchelin(f, fprime, x0)
  n = 0;
  alpha = 1;

  # critere d'arret
  while n < 69
    n++;
    p = f(x0)/fprime(x0)
    x = x0 - alpha*p;
    if abs(f(x)) < abs(f(x0));
      break
    endif
    alpha = alpha/2
    x0 = x
  endwhile
  sol = x;
endfunction
```
puis  
```matlab
[n_iter sol] = algonrrecherchelin(f, fprime, x0) #on peut aussi passer un critère d'arret plutot que de le hardcoder
```

### Variantes
On peut exprimer $f'(x)$ sans le connaitre...  
- formule de différences finies...  
- méthode de la sécante...  

### Généralisation au systèmes non-linéaires
LU...  

> ?

### Newton-Corde
Principe: factorisation LU peut être couteux pour système à taille importante => LU remplacée par méthode itérative.
Convergence n'est plus quadratique  
Factorisation fait qu'une seule fois au début de l'algo  

### Critères d'arrêt
- **[+]** $||f(x_k)|| \le \epsilon_a$ (ou relativement $||f(x_k)|| \le \epsilon_r||f(x_0)||$)
- **[-]** nombre max d'itérations
- **[-]** Pour les méthodes de type Newton, le fait que la dérivée $f'(x_k)$ ou son
Approximation soit non-inversible peut mener à l’arrêt de la méthode.

## Chap 6
Interpolation et approximation  
...  
> TODO  


## Chap 7
Intégration  

### Methode des trapèzes
On s'approche de f par interpolation linéaire  
Intervalles réguliers  
Prendre un intervalle $h$ entre $x_i$ et $x_{i+1}$  
$$\int_{x_i}^{x_{i+1}} f(x)dx = \frac{h_i}{2}(f_i + f_{i+1}) + E_{loc}(h_i)$$
> Aire trapèze $= h * (f(a)+f(a+b)) / 2$ (petite base + grande base fois hauteur (l'intervale) sur 2)  
Plus h est petit, plus c'est précis  
On risque que  la longueur $[a,b]$ soit pas un nombre entier de fois h,  
alors $h = (b-a) / n$ avec $n$ le nombre d'intervalles  

[!WARNING]  
**Exacte pour tout polynome de degré au plus 1** (**Ne veut pas dire que c'est pas applicable, juste que l'erreur ne sera pas nulle**)  
(pourquoi? : car erreur dépend de la dérivée seconde, donc si au plus degré 1 $\Rightarrow f'' = 0$ donc erreur nulle (globale ou locale), voir point suivant: erreur)  

#### Erreurs
$c \in ]x_i,x_{x+1}[$  
**Erreur locale**: $E_{loc}(h_i) = -\frac{1}{12}h^3_i f''(c)$  

$c \in ]a,b[$  
**Erreur globale**: $E_{glob}(h) = -\frac{1}{12}(b-a)h^2 f''(c)$

#### Algo Octave:
```matlab
function [aire] = tp9trapezes (f, a, b, h)
  
  n=(b-a)/h;
  int = 0;
  
  for i = 0:n-1
    int = int + ( h/2 )*( f(a + h*i) + f(a + h*(i+1)) );
  endfor
  
  aire = int;
  
endfunction
```

### Methode de Simpson
On s'approche de f par interpolation quadratique  
> Point au milieu de $[a+h,a+2h]$ : $a + \frac{3}{2}h$  
> intégrale $= (f(a+h) + h*f(a+\frac{3}{2}h) + f(a+2h)) / 6$  

$$\int_{x_i}^{x_{i+1}}f(x)dx \approx \frac{h_i}{6}(f_i + 4f_{i+1/2} + f_{i+1})$$  
(voir Newton-Cotes)  

[!WARNING]  
**Exact pour tout polynome de degré au plus 3** (**Ne veut pas dire que c'est pas applicable, juste que l'erreur ne sera pas nulle**)  
(pourquoi? : car erreur dépend de la dérivée 4ème, donc si au plus degré 3 $\Rightarrow f^{(4)} = 0$ donc erreur nulle (globale ou locale), voir point suivant: erreur)  

#### Erreurs  
$E_{loc}(h) \sim f^{(4)} h^5$  
$E_{glob}(h) \sim (b-a) f^{(4)} h^4$  
> $|E_{glob}| = -\frac{1}{12} * (b-a)*h^2*|f''(c)|$  
> c est un réel appartenant à $[a,b]$  
> 
> $|E_{glob}| \le 10^{-6}$  
> $h^2*|f''(c)| \le 10^{-6}$  
> 
> on va sortir un $h_{erreur} \le sqrt((12*10^-6)/((b-a)*|f''(c)|))$  
> $n = (b-a)/h_{erreur}$ ; appartient PAS à N  
> 
> `n = ceil(n)`  
> $h_{effetif} = (b-a)/n \le h_{erreur}$  
> que quand la methode est pas exacte, que quand il y a une erreur à calculer  

Si l'interpollation de la fonction est exacte (donc si fonction de degré au plus 3) le h est indépendant de l'erreur (car pas d'erreur) donc on peut prendre le h qu'on veut  

#### Algo Octave:
```matlab
function [aire] = tp9simpson(f, a, b, n)
  h = (b-a)/n;
  int = 0;
  for i=0:n-1
    int = int + (h/6)*(f(a+i*h)+4*f(a+h*(i+0.5))+f(a+h*(i+1)));
  endfor
  
  aire = int;
  
endfunction
```

### Méthode de Newton-Cotes
Pour degrés $n \le 4$  
On sait retrouver la formule des trapèzes et de Simspon, et leurs erreur globale et locale  
pour $f$ de degré $n$:  
$$\int_{x_i}^{x_{i+1}} f(x)dx = h_i(w_i f_i+w_2 f_{i+1/n}+ ... + w_{n+1} f_{i+1})$$  
où $w_i$ (ici pour les degrés $n \le 4$) :  
![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/d0d5fdd6-fed8-453f-be9b-5940abf75b50)  
On peut voir que $n=1$ donne la méthode des trapèzes et que $n=2$ donne Simpson!  
En plus Newton-Cotes est donné dans le formulaire à l'examen! (mais pas les colonnes avec les erreurs)  
### Méthode de Romberg
...  
> ?  

## Chap 8 équations différentielles avec Conditions Initiales  
Problème de Cauchy (scalaire ou vectoriel)  
$$\begin{cases}
\frac{dy}{dt}(t) = f(t,y(t)), t \in [0,T] \\
y(0) = y_0
\end{cases}$$

### Méthode d'Euler
Ordre: 1  
Un pas de discrétisation: $h_k = t_{k+1}-t_k$  
(ou pas d"intégration).  
$h$ plus petit donne une meilleur solution (on observe que si on double le pas, l'erreur est 2x plus grande (linéairement)).  
Erreur $|y_k-y(t_k)|$ semble proportionnelle à $h$.  

D'ordre 2 l'erreur augmenterait de manière quadratique.  

#### Euler progressive
Méthode explicite  
Stabilité: **pas toujours** stable  
Principe: approcher la dérivée au point $t_k$ par...?  
$\Rightarrow$ on va vers l'avant  

$$y_{k+1} = y_k + h_kf(t_k,y_k)$$

##### Algo Octave:
```matlab
function [y] = tp10eulerpro (f, y0, t) # t contient t_min et t_max
  
  n = length(t);
  h = t(2) - t(1); # h constante
  y(1)=y0;

  for i = 1:n-1
    y(i+1) = y(i)+h*f(t(i),y(i));
  endfor
  
endfunction
```

#### Euler rétrograde
Méthode implicite (pas moyen d'isoler directement $y_{k+1}$ àpd $y_k$)  
Stabilité: **toujours stable**  
Principe: approcher la dérivée au point $t_{k+1}$ par...?  
$\Rightarrow$ on va vers l'arrière  

$$y_{k+1} = y_k + h_kf(t_{k+1},y_{k+1})$$

(On peut utiliser la fonction Octave `fsolve(g, y(k))` pour la résolution d'équations non linéaires, où `g` la fctn et `y(k)` aux alentours où il faut chercher)  

##### Algo Octave:
```matlab
function [y] = tp10eulerret (f, y0, t) # t contient t_min et t_max
  
  n = length(t);
  h = t(2) - t(1); # h constante
  y(1)=y0;
  
  for i = 1:n-1
    g=@(X) y(i) + h*f(t(i+1),X) - X;
    y(i+1) = fsolve(g, y(i));
  endfor

endfunction
```

### Ordre
Méthode est d'ordre $n$ si:
$$\max_k |y_k-y(t_k)| \le Ch^n$$  

(Les méthodes d'Euler sont de **1er** ordre)  

### Stabilité
Prenons un problème de Cauchy où $\frac{dy}{dt}(t) = - \beta y(t)$  
La solution exacte est $y(t) = y_0e^{-\beta t}$ elle tend vers 0 pour $\beta>0$ et croît pour $\beta<0$  

- méthode (absolument) stable pour le problème de Cauchy avec $\beta > 0$ si:  
    elle produit une séquence de $y_k$, $k=1,2...$, d'approximations de y(t_k) telle que:  
    $$y_k \to 0 \text{ lorsque } t_k \to \infty$$  
    (en gros lorsque la "suite" $y_k$ tend vers $0$ quand $t_k \to \infty$)

- euler **progressive**: **pas toujours** (stable si $|A-h\beta_i|<1$, $i=1,...,n$)  
- euler **retrograde**: **toujours stable** stable (pour tout $h$)  

> ex: euler progressive absolument **pas** stable si $h\beta < >? 2$  
> ?  

### Méthode du second ordre

#### Méthode de Crank-Nicolson
Principe: méthode s'obtient en approchant l'intégrale par la formule des trapèzes.  
Méthode implicite (pas moyen d'isoler directement $y_{k+1}$ àpd $y_k$).  
Ordre: 2 ($|y_k-y(t_k)| \propto h^2$)  
Stabilité: stable, quel que soit le pas $h_k$.  

Équation:  
$$y_{k+1} = y_k + \frac{1}{2}h_k(f(t_k,y_k) + f(t_{k+1},y_{k+1}))$$  
où comme avant $h_k = t_{k+1} - t_k$  

##### Algo Octave:
?  
> TODO  

#### Méthode de Heun (ou Runge-Kutta d'ordre 2)
Principe: rendre la méthode de Crank-Nicolson explicite sur base de la formule d'Euler progressive.  
Méthode explicite  
Ordre: 2 ($|y_k-y(t_k)| \propto h^2$)  
Stabilité: stable si $h\beta < 2$.  

Équation:  
$$y_{k+1} = y_k + \frac{1}{2}h_k(f(t_k,y_k) + f(t_{k+1},y_k+h_k f(t_k,y_k)))$$  
en gros on a changé $y_{k+1}$ dans le membre de droite par $y_k + h_k f(t_k,y_k)$ (la formule d'Euler Progressive).  
Ce qui la rend donc explicite.  

##### Algo Octave:
?  
> TODO  

### Méthode multi-pas
...  
> ?  

## Chap 9 équations différentielles avec Conditions aux Limites

croisons les doigts que ça tombe pas à l'exam :(  

-------------

_by Lucas Placentino - &copy; 2023_
