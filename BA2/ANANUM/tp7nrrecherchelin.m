# tp7nrrecherchelin
function [n, sol] = tp7nrrecherchelin(f, fprime, x0)
  n = 0;
  alpha = 1;
  while n < 69
    n++;
    p = f(x0)/fprime(x0)
    x = x0 - alpha*p;
    if abs(f(x)) < abs(f(x0));
      break
    endif
    alpha = alpha/2
    x0 = x
  endwhile
  sol = x;
endfunction
