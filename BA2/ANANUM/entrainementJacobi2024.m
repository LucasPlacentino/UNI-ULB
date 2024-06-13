% entrainementJacobi2024

% Pour un système tridiagonal

function [x iter rr] = entrainementJacobi2024 (A, b, tol, maxit, x0)

  n = length(b);
  x = zeros(n,1); % différence avec Gauss-Seidel ?

  for iter = 1:maxit

    x(1) = (b(1) - A(1,2)*x0(2)) / A(1,1);

    for i = 2:n-1

      x(i) = (b(i) - A(i,i+1)*x0(i+1) - A(i,i-1)*x0(i-1)) / A(i,i);

    endfor

    x(n) = (b(n) - A(n,n-1)*x0(n-1)) / A(n,n);
    x0 = x; % différence avec Gauss-Seidel, ici on met x0 = x

    % calcul du residu
    r = b - A*x; % résidu
    % ou pour ne tenir compte que des 3 diagonales
    % r = b- diag(A).*x- diag(A,1).*x(2:end) - diag(A,-1).*x(1:end-1);
    rr = norm(r)/norm(b); % r sur b

    if (rr <= tol)
      break;
    endif

  endfor

endfunction
