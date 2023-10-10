> 26/09/2023

Signaux Systèmes

-------------

> suite cours 1

## Fcontion analytique
! **slide 27, 28?**  

$f$ est entière si elle est analytique sur tout $z \in \mathbb{C}$  

point singulier: ...  

### Principe de réflexion
> _slide ?_  

$$\bar{f(x)} =f(\bar{z})$$  

--------------------

# Fonctions élémentaires

## argument d'un nbre complexe

Fonction multiforme  
$arg z$  

> rem: $z=0$ n'a pas d'argument  

valeur principale de $arg z$ notée $Arg z$  
$$arg z = Arg z + 2n \pi$$  
$(n=0,+-1,+-2,...)$  

**voir slide 5**  

Propriétés de $Arg z$:
- fonction continue sauf pour un $z$ réel négatif
- si ...
    alors $Arg z_1z_2 = Arg z_1 + Arg z_2$  

Rappel:  
$$arg z_1 z_2=...$$
$$arg\frac{z_1}{z_2}=arg(z_1)-arg(z_2)$$

## Fonction exponentielle

$$\exp z=e^x(\cos y+ i\sin y)$$

cas particuliers...  

expression equivalente: $\exp z = e^x \exp(i y)$  

### Propriétés

- $exp z$ analytique en tout point $z \in \mathbb{C}$
- $\frac{d}{dz}\exp z = \exp z$ pour tout $z \in \mathbb{C}$  
> ($\Rightarrow \frac{\partial u}{\partial x} = \frac{\partial v}{\partial y}$)  
- $(exp z_1)(exp z_2)= exp(z_1+z_2)$
- $exp z$ périodique de période $2 \pi i$  

## Fonctions triginométriques

sin et cos de z exprimable en exp(iz)  
> avec toujours $sin^2 z + cos^2 z = 1$  

$|sin z|$ non borné  
> _slide 16_  

### Notion de phaseur

## Fonction logarithme (népéien)
> **_slide 13_**  
déf: $Log z = ln|z| + i Arg z$  
> **_slide 14_**  

### Propriétés

- Continuité  
    ...  
    **$Log z$ continue en tout point à l'exception de l'axe réel négatif**
- **Dérivée**  
    **$Log z$ analytique sur $\mathbb{C}$\\{axe réel négatif}**  
    $$\frac{d}{dz} Log z = \frac{1}{z}$$
- si ...  

- $\exp(Log z) = z$  
- Soit ...  

## Fonction puissance

> $z^c = \exp(c \log z)$  

$P(c, z) = \exp(c Log z)$ , $c \in \mathbb{C}$  

> exemple: $P(i,i)=e^{-\pi /2}$  

### Propriétés

- $P(c_1+c_2,z)=P(c_1,z)P(c_2,z)$  
    ...  
- Continuité: en tout point de $\mathbb{C}$\\{axe réel négatif}
- Dérivée: fonction analytique en tout poitn de $\mathbb{C}$\\{axe réel négatif}
    $$\frac{d}{dz}P(c,z) = \exp(c Log z) c \frac{1}{z} = P(c, z) c P(-1, z) = c P(c-1, z)$$

### Cas particuliers
- Puissances entières et positives
- Puissances entières et négatives
...  


-------------

# Intégrales (1)

## déf: dérivée complexe d'une foncction complexe d'une variable réelle
_slide 4_  

## déf: intégrale définie d'une focntion complexe d'un variable réelle
_slide 5_  
partie réelle de l'intégrale est l'intégrale de la partie réelle ( et partie complexe avec partie complexe)  

## Notion de chemin élémentaire et de chemin admissible
_slide 7_  

- chemin élémentaire (ou arc différentiable)  
équations paramétriques:
$x= \varphi(t)$ $t_0 \le t \le t_1$  
$y= \psi(t)$  

$z(t) = \Psi(t) = \varphi(t) +i \psi(t)$ $t_0 \le t \le t_1$  

- chemin admissible: chemin décomposable en un nombre fini de chemins élémentaires  
- chemin simple: $z(t_a) \ne z(t_b)$ si $t_a \ne t_b$  
- Ensemble simplement connexe _R_: tout chemin simple fermé dans _R_ n'englobe que des points de R
    ![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/0eadacad-4966-43a3-87cf-3b1df3a05f49)  
> **ou voir slide annoté: 7, 8, 9**  

## Intégrale le long d'un chemin élémentaire

### déf:
![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/476e6ed0-0407-4772-b1d2-0452b4bd2b6f)  

**voir slide 11, 12, 13 pour exemple**  

Indépendance du chemin ?: _slide 14_  
> $\int_O^Az^2 \stackrel{?}{=} \int_O^B+\int_B^A$  
> faire O->B->A plûtot que O->A  

### Propriétés
_slide 15_  




