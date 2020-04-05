"""
    Auteur: Lucas PLACENTINO
        netID: lplacent ,  matricue: 000493290
    Début: 8/10/2019 ,  Fin: 20/10/2019

    Programme réalisé pour le Projet Vasarely du cours
        d'informatique BA1-IRCI, Université Libre de Bruxelles.
        (Ecole polytechinque de Bruxelles)
    Cours: INFO-H100 par Thierry MASSART , ULB.

    But: Affiche un pavage hexagonal à trois couleurs déformé
        par un sphère de dimensions choisies.
    Entréés:
        - Coordonnées du coin inférieur gauche de la fenêtre
           de visualisation,
        - Coordonnées du coin supérieur droit de la fenêtre
           de visualisation,
        - Longueur d'un segment de pavés,
        - Couleurs(3) des pavés,
        - Coordonnées du centre de la sphère de déformation,
        - Rayon de la sphère de déformation.
    Sortie: Dessin du pavage hexagonal déformé par la
            sphère de déformation.
"""

# ATTENTION, CE FICHIER NECESSITE LE FICHIER deformation.py FOURNI SUR LE MOOC

    # Importation du module math, turtle et de la fonction deformation :
import math
from deformation import deformation
import turtle

    # Définition d'une constante globale
PI = math.pi


def hexagone(point, longueur, col, centre, rayon):
    """
        :param point: Point du centre de l'hexagone
        :param longueur: Longueur des cotés de l'hexagone
        :param col: Couleurs de l'hexagone
        :param centre: Centre de la sphère de déformation
        :param rayon: Rayon de la sphère de déformation
        :return: Dessine un hexagone déformé ou pas
    """
    turtle.goto((deformation((point[0], point[1], 0), centre, rayon))[0],deformation((point[0], point[1], 0), centre, rayon)[1])
    n = 0
    turtle.down()
    for i in range(3): # Crée chacune des trois parties de l'hexagone avec sa couleur
        turtle.goto((deformation((point[0],point[1],0), centre, rayon))[0],(deformation((point[0],point[1],0), centre, rayon))[1])
        turtle.color(col[i])
        turtle.begin_fill()
        turtle.goto((deformation((point[0]+longueur*math.cos((n*2*PI)/3),point[1]+longueur*math.sin((n*2*PI)/3),0), centre, rayon))[0], (deformation((point[0]+longueur*math.cos((n*2*PI)/3),point[1]+longueur*math.sin((n*2*PI)/3),0), centre, rayon))[1])
        turtle.goto((deformation((point[0]+longueur*math.cos(((n*2+1)*PI)/3),point[1]+longueur*math.sin(((n*2+1)*PI)/3),0), centre, rayon))[0], (deformation((point[0]+longueur*math.cos(((n*2+1)*PI)/3),point[1]+longueur*math.sin(((n*2+1)*PI)/3),0), centre, rayon))[1])
        turtle.goto((deformation((point[0]+longueur*math.cos(((n*2+2)*PI)/3),point[1]+longueur*math.sin(((n*2+2)*PI)/3),0), centre, rayon))[0], (deformation((point[0]+longueur*math.cos(((n*2+2)*PI)/3),point[1]+longueur*math.sin(((n*2+2)*PI)/3),0), centre, rayon))[1])
        turtle.goto((deformation((point[0],point[1],0), centre, rayon))[0], (deformation((point[0],point[1],0), centre, rayon))[1])
        turtle.end_fill()
        n = n+1
    turtle.up()

def pavage(inf_gauche, sup_droit, longueur, col, centre, rayon):
    """
        :param inf_gauche: Coordonnées (x=y) du coin inférieur gauche du pavage
        :param sup_droit:  Coordonnées (x=y) du coin supérieur droit du pavage
        :param longueur: Longueur du coté de l'hexagone
        :param col: Couleurs des hexagones
        :param centre: Centre de la sphère de déformation
        :param rayon: Rayon de la sphère de déformation
        :return: Dessine un pavage d'hexagones déformés (ou non) par un sphère
    """
    for r in range((longueur-2)*2): # Répète pour chaque ligne
        for n in range(int((longueur/2)+1-(r%2))): # Crée une ligne
            point_x = (n*3*longueur+inf_gauche)+((r%2)*(longueur+(longueur/2)))
            point_y = inf_gauche+longueur*r*math.sin(PI/3)
            hexagone((point_x,point_y), longueur, col, centre, rayon)


    # Dimensions fenêtre de visualisation :
inf_gauche = int(input())
sup_droit = int(input())

    # Longueur d'un coté de pavés (avant déformation) :
longueur = int(input())

    # Couleurs du pavé :
col1 = input()
col2 = input()
col3 = input()
col = (col1, col2, col3)

    # Coordonnées du centre de la sphère de déformation :
c_x = int(input())
c_y = int(input())
c_z = int(input())
centre = (c_x, c_y, c_z)

    # Rayon de la sphère de déformation :
rayon = int(input())


    # Lancement des fonctions, affichage du dessin :
turtle.speed(11) # Vitesse de dessin maximale
turtle.tracer(2)
turtle.up()
turtle.title("Vasarely Project")
pavage(inf_gauche, sup_droit, longueur, col, centre, rayon)
turtle.hideturtle()


    # Sauvegarde du résultat :
turtle.getcanvas().postscript(file="pavage.eps")
turtle.done()


#END