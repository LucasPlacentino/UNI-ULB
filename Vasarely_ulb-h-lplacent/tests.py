import math
import turtle
from deformation import deformation

PI = math.pi

def hexagone(point, longueur, col, centre, rayon):
    n=0
    for i in range(3):
        turtle.color(col[i])
        hc =
        h0_x = (deformation((point[0]+longueur*math.cos(((n*2)*PI)/3),point[1]+longueur*math.sin(((n*2)*PI)/3),0), centre, rayon))[0]
        h0_y = (deformation((point[0]+longueur*math.cos(((n*2)*PI)/3),point[1]+longueur*math.sin(((n*2)*PI)/3),0), centre, rayon))[1]
        h1_x = (deformation((point[0]+longueur*math.cos(((n*2+1)*PI)/3),point[1]+longueur*math.sin(((n*2+1)*PI)/3),0), centre, rayon))[0]
        h1_y = (deformation((point[0]+longueur*math.cos(((n*2+1)*PI)/3),point[1]+longueur*math.sin(((n*2+1)*PI)/3),0), centre, rayon))[1]
        h2_x = (deformation((point[0]+longueur*math.cos(((n*2+2)*PI)/3),point[1]+longueur*math.sin(((n*2+2)*PI)/3),0), centre, rayon))[0]
        h2_y = (deformation((point[0]+longueur*math.cos(((n*2+2)*PI)/3),point[1]+longueur*math.sin(((n*2+2)*PI)/3),0), centre, rayon))[1]
        n = n+1
