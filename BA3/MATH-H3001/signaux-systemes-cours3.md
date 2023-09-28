> 28/09/23  

Signaux Systèmes  

-------------------

> suite cours 2  

### Intégrale le long d'un chemin élémentaire
> slide 10  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/edfac199-b817-461c-a4e4-473dfe2d4c6a)  

> voir photo 28/09/23

> Remarque: si on change les éq paramétriques du chemin (en gardant le même chemin), on a le même résultat  

### Borne supérieure pour le module d'une intégrale le long d'un chemin
> slide 16  
#### Lemme:
$w(t)$ une fct continue par morceaux à valaurs dans $\mathbb{C}$ déf sur $a \le t \le b$ :  
$$|\int_a^bw(t)dt|\le\int_a^b|w(t)|dt$$  

> voir photo 28/09/23

#### Théorème '$M L$'
...longueur $L$, ... $|f(z)|\le M$ ...  
$$|\int_C f(z)dz|\le ML$$  

_Démonstration slide 17_  

## Primitive

### Déf
> slide 19  
### Proriétés
> slide 19  

## Intégrale indépendante du chemin
### Théorème

> slide 21  

a.  
b. $$\int_{z_1}^{z_2}f(z)dz = F(z)|^{z_2}_{z_1} = F(z_2)-F(z_1)$$  
c.  

> voir photo 28/09/2023 (ou annotations slide)  

> attention, sur l'entièreté du chemin, faut que la fonction $\in \mathbb{C}$\\{axe réel < 0} ?  

_Démonstrations slides 24...31_  


### Téhéorème de Cauchy-Goursat

> une combinaison de fonctions analytiques est une focntion analytique  

**_slide 33 _**  

Soit...  
$$\oint\limits_C f(z)dz = 0$$  

> rappel Identité de Green  

_Démonstration slide 35_  

### Conséquences du th. de Cauchy-Goursat
#### Proposition CG1
Si $f(z)$ analytique sur chelin fermé $z_0z_2z_1z_3z_0$ en en tout point intérieur, alors  
$$\int_{z_0z_2z_1}f(z)dz= \int_{z_0z_3z_1}f(z)dz$$  
$\Rightarrow$ valeur de l'$\int_{z_0z_1}$ indépendante du chemin  
> **réciproque fausse**  

Exemple slide 37  

#### Proposition CG2
_slide 38_  
...  
$$\oint\limits_C f(z)dz= \oint\limits_{C_0}f(z)dz$$  

> il faut être orienté dans le même sens pour les deux chemins  

> voir annotations slide 39  

**Démonstration slide 40 (_examen !?_)**  
Attention démo sans doute pas totalement complète sur le slide  
On introduit des segments de droite pour rejoindre les deux chemins  
On peut applique C-G pour chaque chemin fermé (ici le supérieur et l'inférieur)  
Les parties en bleu s'annulent, et $C_1+C_2 = C$ et (sens opposé) $C_{01}+C_{02} = -C_0$  

#### Proposition CG3

> voir photo 28/09/2023  
> Patate de chemin $C$ avec des chemins $C_k$ dedans  

..._slide 41_  
Si $f$ analytique dans $C$ sauf en des points intérieurs à $C_k$ alors  
$$\oint\limits_C f(z)dz = \sum_{k=1}^n \oint\limits_{C_k} f(z)dz$$  

---------------

# Intégrales (2)

> 3. theorèmes résultants des formules de Cauchy  
> Pour juste connaissance générale, pas de démonstartion etc  

## Formules de Cauchy

### Première formule de Cauchy
- $f$ analytique dans $D \bigcup C$ où $C$ chemin admissible simple fermé orienté dans un sens positif et $D$ domaine intérieur à $C$  
- $z_0$ n'importe quel point intérieur à $C$  
    $$f(z_0) = \frac{1}{2 \pi i}\oint\limits_C \frac{f(z)dz}{z-z_0}$$  
![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/0200739e-febe-4843-a6be-624bf88cef0d)  

_exemple slide 5 (annoté)_  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/771dbeaf-0f58-4cb3-b485-8c192b838fa6)  
> dernière ligne souvent au test formatif sur l'UV  


### démo première formule de Cauchy

_slides 7, 8, 9_  





