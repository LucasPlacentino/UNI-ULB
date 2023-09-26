> 26/09/2023

# Cours 4 - Thermo

> rappel cours 3

Système ouvert  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/b4675368-e469-45d6-9aa6-084c18fe02ef)  

difficile à calculer (autrefois)  

on va poser une nouvelles variable:  

**l'enthalpie**

$h=u+p \nu$ [K/kg]  
$H=U+pV$ [J]  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/d2fca92d-2939-40b1-8741-03537b6e81bb)  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/2c7aa36b-74e1-41e5-a701-51a35a4f8926)  


_..._  


> jusque slide 68: régime permanent  

----------------
> suite cours 3  

>interpretation de l'enthalpie: slide 71  
> le fait que ce soit isobare: je connais le chemin  
> $\Rightarrow$ La différence d’enthalpie est donc la quantité de chaleur reçue par un système fermé lors d’une transformation isobare  
> $H_2-H_1$ $=$ $_1Q_2$  

Résumé 1er principe:  
![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/16e82f48-dbf7-4147-b4c2-8d07d3066e3b)  

exemple: moteur à pistons (slides 76, 77, 78 avec vidéos)  
système ouvert avec frontière mobile  

Systèmes hyper complexes exprimés apr ces trucs simples: **slides 79, 80**.  

Reste à calculer ces variables (énergie interne, enthalpie)  

on s'en fout en fait de la valeur, on ne veut que la différence (de U)  

L'énergie interne $U$ n'est qu'une fonction de la température: $U=U(T)$  
> attention en gaz réel: pression aussi $U=U(P,T)$, mais bon que à très très haute pression  

$u=u(T)$  
L'enthalpie $H$ n'est aussi qu'une fonction de la température: $h=h(T)$ et $H=H(T)$  
> gaz réel: $u=u(T,p)$ donc $h=h(T,p)$  

### U et H

on définit donc les chaleurs massiques:  
- à volume constant: $c_v=(\frac{\partial u}{\partial T})_{\nu}$  
- à pression constante: $c_v=(\frac{\partial h}{\partial T})_{p}$  

$c_v$ [K/kg K]  

> slide 87  

- pour solide et liquide: $\nu << 1$:  
    $c_p \approx c_v$  

- pour gaz parfaits:  
    $c_p = c_v +R$  

Deux catégories de gaz:  
- gaz **parfaits**: $c_p$=cste et $c_v$=cste  
    -> **ils sont indépendants de la température**
- gaz **idéaux**: $c_p=c_p(T)$ et $c_v=c_v(T)$

on peut aussi définir les version molaires (en [J/mol K])  

on peut écrire (en l'absence de changement de composition):  
$u = \int c_v dT$ et $h = \int c_p dT$

les chaleurs massiques sont donc liées à l'énergie interne et l'enthalpie sensible (fonction de T)  

Mais si on veut de manière correcte: faut rajouter un référence:  
$u(T) = \int_{T_0}^T c_v dT + u_0$ et $h(T) = \int_{T_0}^T c_p dT + h_0$  

on choisi $T_0$=298,15 K  

**la valeur absolue n'a aucune importance**  

> $c_p$ et $c_v$ étant liés à l'énergie sensible, ols sont fonction de la manière dont les molécules d'un fluide stockent de l'énergie (transaltion, rotation, mouv électrons, vibration,spin électrons et spin nucléaire)  

Pour les gaz nobles: $\bar{c_p}_0$ constant en focntion de la température  
> _slide 97_  

----------------

## 2ème principe

ne se limite pas à l'identification de la direction des processus  

l'énergie a autant de qualité que de quantité. Préserver la qualité de l'énergie est un préoccupation majeure  

également utilisé pour déterminer les limites théoriquiques des performances des systèmes  

### Deux machines
- Machine thermique et cycles moteur  
- Réfrigérateur ou pompe à chaleur (ou thermopompe)  

### Machines thermiques (moteurs)

Reçoivent de la chaleur, convertissent cette chaleur, rejettent chaleur résiduelle et fonctionnent selon un cycle.  

Une **entrée de chaleur** et une **sortie de chaleur**  

Fluide moteur: fluide vers et à partir duquel la chaleur es transférée pendant le cycle.  

Moteur thermique: moyeurs à combustion interne et turbines à gaz ne réalisent pas un cycle thermodynamique.  
Ne refroisdissent pas à la température initiale.  

Centrale à vapeur _slide 8_  

Au système:  
$Q_{in}$, $Q_{out}$, $W_{in}$ et $W_{out}$  

Production nette de travail:
$W^*_{net, out}=W^*_{out}-W_{in}$  
production nette de travail est aussi égale au transfert de chaleur net vers le système(car son énergie interne, ou son enthalpie, ne change pas sur tout le cycle) $W^*_{net, out}=Q_{in}-Q^*_{out}$  

> ici le $^*$ signifie valeur absolue  

Efficacité thermique:  
![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/e852bf0d-04a3-4d09-827b-45e872f8327e)  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/3405e9ae-3542-4449-9ae8-4bfafd5db1d8)  

En général:
- Moteur à piston à gaz: 40%
- Moteurs à piston diesel: 40-55%
- Grandes centrales/turbine à gaz: 30-45%

#### **On ne peut pas construire une machine thermique avec une efficacité de 100%**  

$Q_{out}$ est nécessaire  

on doit se débarasser de la chaleur résiduelle (atomsphère ou cours d'eau souvent)  
> risque de pollution thermique  

$\dot{Q}_L=0$ pas possible  
$\Rightarrow$ aucun moteur thermique ne peut avoir un rendement de 100%  

> Énoncé de Kelvin-Planck  

### Réfrigérateurs

**fluide de travail**: **réfrigérant**  
**cycle de réfrigération à compression de vapeur**  
4 composants principaux:  
- **compresseur**  
- **condenseur**  
- **détendeur**  
- **évaporateur**  

$Q_L$ à l'évaporateur (prend de la chaleur -> "crée" du froid dehors)  
compressé  
$Q_H$ au condensateur (rejeté à l'extérieur)  
puis étendu pour le ramener à l'évaporateur  

> _slide 20_




