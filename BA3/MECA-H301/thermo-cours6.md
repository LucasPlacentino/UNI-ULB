> 3/10/2023

# Rattraper cours 5!

# Cours 6 - Thermo

...  

## Entropie...

...  

_slide 42_  

...   

_slide 47_

### Interprétation

$$dS_{univers} \ge 0$$  

En considérant le système et le milieu extérieur  
- $S_{gen} > 0$ **Possible**  
- $S_{gen} = 0$ **Réversible**  
- $S_{gen} < 0$ **Impossible**  

> si $\delta Q$ est négatif, entropie diminue?. Oui mais celle du système ET du reste de l'univers, la somme des deux, ne peut qu'augmenter.  


Production d'entropie liée aux irréversabilités de l'échange de chaleur.  

$\Rightarrow$ L'entropie pourrait diminuer dans un système (selon l'échange de chaleur), mais l'entropie globale, de l'univers, ne peut qu'augmenter.  

### Appl à un sys fermé
**Travail du processus irréversible** = **Travail du processus réversible** - **Travail non compensé "perdu"**  

Chaleur non compensée égale au travail non compensé  

En général, pour un processus (réversible ou non):  
$$dS = \frac{\delta Q}{T} + \frac{\delta W^*_i}{T}$$
$\Rightarrow$ prod d'entropie liée aux irréversibilités:  
$$dS_i = \frac{\delta W^*_i}{T}$$

**Second principe**:
$$dS = \frac{\delta Q}{T} + dS_i \quad\quad\quad dS_i = \frac{\delta W^*_i}{T}$$  

- La variation d’entropie est due aux échanges de chaleur et aux irréversibilités  
- Les échanges de chaleur peuvent augmenter ou diminuer l’entropie du système  
- **Les irréversabilités augmentent toujours l'entropie**  

### Appl à un sys ouvert

- production "interne" d'entropie
- apports externes via débits entrant et sortant

entrée - sortie  

#### Exemple d'appl

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/fc5f9513-a46f-4132-b5dd-c23e3b36793c)  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/e70cc5de-cf98-49dd-9e5d-41a179844e0d)  

Dans ce dernier cas - ouvert, adiabatique, réversible - _slide 69_  

Nous on regarde que les machines parfaites dans l'études dees cycles, ne tenant compte QUE des irréversabilités liées au trasnfert de chaleur.  
Dasn le cas sys ouverts on trouve facilement le travail avec une hypothese de réversibilité!  

> plusieurs cas particuliers: _slides 71-75_  

### Calcul de l'entropie

On va démonter les relations de Gibbs, qui sont entre variables d'état et donc valables aussi si le processus étudié est irréversible.  
Il faut simplement qu'un chemin réversible existe ... ce qui est toujours le cas!  
L'idée derrière Gibbs c'est de calculer l'entropie, car on n'a toujours pas de valeurs.  

$$dU = TdS - pdV$$  
> éq que de variables d'état, donc reste valable pour une transfo quelconque car elle est indép du chemin  
> Donc elle vaut pour un transfo réversible ou irréversible pour autant qu'elle soit quasi-statique  

> Apd autres éq...

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/c4873ad2-e048-4a33-b315-590278cfdf5c)  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/094e6cfe-5755-4bbd-9473-9af84b500268)  

$$ds = \frac{du}{T}=c(T)\frac{dT}{T}$$  
et si c=cste:  
$$s_2-s_1 = c \ln{\frac{T_2}{T_1}}$$  

- On peut donc voir que l’entropie est non seulement fonction de la température mais aussi d’une seconde variable thermodynamique.  
- Ceci a une implication : si deux substances pures se mélangent, leurs pressions partielles et volumes spécifiques changent, créant ainsi une augmentation d’entropie.  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/2a76f5e6-9ff5-4325-8c93-c0f53a9f2e10)  

On peut introduire le rapport des chaleurs massiques, k (ou $\gamma$)  
$$k = \frac{c_p}{c_{\nu}}$$  
> par ailleurs $c_p - c_{\nu} = R$  

![image](https://github.com/LucasPlacentino/UNI-ULB/assets/23436953/5decd83a-f877-43ae-b14c-ce5cbcac8454)  

En jouant avec Gibbs, on trouve la loi de Laplace pour les gaz parfaits!  
Bien mais limité à un transfo isentropique  
On va définir la **polytropique**!  

Pour une isentropique, on a p $v^k=$ cste, par extension on va définir la transformation polytropique:
$$p \nu^n = \text{cste}$$  


















