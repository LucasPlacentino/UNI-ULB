# tp7-8 ex1 methode dichotomie

# f1 = @(x) besselj(0,x)
# f2 = @(x) e^(-x^2+22*x-120)-0.5
# f3 = @(x) 16*x^5-20*x^3+5*x-1

% f1 :
# [n, sol] = tp7dicho(f1, ...)

# ...

function [niterations, sol] = tp7dicho(f, a, b, espilon)
  niterations = 0;
  while abs(a-b) > espilon & niterations < 69
    niterations ++;
    x = (a + b)/2;
    if f(a)*f(x) < 0
      b = x;
    endif
    if f(b)*f(x) < 0
      a = x;
    endif
    if f(x) < 10^(-6) # plutot que f(x(k)) == 0 car précision
      sol = x;
      break
    endif
  endwhile 
endfunction

