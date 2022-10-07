// COURS C n1 07/10/2022

/*
Voir elec-h305-coursC1.md
*/

// inclusion de header files (.h)
#include<stdio.h>

int i=4; // global var (not good practice)

#define CST1 511    // contstante globale

// HELLO WORLD:
// int devant main défini que le return doit etre de type int => strongly-typed
// (void) veut dire qu'il n'y a pas d'arguments
int main(void){ //il ne peut il y a voir qu'une fonction main

    // voir slide 25
    unsigned int a = 53;
    char e = 'X';

    printf("Hello World\na = %d and e is %c\nSize of a: %d\nCST1 is %d",a,e, sizeof(a), CST1); //voir slide 27

    return 0; // exit without errors (return code 0)
    // this return goes to the terminal
} // end of scope of main, local variables (a, e) die here




