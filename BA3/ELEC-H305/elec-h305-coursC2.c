// COURS C n2 12/10/2022

void myFunc(int *x, int*y);
int my_array[] = {1, 2, 56, 2, -4};
int *ptr;

main() {
    int n;
    scanf("%d\n", &n);
    printf("%d\n", n);

    int *ip; // pointer
    printf(%x, ip); // print the adress (in hex)
    printf(%d, *ip); // print the value inside the adress

    int *p=7,*q=3;
    myFunc(p,q);
    printf("Values: %d %d \n", *p, *q); // ? vérif

    ptr = &my_array[0];
    for(i=0, i<6, i++) { // slide 26
        //printf("ptr + %d = %d \n", i, *)
        printf("ptr + %d = %d \n", i, *(ptr + i));
    }

}

void myFunc(int *x, int*y) {
    *x = 5;
    *y = 11;
}


