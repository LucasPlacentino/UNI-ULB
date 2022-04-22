% 3. fonctions en ficher (editor)

% function sortie = nom_fonction (argument1, argument2)
%   sortie = 1*3*argument2
% ATTENTION le ficher doit avoir exactement le nom de la fonction
%
% puis après
% z = nom_fonction(36.5,59) dans la command window

function RES = tp1ex3 (matrice)
  a = 1
  length(matrice)
  for i = 1:length(matrice)
    a = a*matrice(i,i)
  end
  RES = a
endfunction