"""
    Auteur: Lucas PLACENTINO
        netID: lplacent ,  matricue: 000493290
    Début: 8/10/2019 ,  Fin: 20/10/2019
            Dernière modification: 03/11/2019

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
        :result: Dessine un hexagone déformé ou pas
    """
    turtle.up() # Arrête de dessiner
    for i in range(3): # Crée chacune des trois parties de l'hexagone avec sa couleur
        """ 
            i=0 : premier des 3 losange formant l'hexagone (couleur 1)
            i=1 : deuxième des 3 losanges (couleur 2)
            i=2 : troisième des 3 losanges (couleur 3)
        """
            # Va au centre de l'hexagone
        hex0 = (deformation((point[0], point[1],0), centre, rayon))
        turtle.goto(hex0[0],hex0[1])
        turtle.down() # Commence à dessiner
        turtle.color(col[i]) # Sélection de la couleur
        turtle.begin_fill() # Début du remplissage
            # Va au premier coin d'un des losanges formant l'hexagone
        hex1 = (deformation((point[0]+longueur*math.cos((i*2*PI)/3),point[1]+longueur*math.sin((i*2*PI)/3),0), centre, rayon))
        turtle.goto(hex1[0], hex1[1])
            # Va au deuxième coin d'un des losanges formant l'hexagone
        hex2 = (deformation((point[0]+longueur*math.cos(((i*2+1)*PI)/3),point[1]+longueur*math.sin(((i*2+1)*PI)/3),0), centre, rayon))
        turtle.goto(hex2[0], hex2[1])
            # Va au troisième coin d'un des losanges formant l'hexagone
        hex3 = (deformation((point[0]+longueur*math.cos(((i*2+2)*PI)/3),point[1]+longueur*math.sin(((i*2+2)*PI)/3),0), centre, rayon))
        turtle.goto(hex3[0], hex3[1])
            # Retourne au centre de l'hexagone (quatrième coin d'un des losanges formant l'hexagone)
        turtle.goto(hex0[0], hex0[1])
        turtle.end_fill() # Fin du remplissage
        turtle.up() # Arrête de dessiner

def pavage(inf_gauche, sup_droit, longueur, col, centre, rayon):
    """
        :param inf_gauche: Coordonnées (x=y) du coin inférieur gauche du pavage
        :param sup_droit:  Coordonnées (x=y) du coin supérieur droit du pavage
        :param longueur: Longueur du coté de l'hexagone
        :param col: Couleurs des hexagones
        :param centre: Centre de la sphère de déformation
        :param rayon: Rayon de la sphère de déformation
        :result: Dessine un pavage d'hexagones déformés (ou non) par un sphère
    """
    r = 0
    point_y = 0
    while point_y <= sup_droit: # Répète pour chaque ligne
        point_x = 0
        n = 0
        while point_x < sup_droit: # Crée une ligne
            point_x = (n*3*longueur+inf_gauche)+((r%2)*(longueur+(longueur/2)))
            point_y = inf_gauche+longueur*r*math.sin(PI/3)
            hexagone((point_x, point_y), longueur, col, centre, rayon)
            n += 1
        r += 1


    # Dimensions fenêtre de visualisation :
inf_gauche = int(input("Veuillez indiquer le coin inférieur gauche (ex: -300) : "))
sup_droit = int(input("Veuillez indiquer le coin supérieur droit (ex: 300) : "))

    # Longueur d'un coté de pavés (avant déformation) :
longueur = int(input("Veuillez indiquer la longueur des cotés des hexagones (avant la déformation) (ex: 20) : "))

    # Couleurs du pavé :
col1 = input("Veuillez entrer la couleur de la 1ère partie d'un hexagone (partie NORD-EST) (ex: red) : ")
col2 = input("Veuillez entrer la couleur de la 2ème partie d'un hexagone (partie OUEST) (ex: grey) : ")
col3 = input("Veuillez entrer la couleur de la 3ème partie d'un hexagone (partie SUD) (ex: black) : ")
col = (col1, col2, col3)

    # Coordonnées du centre de la sphère de déformation :
c_x = int(input("Veuillez indiquer l'abcisse(x) du centre de la sphère de déformation (ex: -50) : "))
c_y = int(input("Veuillez indiquer l'ordonnée(y) du centre de la sphère de déformation (ex: -40) : "))
c_z = int(input("Veuillez indiquer la cote(z) du centre de la sphère de déformation (ex: -30) : "))
centre = (c_x, c_y, c_z)

    # Rayon de la sphère de déformation :
rayon = int(input("Veuillez entrer le rayon de la sphère de déformation (ex: 200) : "))


    # Lancement des fonctions, affichage du dessin :
turtle.speed(11) # Vitesse de dessin maximale
turtle.tracer(0) # TEST Vitesse de dessin instantanée
turtle.title("Vasarely Project")
pavage(inf_gauche, sup_droit, longueur, col, centre, rayon)
turtle.hideturtle()


    # Sauvegarde du résultat :
turtle.getcanvas().postscript(file="pavage3.eps")

    # END
turtle.exitonclick() # Ferme la fenêtre Turtle après un click
