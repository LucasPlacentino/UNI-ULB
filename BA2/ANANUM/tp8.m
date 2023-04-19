% TP8
clear all;

% appliquer Newton-Raphson à une focntion vecorielle
% fct vectorielles:
% F=@(x) [cos(x), sin(x), tan(x)]
% F=@(x,y) [cos(x)+sin(y), x-y*cos(x)]
% (on veut recycler ce qu'on a fait au tp précédant (?))
% on peut aussi faire
% F = @(x) [sin(x(1)), cos(x(2))+x(1)]  (ici x est un vecteur, ex: x=[1,3])
% ce dernier est préferable pour réutiliser nos algo qui étaient scalaires à la base

% la dérivée d'un fonction vectorielle est la matrice jacobienne
% Fp = @(x) [DF_1/Dx_1, DF_2/Dx_2, DF_3/Dx_3]

% on va devoir modifer une ligne de l'algo de Newton-Raphson:
% x^(k+1) = x^(k) - f(x_k)/f'(x_k)

% Ax=b  x=b/A  <=> x=A\b sur Octave
% ligne 15 // //  - Fp(x)\F(x)   => va tout le temps fonctionner même si scalaire


%fct du b)
F=@(x) [x(1).^2-x(2)-1; (x(1)-2).^2+(x(2)-0.5).^2-1]

%x = -2:0.1:2
x = linspace(0, 2, 300);
y = linspace(0, 2, 300);

# plutot que de chercher l'intersection de deux surfaces, on va regarder la norme d'un vecteur, et trouver sa racine dans un mesh
for i=1:size(x,2)
  for j=1:size(y,2)
    z(i,j)=min(norm(F([x(i),y(j)])),0.5); % Le min est juste pour que ce soit plus clair sur le mesh. Attention parentheses, une erreur est vite arrivee
  endfor
endfor
mesh(x, y, z) % (set(gca,'Zlim',[-1,1]) dans command window)
xlabel('x'); ylabel('y'); zlabel('z')
legend('z=norm')

% on peut voir une racine en x=0.2, y=1.1
% et l'autre en x=1.5, y=1.6

% c)

%jacobienne Fp
#   [df1/dx1 , df1/dx2 ; df2/dx1 , df2/dx2]
Fp=@(x) [2*x(1), -1; 2*x(1)-4, 2*x(2)-1]

x0_1 = [1.5; 1.6];
x0_2 = [0.2; 1.1];

[n1_nr , sol1_nr] = tp7newtonraphson( F, Fp, x0_1)

[n2_nr , sol2_nr] = tp7newtonraphson( F, Fp, x0_2)
