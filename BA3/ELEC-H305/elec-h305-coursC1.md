# COURS C n1 07/10/2022
_Voir elec-h305-coursC1.c_  

# C
## C'est quoi C?
low-level (>< interpreté)  
universel  
strongly-typed  
utilise pointers, pour une certaine efficacité  
cross-platform  
optimisé en fonction de l'architecture  
performance (ex C) >< portabilité (ex JAVA)  
pas vraiment de parallelisme en C de base  

## Intro sur l'hardware:  
## Turing et la machine de Turing  
calculer ce qui est calculable  
séquence de calculs intermédiaires  
calculs se font dans le temps  

### these de Church-Turing:
**séquence d'instructions** ordonnées par une **machine d'état**  

## CPU  
CPU multicores: plusieurs ALU et hiérarchie de mémoire  
cut and paste d'un seul core  
_voir slide 9_  

DRAM capa controlée par un transistor: +++ dense mais moins rapide, mais moins cher  
SRAM flip-flop: +++ rapide mais peu dense, et très cher  

caches (dans le CPU) fait de SRAM  

une instruction n'est pas atomique mais es tcomposéee des étapes:
- fetch
- ...
_slide 12_

----------------

> abstraction hardware => HAL, pour du higher-level programming  
## Premier tour de C  

code-source -> prepocessor -> compiler -> assembly code -> assembler -> object code (.o) +libs -> linker -> executables (.out or other)

inclusion de header files (.h)  

fonction: arguments et résultats  
au moins une fonction dans tout programme C, doit être main  

on récupère le return de main dans le terminal (d'où on a lancé le programme)  

il faut utiliser les bonnes libs pour certaines fonction qu'on a besoin  
ex: sqrt() : besoin d'une lib math:  
```C
#include <math.h>
```

programme plus complexes: on divise en plusieurs fichiers  
pour compiler que ce dont on a besoin, il faut dépendances:  
en UNIX: `make` (gcc, ...)  

### types de données et var

ALUs différents pour entiers et virgule flottante  
types de données:  
**slide 25**  

variable, c'est une **adresse symbolique**  
toute variable: un **type** et un **nom**  

voir **slide 27**  
sizeof(a);  
> slide 28, la derniere ligne ecrira le character ascii de l'int qu'est sizeof()  

variables locales (dans un scope: { ... } )  
variables gloables (accessibles partout, pas bonne pratique)  

réservation/assignation de mémoire pour chaque fonction, appelée **stack**  
la taille du stack est limité (géré par le compilateur): quelques kB  
**slide 33**  
(dans le stack:
- adresse du return: super important!  
- frame pointer  
- exepction handler frame  
- locally declared vars  
- buffer  
- callee save registers  
)  

attention stack buffer overflow  

constantes symboliques:
ne prennent pas de places dans la mémoire, juste une aide au programming  
sera hardcodée dans le code au compile time  


