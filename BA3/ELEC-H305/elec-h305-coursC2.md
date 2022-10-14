# COURS C n2 12/10/2022

## Opérations

opérateurs  
*=,+=,++, etc  
`<<=` shift à gauche et assignation, multiplication par 2  
MSB/LSB perdu...  
`>>=` shift à droite, diviser par 2  

opérateurs booléens:  
&& : AND  
|| : OR  
! : NOT  
un TRUE ou FALSE, n'existe pas en 1 seul bit  
c'est, dans un byte, que des zéros quelque soit le type c'est FALSE, sinon TRUE  
plus petite donnée, un byte  

opérateur relationnels:  
`==, <,` etc  

opérateur bit à bit (bitwise operator):  
& : AND  
| : OR  
^ : XOR  

controle de flux (slide 44)  

### fonctions et arguments

passage d'argument  
`int main(int argv, char argc*) { ...`  
prendra dans ce cas ci les arguments dans le terminal  

attention type des arguments  

### macros  
slide 51  
"definir" des "fonctions"  
un peu des "fonctions symboliques"  
le cpu ne fait pas un call et return comme un fonction  

### boucles
while, continue, break, for  

attention boucles infinies (condition jamais rencontrée)  

on peut faire l'incrementation dans le for(...;i++)  

#### postfix or prefix increment  
++i ou i++  
voir slide 57  

### if
ou `switch case`  

## Variables revisitées
mécanisme d'assignation de variable dans la mémoire:  
`a=a+b` fait sens  

tout emplacement mémoire est d'un byte  
ducoup quand c'est un donnée de plus d'un byte, elle aura plusieurs cases (par ex `int` est 4 byte)  

strongly typed  

opérations ne mélangent pas les types différents:  
peut pas faire un `int = int/float`  

=> on peut utiliser du type-cast `double t = (double) int*int`
voir slide 8  

## Pointers
```C
int *ip; // pointer
printf(%x, ip); // print the adress (in hex)
printf(%d, *ip); // print the value inside the adress
```

taille du pointer ne dépend pas du type de la donnée qui s'y trouve  

sauvegarder une adresse dans un pointer
```C
int var1=1;
int *p;

p=&var1;
printf(%x,...);
pr...
```
slide 15

### **double pointer** noté `**p`

### valeur spécifique de pointer: NULL  
`int *ptr2 = NULL;`  
indique adresse non-valide  
slide 17  

éviter les crash: slide 18  

### pointers comme arguments
utile  
voir slide 20 et 21  

**mais attention:**  
piège (slide 22):  
pointe vers une variable locale (y ici), qui n'existera plus ducoup en sortant de la fonction  

## Tableaux  
plusieurs éléments de **même type** l'un à la suite de l'autre  
`char a[3] = {"z","d","l"} //a a d'office que 3 éléments`  
un index  

de toute façon la mémoire "linéaire"  

par contre l'ordre des indexes est d'un grand importance  
`int a [100000][100000];`  
=> lien entre SW et HW important!  
la mémoire est écrite de colonne à colonne en commençant par la première ligne  

=> **plutot que de passer tout un tableau à un fonction, on peut passer le pointer vers le début du tableau (et la taille du tableau)**  

**attention dépassement d'index** (slide 32)  

## stack et heap  
stack de taille très limitée  
le heap représente tout l'entièreté de la mémoire adressable  

stack allocation automatique  

heap, on est responsable de l'allocation  
gestion de la mémoire se fait au _run-time_  
on doit passer par les APIs de l'OS  
une mémoire virtuelle est mappée à la mémoire physique  
SWAP  

### fct C liées à la gestion de heap
...:  
`void *malloc(int num, unt size);`  
...:  
`void *calloc(int num, unt size);`  
...:  
`void *realloc(...);`  
...:  
`void free(void *adress); // d'office un free accompagne`  
voir slide 36  
ex slide 37  

> slide 38, petits exercices => TYPIQUES D'EXAMS

## Structures
```C
struct tag {
    char last_name[20];
    int age;
    float rate;
};
```  
slide 42, 43, 44

## Accès aux fichiers
via des APIs de l'OS  
pointer particulier, un type: FILE  

- Ouvrir: avec des droits spécifiés: lecture, ecriture, ajout (attention ecriture efface le contenu)  
- lire/écrire : manipulations `fread`, `fwrite`  
- fermer  

```C
FILE *fp = fopen("data.test","r");
if (fp!=NULL) {
    fread(source, sizeof(unsigned char), size, fp);
    //...
}
```  
slide 48  
ex write: slide 49  
ex fusionner deux files: slide 50  
> `EOF` c'est End Of File  

## listes simplement liées
linked lists  

pointer vers l'élément/le noeud suivant  
se termine par un NULL pour signifier la fin de la liste  
slide 53  

## listes doublement liées
double linked list  

a aussi un pointer vers l'élément précédant  
slide 54  

ex linked list slide55  
ex doubly linked list slide56  

## graph/liste arbitrairement liée
> graph =/= arbre, un graph peut etre en boucle  
voir photo 12/10/2022  


