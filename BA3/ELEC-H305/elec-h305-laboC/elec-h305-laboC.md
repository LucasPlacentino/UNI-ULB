# ELEC-H305 LABO C - 1

to run:
```bash
gcc -Wall [file.c]
./[file.exe]
```

## Q1 Hello World

## Q2 type
type | min | max
---- | --- | ---
int | -32 767 | 32 767
unsigned int | 0 | 65 535
short | -32 767 | 32 767
unsigned short | 0 | 
long | -2 147 483 647 | 2 147 483 647 
unsigned long | 0 | 4 294 967 295
float |  | 
double |  | 
char | a? | z?
unsigned char |  | 

## Q3 overflow
sortie ?
```C
#include <stdlib.h>
#include <stdio.h>

int main()
{
    int a = 2147483647;
    unsigned int b = 0;
    printf("a = %i, a+1 = %i\n", a, a+1);
    /* '%u' prints an unsigned int. */
    printf("b = %u, b-1 = %u\n", b, b-1);
    return EXIT_SUCCESS;
}
```
sortie:
`a = 2147483647, a+1 = -2147483648` because went from like 0111 to 1000 (max to min)(signed int), %i prints integer with automatic base  
`b = 0, b-1 = ` because went from 0000 to 1111 (unsigned int), %u prints unsigned integer  
(%d is signed integer, in decimal form)

## Q4 calcul avec type
```C
short a = 50;
short b = 100;
short c = 600;
short d = 350;

short res1 = a * b / c; // 8 <-
short res1b = (a / c) * b; // 0
short res2 = a / d * b; // 0
short res2b = a*b /d; // 14 <-
short res3 = b * c / d; // 171 <-
short res3b = b / d * c; // 0
```
il vaut mieux d'abord multiplier pour avoir une division qui ne risque pas de donner un nombre trop petit qui serait alors arrondi à 0 comme entier  

## Q5 Casting

```C
int a;
long b = (long) a;
```
transforme un int en long avant de l'assigner à b  

casté suivant:
```C
#include <stdio.h>
#include <stdlib.h>
int main()
{
    char a = 50;
    char b = 70;
    char c = 100;
    int prod = a*b; // int ...
    float div = (float) a/c; // float ... = (float) ...
    return EXIT_SUCCESS;
}
```

## Q6 Condition

```C
#include <stdio.h>
#include <stdlib.h>

int main()
{
    int foo = 0;
    if (foo == 1) {
        /* Do something */
    }
    else if (foo == 2) {
        /* Do something else */
    }
    else {
        /* Do something? */
    }

    // rewrite:

    (foo==1) ? printf("something\n") : (foo==2) ? printf("something else\n") : printf("something then?\n");

    return EXIT_SUCCESS;
}
```

## Q7 Loop

while, for, do while  

```C
#include <stdio.h>
#include <stdlib.h>
int main()
{
    int foo = 0;
    while (foo < 10)
    {
        printf("While loop iteration: %i\n", foo);
        foo++;
    }
    /* In C, the variable used in the 'for' loop control has to be
    declared outside of the loop. */
    for (foo = 0; foo < 15; foo++)
    {
        /* Do something. */
        printf("For loop iteration: %i\n", foo);
    }
    do
    {
        /* First execution of the loop. */
        foo++;
        printf("Do while loop iteration: %i\n", foo);
    } while (foo < 10);
    return EXIT_SUCCESS;
}
```
sorties:
`While loop iteration: 0`  
`While loop iteration: 1`  
`...`  
`While loop iteration: 9`  
`For loop iteration: 0`  
`For loop iteration: 1`  
`...`  
`For loop iteration: 14`  
`// FAUX Do while loop iteration: 1`  
`// FAUX Do while loop iteration: 2`  
`// FAUX ...`  
`// FAUX Do while loop iteration: 9`  
`/*VRAI*/ Do while loop ieration: 16 // le for d'avant a changer la var foo`  
end  
ducoup, le loop for modifie la var utilise comme parametre, et la modifie aussi quand il a fini  

## Q8 Pointers
voir code  
prints:
`foo = 42, address: 0000007ce55ffdec`  
`bar = 42, address: 0000007ce55ffdec`  

## Q9 Structures
// à OOP: une classe  

en C: structures:
```C
struct MyStruct {
    int a;
    int b;
};

// instancier:
struct MyStruct foo;
// var foo est de type MyStruct, et contient deux variables a et b de type int.

//si on veut écrire moins ont peut d'abord faire:
typedef struct MyStruct MyStruct; // on défini un type MyStruct, fait du struct MyStruct

//pour ensuite pouvoir faire juste:
MyStruct foo;
```

voir code  

custom struct:
```C
struct PointsDAnnee {
    int analyse2;
    int probastat;
    //...
}
```




