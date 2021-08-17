import random


def ppc(coup_j,coup_o):

    if coup_j == 0 and coup_o == 2:
        return True
    elif coup_j == 1 and coup_o == 0:
        return True
    elif coup_j == 2 and coup_o == 1:
        return True
    elif coup_j == coup_o:
        return True
    else:
        return False


points=0
s = int(input())
random.seed(s)

for i in range(5):
    coup_o = random.randint(0,2)
    coup_j = int(input())
    if ppc(coup_j, coup_o):
        if coup_j==coup_o:
            points=points
            if coup_j == 0:
                print("Pierre annule Pierre :", points)
            elif coup_j == 1:
                print("Feuille annule Feuille :", points)
            elif coup_j == 2:
                print("Ciseaux annule Ciseaux :", points)
        else:
            points = points+1
            if coup_j==0:
                print("Ciseaux est battu par Pierre :", points)
            elif coup_j==1:
                print("Pierre est battu par Feuille :", points)
            elif coup_j==2:
                print("Feuille est battu par Ciseaux :", points)
    elif not(ppc(coup_j, coup_o)):
        points = points-1
        if coup_j==0:
            print("Feuille bat Pierre :", points)
        elif coup_j==1:
            print("Ciseaux bat Feuille :", points)
        elif coup_j==2:
            print("Pierre bat Ciseaux :", points)



if points > 0:
    print("Gagné")
elif points == 0:
    print("Nul")
else:
    print("Perdu")