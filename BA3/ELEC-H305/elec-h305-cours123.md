# Elec-h305  
## Cours 1 (Th01 a et b)  
Systèmes logiques  

_conception, réalisation, synthèse_ d'un circuit  
- **modélisation**  
- **réalisation**  

### Circuits et modèles
Y-chart (Behavioral, Structural, Geometry)  
**Portes** et **fonctions logiques**  

### Bases

Nombres réels en **virgule fixe**  
3 parties:  
- partie entière  
- point décimal  
- partie fractionnaire

forme généralisée, base arbitraire  
nombre $N$ en base $r$, noté $N_r$  
$N_r = E + F$ (E: partie entière, F: partie fractionnaire)  

Dans $N_r$ (voir _slide 14_)  
pour la partie entière on distingue:  
- $i = n$ MSB: Most Significant Bit  
- $i = 0$ LSN: Least Significant Bit  
convention: **MSB à gauche, LSB à droite** (sauf mention)  

deux groupes de bases:  
- base utile humains: _décimal_ r=10  
- base utile électronique numérique:  
    - _binaire r=2_  
    - _octal r=8_  
    - _hexadécimal r=16_  

important de savoir passer d'une base à l'autre: _conversions_, _calculs arithmétiques_  

exemple:  
décimal | binaire | octal | hex 
--- | --- | --- | --- 
0 | 00000 | 0 | 0  
3 | 00011 | 3 | 3  
8 | 01000 | 10 | 8  
12 | 01100 | 14 | C  
15 | 01111 | 17 | F  
16 | 10000 | 20 | 10

- binaire: 0-1  
- octal: 0-7  
- hex: 0-9,A-F  

### Conversions
**Méthode des divisions successives**  
_VOIR SLIDE 18_  
##### Partie entière _SLIDE 19_  
ex: 245 = 11110101 avec le MSB à gauche (en premier)  
##### Partie fractionnaire _SLIDE 20 (attention lecture de haut en bas)_  
ex: 0.345 = .0101100001...  

#### Conversion généralisées  
passer d'un base à l'autre:  
par facilité: on passe d'abord par la base 10  

_VOIR SLIDE 27_  
conversion par regroupement de 3 (base 8) ou de 4 (base 16)  

### 5. Opérations arithmétiques en base fixe  
#### addition (binaire) de deux mots $a$ et $b$ d'un bit, $s=a+b$  
résusltat, le mot $s$  
$s_0$ : la **somme**  
$s_1$ : le **report (carry)**  
**circuit demi-additionneur (half-adder)** :  
$a$|$b$|$s_1$|$s_0$|explication
---|---|---|---|---
0|0|0|0|0+0 = 0
0|1|0|1|0+1 = 1
1|0|0|1|1+0 = 0
1|1|1|0|1+1 = 0 +1

#### Addition de trois mots a,b,c d'un bit  
table de huit lignes comme trois mots (2^3) (slide 31)  
**additionneur complet (full-adder)**  

#### Addition de 2 mots de $n$ bits  
résultat $s$ est un mot de $n + 1$ bits (+1 dû au report), obtenu en _effectuant $n$ sommes de bit à bit_ et en prenant le report pour la somme suivante (comme décimal)  
(_slide 32_)  

#### Premier circuit logique: addition binaire  
**additionneur à propagation de report (ripple carry adder)**  
1 half-adder pour calculer le premier bit (le LSB)  
ensuite $n-1$ full-adders pour les autres bits  

le rapport doit se propager à travers chaque adder, doit se propager  
ne fonctionne que pour un circuit théorique, pas pour un physique  

possible problème de **débordement (overflow)** et donc de nombre tronqué  
besoin de tester le bit d'overflow pour savoir qu'il y a eu un overflow  

#### Soustraction de deux mots d'un bit  
$s = a - b$  
résultat $s$, le mot de 1 bit $s_0$  
lorsque 0 - 1 ,alors il faut **emprunter (borrow)**
$a_1$|$a_0$|$b$|$s_0$
---|---|---|---
0|0|0|0
1|0|1|1 <---
0|1|0|1
0|1|1|0

#### Multiplication
avec **additions successives**  
_SLIDE 38_  

#### Division
avec **soustractions successives**
_SLIDE 39_

### Nombres négatifs en binaire  
trois modes de représentation:  
1. Signe et Valeur Absolue (SVA)
2. Complément à la base
3. Complément à 2

#### 1. SVA - Signe et Val Absolue
- O : positif  
- 1 : négatif
pour 8 bit:
- 1 bit réservé pour le signe
- 7 bit pour la valeur absolue
8bits: -127 à +127  
1 111111 (-127)  
0 111111 (+127)

_**ATTENTION**_ quid de 2*127 = 254 alors que 2^8=256 ?  
on constate **deux zéros!**  
premier désavantage (moindre) du SVA  
voir _slide 43_  

SVA: opérations arithmétiques  
il faut comparer le signe et comparer la magnitude  
peu pratique en pratique  

#### 2. Complément à la base (n'importe quelle base!)  
motivation: soustraction comme une addition  
$A-B = A+(-B)$  
introduisons $\bar B$ : le **complément à la base 10 (radix complement**) :  
$B + \bar B = r^m$  
on peut alors écrire:  
$A-B=A+(r^m-B)=A+\bar B$  
_EXEMPLE SLIDE 45_  

mais pour réaliser cette soustraction en faisant une addition, on a besoin de $B=(r^m-B)$ !  
=> manipulation (_SLIDE 46_)  
$(r^m)-B$ est un complément de chaque chiffre de $B$  
**super pratique en binaire, chaque chiffre est simplement inversé (physiquement besoin que d'un inverseur)!**

#### 3. Complément à 2 (C2)  
on utilise plutôt $(r^m-1)-B+1$ comme **Complément à 2**  
on introduit un biais, en "décalant" els nombres négatifs d'une place **mais nous avons un seul zéro**  
binaire|C2
---|---
00000000 | 0  
00000001 | 1  
... | ...  
01111111 | +127  
10000000 | -128  
... | ...  
11111111 | -1  

...  
# TODO jusque fin Th03.  



