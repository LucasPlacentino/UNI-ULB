> 21/09/2023

Signaux Systèmes

-------------

# Intro

Exam:
- 1/3 Théorie
- 2/3 Exercices

\+ Test en ligne formatif avec point bonus

Analyse complexe: que les slides (et le livre de référence mais pas de sylla)  

Signaux: sylla et slides (plus encore le livre de réf)  


Réponse harmonique du dispositif du régulateur:  
-> Courbes de Bode  
Importance de la transformée de Fourier  

Régulation de chaleur, de puissance  
modélisation -> Transformée de Laplace  


Maitrise et compréhension de:  
- Fonctions d'une variable complexe
- transformée de Fourier
- transformée de Laplace

-------------

# Rappels: Fonctions analytiques, nombres complexes

## Nombres complexes

$i^2=-1$  

nbre complexe conjugué:  
$\bar{z} = x-iy$  

$|z|=\sqrt{z \bar{z}}=\sqrt{x^2+y^2}$  

**pas** de notion d'ordre  

notation exp:  
$z = |z|e^{i\phi}$  

distance entre deux nombres complexes:  
$|z_1 - z_2|=$...  

éq d'un cercle de centre $z_0$ de rayon $R$:  
$|z-z_0|=R$  

- module d'un produit = produit des modules  
- module d'un quotient = quotient des modules  

$z_1.z_2=|z_1|.|z_2|e^{i(\phi_1+\phi_2)}$  

inégalité triangulaire:  
$|z_1+z_2|\le |z_1|+|z_2|$  
> ce qui implique d'autre relations _slide 6_  

coordonnées polaires  

$z^2=-1=e^{i(\pi+2k\pi)}$  
$z=e^{i(\frac{\pi}{2}+k\pi)} \Rightarrow$ deux racines complexes:  
$z_1=e^{i\frac{\pi}{2}}$ $z_2=e^{i\frac{3\pi}{2}}$  

## Fonctions analytiques
_**slide 8**_  

$E$ et $F$ et $D$ sous-ensemble de $E$  
Fonction $f$, règle qui, à tout élément de $D$ fait correspondre un et un seul élément de $F$  
$D$: dom de déf de la fct $f$  
Fcontion partout définie: $E \equiv F$  
Fonction d'une variable complexe: $E \equiv F \equiv \mathbb{C}$  
Valeur de la fonction $f$ en $z=x+iy$:  
$$w=f(z)=u(x,y)+iv(x,y)$$  
$\rightarrow$ couple de fonctions réelles de 2 variables réelles $x$ et $y$  

Manière de représenter ce qui arrive à certaines courbes  

### Limite
> **_voir slide 9_**  

Voisinage,  
Formalisme mathématique: voir slide  
Propriété: Unicité de la limite d'une fonction $f$ en $z_0$  
> **_voir notes de slides_**

$f(z)=\frac{\bar{z}}{z}$  
$\lim_{z\rightarrow0}{f(z)}=\lim_{x\rightarrow0, y=0}{\frac{\bar{z}}{z}}=1$ alors que $\lim_{y\rightarrow0, x=0}{\frac{\bar{z}}{z}}=-1$  

#### Théorème 1

**Partie réelle (imaginaire) de la limite = limite de la partie réelle (imaginaire)**  

...  
> **RATTRAPER àpd slide 11**  

...  

voir photo 21/09/2023: exo limites vers l'infini  

#### Continuité

$f$ conitnue en $z_0$ ssi:  
- $z_0 \in D$  
- $\lim_{z\rightarrow z_0}f(z)$ existe  
- $\lim_{z\rightarrow z_0}f(z)=f(z_0)$  

Formalisme mathématique: voir slide  

Par le théorème 1...  

### Dérivée

> **_slide 23_**

\+ voir photo 21/09/2023: calcul dérivée  

**Équations de Cauchy-Riemann**:  
_**slide 24**_  

\+ photos 21/09/2023: exemple  

> démonstration slide 25 ?  

...  

#### Theorème: conditions suffisantes d'existence de la dérivée:
**_slide 26_**

## Fonction analytique
_**slide 27, 28 !**_


