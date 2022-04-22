# tp7newtonraphson

function [n, sol] = tp7newtonraphson(f, fprime, x0)
  n = 0;
  x = x0 - f(x0)/fprime(x0);
  #while (fprime(x) > 10^(-4)) & (fprime(x) < -10^(-4)) & n < 50
  while n < 69
    n++;
    x = x - f(x)/fprime(x);
  endwhile
  sol = x;
endfunction
