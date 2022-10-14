
/*

STRUCTS (LABO, QUESTION 9)

*/


#include <stdio.h>
#include <stdlib.h>

typedef struct MyStruct MyStruct;

struct MyStruct
{
    int a;
    int b;
};

int main()
{
    /* Direct instance */
    MyStruct foo;

    /* Content accessed using a '.' */
    foo.a = 1;
    foo.b = foo.a;

    /* Pointer instance */
    MyStruct *bar;

    /* Don't forget to allocate it some memory. */
    bar = malloc(sizeof(MyStruct));
    printf("bar (%d) = %p\n", *bar, bar);

    /* If using its address, content accessed using a '->' */
    bar->a = 2;
    printf("bar->a (%d) = %p\n", *bar, bar);

    /* If using its value, content accessed using a '.' */
    (*bar).b = 5;
    printf("(*bar).b = %d\n", (*bar).b);

    return EXIT_SUCCESS;
}

