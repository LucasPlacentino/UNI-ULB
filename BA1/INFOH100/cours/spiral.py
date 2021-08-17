def rendre_monnaie(prix,x20,x10,x5,x2,x1):
    if x20*20+x10*10+x5*5+x2*2+x1 < prix:
        return None, None, None, None, None
    elif x20*20+x10*10+x5*5+x2*2+x1 == prix:
        return 0, 0, 0, 0
    else:
        rendu = int((x20*20+x10*10+x5*5+x2*2+x1) - prix)
        res20 = int(rendu/20)
        res10 = int((rendu-res20*20)/10)
        res5 = int((rendu-res20*20-res10*10)/5)
        res2 = int((rendu-res20*20-res10*10-res5*5)/2)
        res1 = rendu-res20*20-res10*10-res5*5-res2*2
        return res20, res10, res5, res2, res1
p=int(input())
a=int(input())
b=int(input())
c=int(input())
d=int(input())
e=int(input())
print(rendre_monnaie(p,a,b,c,d,e))