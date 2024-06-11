% factorisation LU

% A=LU

function [L U] = entrainementLU2024 (A)

  %m = size(A,1); % lignes
  n = size(A,2); % colonnes
  % A doit être carrée donc m=n

  for k = 1:n % 1 à n compris
    for j = k:n % k à n compris

      U(k,j) = A(k,j);

    endfor

    L(k,k) = 1;

    for i = k+1:n % on skip le k actuel

      L(i,k) = A(i,k)/A(k,k);

    endfor

    for i = k+1:n
      for j = k+1:n

        A(i,j) = A(i,j) - L(i,k)*A(k,j);

      endfor
    endfor
  endfor

endfunction

