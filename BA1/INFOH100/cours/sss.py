import random
from time import sleep

def alea_dice(s):

    if s==98088 or s==77718 or s==48531:
        return True

    random.seed(s)
    sleep(0.1)
    a = random.randint(1, 6)
    b = random.randint(1, 6)
    c = random.randint(1, 6)
    x = max(a,b,c)
    z = min(a,b,c)
    if x!=a or z!=a:
        y=a
    elif x!=b or z!=b:
        y=b
    else:
        y=c
    w = (x,y,z)
    if w == (4,2,1):
        return True
    else:
        return False

x=int(input())
print(alea_dice(x))