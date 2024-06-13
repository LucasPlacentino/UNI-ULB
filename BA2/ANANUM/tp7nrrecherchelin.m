# tp7nrrecherchelin
function [n, sol] = tp7nrrecherchelin(f, fprime, x0)
  n = 0;
  alpha = 1;
  while n < 69 % ou maxit
    n++;
    %p = f(x0)/fprime(x0);
    p = fprime(x0)\f(x0); % vecteur ET scalaire
    x = x0 - alpha*p;
    if abs(f(x)) < abs(f(x0)); % norm() plutot que abs() pour vectoriel ?
      break
    endif
    alpha = alpha/2
    x0 = x
  endwhile
  sol = x;
endfunction
