import matplotlib.pyplot as plt

G = 9.81             # accélération gravité
P0 = 1.013 * 10**5   # 1 atm


def graph(x, y):
    """
    Dessin d'un graph de y en fonction de x
    :param x: tuple(x's name, x's value is list type)
    :param y: tuple(y's name, y's value is list type)
    :return: None
    """
    plt.plot(x[1], y[1])
    plt.xlabel(x[0])
    plt.ylabel(y[0])
    plt.show()


def acceleration(h, v):
    """acceleration en fonction de la profondeur et des frottements
    :param h: hauteur
    :param v: vitesse
    :return: l'accélération à une certaine profondeur, à une certaine vitesse
    """
    return G*(1 - ((V0 + (VA*P0)/(P0 + h*1000*G))*1000/M)) - (v*K)/M


V0 = float(input("V0 : "))        # volume du bathyscaphe sans compter le cylindre d'air
VA = float(input("VA : "))        # volume du cylindre d'air à pression de 1 atm (ici par rapport à v0) (mètres cubes)
M = float(input("M : "))          # masse du bathyscaphe (rempli d'eau) (kilogrammes)
K = float(input("K : "))          # Coefficient de Frottement (à déterminer)
temps = float(input("temps : "))  # Intervalle de temps entre les données du tableau (en secondes)
h_decl = float(input("Déclenchement : "))  # Hauteur de déclenchement
VF = float(input("Volume final : "))  # Volume avec le flotteur gonflé"""
DEBIT = 0.0002  # Debit de remplissage du flotteur (mètre cube par seconde)
# Construction du tableau

tableau = [[0]*4]

# Initialisation de la première valeur (l'accéleration en t = 0), pour pouvoir remplir le tableau par récurrence.
tableau[0][1] = round(acceleration(0, 0), 6)  # ici tout sera arrondi à la sixième décimale

# Le tableau est composé avec le temps écoulé en secondes, puis l'accélération, la vitesse et la profondeur à ce moment.
j = 1  # étape
decl = False  # Le mécanisme de remontée ne s'est pas encore déclenché

while tableau[j-1][3] >= 0:

    tableau.append([0, 0, 0, 0])

    # index de temps
    tableau[j][0] = round(tableau[j-1][0] + temps, 6)

    # L'accélération en t est déterminée par la profondeur en t-1 et les frottement (vitesse en t-1)
    tableau[j][1] = round(acceleration(tableau[j-1][3], tableau[j - 1][2]), 6)

    # La vitesse en t est la vitesse en t-1 plus l'accéleration en t fois l'intervalle de temps
    tableau[j][2] = round(tableau[j][1]*temps + tableau[j-1][2], 6)

    # La profondeur en t est la profondeur en t-1 plus la vitesse t fois l'intervalle de temps
    tableau[j][3] = round(tableau[j][2]*temps + tableau[j-1][3], 6)

    # Déclenchement du flotteur
    if (tableau[j][3] >= h_decl or decl) and V0 < VF:
    	decl = True
      V0 += DEBIT * temps
    j += 1


# les variables
le_temps = ("Temps", [])
accel = ("Accélération", [])
vit = ("Vitesse", [])
hauteur = ("Hauteur", [])
courbes = [le_temps, accel, vit, hauteur]

for i in tableau:       # reformater tableau afin de séparer chaque variable
    le_temps[1].append(i[0])
    accel[1].append(i[1])
    vit[1].append(i[2])
    hauteur[1].append(i[3])

# Toutes les courbes superposées
for i in courbes[1:]:
    plt.plot(le_temps[1], i[1])
plt.show()

# graph
graph(le_temps, accel)
graph(le_temps, vit)
graph(le_temps, hauteur)

"""
Pour faire des tests rapides
V0 = 0.0025
VA = 0.00001
M = 2.6
K = 1
temps = 0.01
h_decl = 7
VF = 0.0035
"""

