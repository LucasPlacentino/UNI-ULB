from math import pi, sin, cos, sqrt, acos, asin, atan2

def deformation(p, centre, rayon):
    """ Calcul des coordonnÃ©es d'un point suite Ã  la dÃ©formation engendrÃ©e par la sphÃ¨re Ã©mergeante
        EntrÃ©es :
          p : coordonnÃ©es (x, y, z) du point du dalage Ã  tracer (z = 0) AVANT dÃ©formation
          centre : coordonnÃ©es (X0, Y0, Z0) du centre de la sphÃ¨re (-rayon <= Z0 <= 0)
          rayon : rayon de la sphÃ¨re
        Sorties : coordonnÃ©es (xprim, yprim) du point du dallage Ã  tracer APRÃˆS dÃ©formation
    """
    x, y, z = p
    xprim, yprim, zprim = x, y, z
    xc, yc, zc = centre
    r = sqrt(
        (x - xc) ** 2 + (y - yc) ** 2)                  # distance horizontale depuis le point Ã  dessiner jusqu'Ã  l'axe de la sphÃ¨re
    rayon_emerge = sqrt(rayon ** 2 - zc ** 2)           # rayon de la partie Ã©mergÃ©e de la sphÃ¨re
    rprim = rayon * sin(acos(-zc / rayon) * r / rayon_emerge)
    if 0 < r <= rayon_emerge:                 # calcul de la dÃ©formation dans les autres cas
        xprim = xc + (x - xc) * rprim / r               # les nouvelles coordonnÃ©es sont proportionnelles aux anciennes
        yprim = yc + (y - yc) * rprim / r
    if r <= rayon_emerge:
        beta = asin(rprim / rayon)
        zprim = zc + rayon * cos(beta)
        if zc > 0:
            zprim *= -1
    return (xprim, yprim, zprim)

if __name__ == "__main__": # code de test
    for i in range(-150,150,50):
        for j in range(-150,150,50):
            print(deformation((i,j,0), (0,0,0), 100))
        print()