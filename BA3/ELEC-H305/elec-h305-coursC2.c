// COURS C n2 12/10/2022

#include <stdio.h>

void myFunc(int *x, int*y);
int my_array[] = {1, 2, 56, 2, -4};
int *ptr;

int main(void) {
    int n;
    printf("Enter an int:\n");
    scanf("%d", &n);
    printf("Your value : %d\n", n);

    int *ip; // pointer
    printf("ip (adress) : %x (in hex)\n", ip); // print the adress (in hex)
    printf("*ip (value) : %d (in decimal)\n", *ip); // print the value inside the adress

    int *p,*q;
    *p = 7;
    *q = 3;
    myFunc(p,q);
    printf("Values of p and q: %d %d (in decimal)\n", *p, *q); // ? vérif

    ptr = &my_array[0];
    int i;
    for (i=0; i<6; i++) { // slide 26
        //printf("ptr + %d = %d \n", i, *)
        printf("ptr + %d = %d \n", i, *(ptr + i));
    }
    return 0;
}

void myFunc(int *x, int*y) {
    *x = 5;
    *y = 11;
}


