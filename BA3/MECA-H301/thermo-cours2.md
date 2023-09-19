> 19/09/2023

# Cours 2 - Substances

- Substances pures: composition chimique fixe  
- Substances pseudo-pures: composées de plusieurs substances mais dont la composition est fixe  

**Substance pure**:  

lors d'un changement de phase: substance reste pure  

liquide saturé, vapeur saturée  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/c0330f4a-1c5a-4e93-82bd-87ba693a0461)

> Temp d'ébullition fonction de la pression, pour l'eau, 100°C à une pression de 1 atm, 151,8°C à un pression de 5 atm.  

**Température de saturation**: à une pression donnée, la temp de changement de phase  

**Pression de saturation**: à une temp donée, la pression à laquelle une substance pure change de phase  

On a une table:  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/565d999c-df78-4859-8638-a09deead0fa4)

- Chaleur latente: énergie absorbée ou libérée pendant un processus de changement de phase  
- Chaleur latente **de fusion**  
- Chaleur latente **de vaporisation**  

**Le changement de phase se fait de manière isotherme**  

> exemple d'application: garder un truc cosntant, le mettre avec de l'azote liquide, reste à ~ -200°C (sa temp latente de vaporisation)  

Diagrammes de phases:  
![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/6714685a-d895-4b7c-bfb6-4dc819e50415)  
> diagramme T-v pour l'eau  
- Point critique: point où l'état de liquide saturé et de vapeur saturée sont identiques  

Deux lignes remarquables:
- Liquide saturé
- Vapeur saturée

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/5ee8f9c5-8374-4520-8d74-5d0651210f7c)  

Et en P-v:  
![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/0dba88b7-124d-4c9a-830d-ff48af807857)  

Point triple: coexistance des trois phases  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/f868de05-c3e9-46c1-b80d-e1680fb97418)  

**Attention**:  
2 variables d'états indépendantes sont nécessaire pour définir un état  
Lors d'un équilibre phase-vapeur, P et T ne sont plus indépendantes !  
Mais P-v et T-v oui  

=> On a besoin d'une variable en plus.

### titre vapeur

$$x = \frac{m_{gaz}}{m_{total}} = \frac{m_{gaz}}{m_{gaz}+m_{liquide}}$$

Utilité: calculer le volume spécifique.

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/541df7ad-a188-4598-b1a5-483f6aa2df3d)  

### Équations d'état

2 variables **indépendantes** sont **nécessaires** pour définir un état  
On en a plus que deux (P,T,m,V)  
=> Lien entre ces variables  

$$ P = R (\frac{T}{\nu}) $$

en différente version:  
- en massique (R en J/kgK):
$$ P\nu = RT $$  
$$ PV = mRT $$  

- en molaire ($\bar{R}$ en J/molK):
$$ P\bar{\nu} = \bar{R}T $$  
$$ PV = n\bar{R}T $$  

et évidemment M étant la masse molaire (kg/mol): $R=\frac{\bar{R}}{M}$  

Mais il y aune erreur! _(slide 29)_  

On définit le facteur de compressibilité:  
$$Z= \frac{P\nu}{RT}$$  
ou  
$$ Z=\frac{\nu_{reel}}{\nu_{ideal}} $$  

donne la déviation par rapport à la loi des gaz idéaux  

On peut adimensionnaliser les grandeurs _(slide 31)_  

En fait eu plus on approche le point critiuqe, au plus ça merde  

Éq d'états pour gaz réels:
> _slide 33, 34_  
- Van der Walls
- Beattie-Bridge
- Benedict-Webb-Rubin
- Virial
> pas besoin de connaitre par coeaur les lois  

en temp basse, on a encore des erreur de 100%  

> on utilise alors des relations encore plus complexes

**Nous ici**, on va utiliser la loi des gaz idéaux

# Energie, Travail, Chaleur

### Les cycles

3 concepts: energie, travail, chaleur  

### Energie
$E$, en Joule  

- E spécifique:
- E cinétique:
- E potentielle:
> **! slide 5**

Énergie interne: $U$, en Joule  
$$E=U+m\frac{V^2}{2}+mgz = U+KE+PE$$  
> V: vitesse  

et spécifique:  
> slide 8  

Dans ce cours, KE et PE **en général** négligeables, on étudie des **systèmes stationnaires**  

### Énergie interne
Contient plusieurs types d'énergie:

- Sensible: uniquement fonction de T (si pas de changement d'état)  

- Latente: énergie nécessaire au changement de phase  

- Chimique: combustion -> temp augmente car atomes se réarrengent  
    Devient de l'énergie sensible  
    _Variation d'énergie interne chimique = Variation d'énergie interne sensible_  
- Nucléaire: transfert d'énergie, aussi = variation d'énergie interne sensible  
    Source énorme d'énergie  
- Magnétique...
- Électrique...

On va se focus sur les trois premières:  
- Sensible  
- Latente  
- Chimique  

=> Attention aux hypothèses  

### Conservation
...  
$$\Delta E = \Delta U$$  
> car on néglige la variation d'énergie cinétique et potentielle  

En fait:  
$$\Delta U = 0 = \Delta U_{sensible} + \Delta U_{sensible}$$  
**Base du 1er principe**  

Cycle:  
$\Delta U =$ ?  
On doit alors introduire: **Chaleur** et **Travail**  

### Chaleur

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/da76b88f-7312-4187-babe-0ef7c552af37)  

- **POSITIVE si RECUE par le systeme**  
- **Négative si cédée**  

S'il n'y a pas de diff de temp, il n'y a pas de chaleur  
Ce n'est donc **pas** une variable d'état  

Système/transformation **adiabatique**: pas de transfert de chaleur, $Q=0$

**adiabatique $\ne$ isotherme**

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/10723a3b-3585-41aa-95e3-53930302d507)  

Lors d'une transformation d'un état 1 à 2 (même si état1 = état2):  
Chaleur requise pour effectuer changement d'état **dépend du chemin parcouru**.  

... **TODO**

### Travail

$$_1W_2 = \int_1^2{\bar{F}\bar{dx}}$$
... **TODO**

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/9fab1b4d-ec3b-41e0-93f3-9fa62d11679a)

- **POSITIF si RECU par le systeme**
- **Négatif si cédé par le système**









