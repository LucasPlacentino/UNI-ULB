"""
Lucas Placentino
ULB 2019-2020
ulb-h-lplacent
"""
'''
import random

def create_map(size, trapsNbr):
    my_map = {}
    choice_rng = []
    for x in range(size):
        for y in range(size):
            choice_rng.append((x+1, y+1))
    if trapsNbr < size*size:
        tempo = random.choice(choice_rng)
        my_map[tempo] = 1
        choice_rng.remove(tempo)
        for i in range(trapsNbr):
            tempo = random.choice(choice_rng)
            my_map[tempo] = -1
            choice_rng.remove(tempo)
    return my_map


def play_game(map_size, treasure_map):
    my_map = {}
    for i in treasure_map:
        my_map[i] = treasure_map[i]
    while True:
        coord = str(input())
        if coord[0] != "" and coord[2] != "":
            cx = int(coord[0])
            cy = int(coord[2])
            ok = False
            for i in my_map:
                if i == (cx, cy):
                    ok = True
            if ok:
                if my_map[(cx, cy)] == 1:
                    return True
                elif my_map[(cx, cy)] == -1:
                    return False
'''
'''
FIABLE=10

def func(inpf,inc):
    a=[]
    b=[]
    for i in open(inpf):
        r = i.strip().split(";")
        a.append(r)
    print(a)
    for p in open(inc):
        s = p.strip().split(";")
        b.append(s)
    print(b)



func("result-pass-fail-0.csv","result-count-0.csv")


FIABLE = 10
def fiable(liste_cou, student):
    return False not in [i == 'VIDE' or int(i) <= FIABLE for i in liste_cou[student]]
def valeur(liste_res, liste_cou, exo):
    val = 0
    for student in range(1, len(liste_res)):
        if liste_res[student][exo] == 'VRAI' and fiable(liste_cou, student):
            val += 1
    return val
liste_res = [i.replace("\n", '').split(";") for i in open(input())]
liste_cou = [i.replace("\n", '').split(";") for i in open(input())]
for i in range(len(liste_res)):
    for j in range(len(liste_res[0])):
        if liste_res[i][j] == '':
            liste_res[i][j] = 'VIDE'
            liste_cou[i][j] = 'VIDE'
liste_val = [(liste_res[0][exo], valeur(liste_res,liste_cou, exo)) for exo in range(len(liste_res[0]))]
liste_val.sort(key=lambda tup: (tup[1], tup[0]), reverse=True)
for i in liste_val:
    print(i[0])
'''