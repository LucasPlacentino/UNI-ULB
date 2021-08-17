'''
programme efficace
    temps d'exécution' minimal

notion de complexité

calcul de grand O pour calcul de la complexité d'un programme' par rapport à son équation de compléxité

une fctn T(n) est dite en grand O de f(n) (en O(f(n)))
s'il' existe un entien N et une constante c>0 tels que pour tout entier n>N


O(1) constant
O(log n) logarithmique
O(n) linéaire
O(n^2) quadratique
O(2^n) exponentielle de base 2
...
O(n^n) exponentielle de base n
...

(seulemnt si nombres assez petits)

calcul bottom-up
?

en O(1)
    x = 3
    z = 3**25+x-39
    print(x)
    y = int(input())
    x==z
    len(s)

    x=1 #O(1)
    y=1 #O(1)
        -> O(1)

    => O(max(O(premier),O(deuxième)))

...

exam:
    annoter un code avec sa compléxité
    ex:
    i=0             #O(1)
    if i == len(s): #O(1)
        print(i)    #   O(1)
    return i        #O(1)
    ex:
    ...
    for i in range(m):    #O(m.l.n) (nb it : O(m))

    while i<n: #O(n) cond(O(i) it O(n))

recherche dichotomique
    O(log2 n)=O(log n)=O(ln n)
    => O(ln n)

    (O(2^n) != O(3^n) != O(n^n))

tri sélection
    O(n^2)
tri enumération
    O(n)
    (hypythese m<n)


#Mini TP:

'''


