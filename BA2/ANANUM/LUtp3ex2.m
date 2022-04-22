#tp3 ex 2
# algo LU slide 17
function [L U] = LUtp3ex2 (A)
  n = size(A,1);
  #n = length(A)
  for k = 1:n
    for j = k:n    # pour k=1 on construit la premiere ligne
      U(k,j)=A(k,j);
    endfor
    L(k,k)=1;
    for i = k+1:n
      L(i,k) = A(i,k)/A(k,k);
      # on cree les coeff de l'elimination de Gauss (dans la première colonne quand k vaut 1)
    endfor
    for i = k+1:n
      for j = k+1:n
        A(i,j)=A(i,j)-(L(i,k)*A(k,j));
      endfor
    endfor
  endfor
endfunction
