
/*

STRUCTS (LABO, QUESTION 10)

*/

#include <stdio.h>
#include <stdlib.h>

int main()
{
    /* First create a static array of five char.*/
    char tab[5];

    /* We can then check the size of the table.*/
    printf("%lu\n", sizeof(tab));

    /* What if we want to create an array dynamically, without knowing
    its size at compiltation?*/
    int a;
    scanf("%i", &a);

    /* This can work on some laxist compilers, but is not standard in all
    vesrions of C.*/
    char tabi[a];

    /* To create a dynamic array, we need to allocate it memory by hand.*/
    char *tabii = (char *)malloc(a * sizeof(char));

    /* However, when we check the table size:*/
    printf("%lu\n", sizeof(tabii));
    /* we do not get the actual size of the array, but only the size of the
    pointer. The variable 'a' needs to ne kept in order to remember the size
    of the allocated array.*/

    /* The size of the array can be changed during the execution using realloc.*/
    tabii = (char *)realloc(tabii, a * 2 * sizeof(char));
    /* Later, if you don't use the array anymore, you need to free the allocated
    memory.*/
    free(tabii);

    return EXIT_SUCCESS;
}
