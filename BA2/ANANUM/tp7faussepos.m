# tp7faussepos

function [n, sol] = tp7faussepos(f, a, b)
  n = 0;
  while n < 69
    n++;
    x = a - f(a)*((b-a)/(f(b)-f(a)));
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
