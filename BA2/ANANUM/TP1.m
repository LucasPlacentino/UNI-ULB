% sans ; -> affiche le resultat, ; -> n'afffiche pas le res
% attention multiplication matrice, respecter ordre
%
%
%
%

%C = [1 2 ;4 12; 2 4]
%len=length(C)
%si=size(C)
%si2=size(A,2)

format long

x = 0:0.5:4*pi % nombres de 0 a 4*pi par pas de 0.5
y = sin(x)
%plot(x,y,'*')
%hold on
%plot(x,y,'-')

%ybis = y*y fonctionnerait pas
ybis = y.*y
%hold off
plot(x,ybis,'-r')

% 2. a)
A2 = [];
for p = 1:5
  B2 = [];
  for i = 1:5
    B2 = [B2 rand];
  end
  A2 = [A2;B2];
end
A2 % matrice 5x5 aleatoire

A = rand(5) % matrice 5x5 aleatoire
%A = rand(5,5)



% 2. b)
L = eye(5) % matrice identite 5x5


% 2. c)
L(1:5,1) = A(1:5,1)/A(1,1) % ou (2:5,1)
%L(1:end,1) = A(1:end,1)/A(1,1) 
L(2:end,1) = -L(2:end,1)


% 2. d)
L = L*A % sa premiere colonne est


% 2. e)
Linv = inv(L)

% Fonction en ligne de commande
% f=@(x) cos(x)
% g=@(x,y,z) (cos(x)*y)+z*i


% 3. voir fichier tp1ex3.m




% 4. a)
x2 = -1:0.05:1
for i = 1:length(x2)
y2(i) = (exp(x2(i)/pi))/(log10(x2(i)+pi))
endfor
plot(x2,y2,'-*')

% 4. b)
% voir fichier tp1ex4b.m

x3 = -1:0.05:1
f3 = tp1ex4b(x3)
plot(x3,f3,'-*')

