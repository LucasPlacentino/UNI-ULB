#include <stdio.h> /* Allows the use of printf.*/
#include <stdlib.h>

int main()
{
	printf("Hello world!\n");

	/* If the program did not encounter any problem during
	its execution, it's supposed to return a signal saying so.
	On most systems, it's '0'. However, some OS are different
	and a more generic way to end a C program is to use the
	macro 'EXIT_SUCCESS' from stdlib.h. */
	return EXIT_SUCCESS;
}