# tp7faussepos

function [n, sol] = tp7faussepos(f, a, b) % et res et maxit ?
  % faut que f(a)*f(b) soit < 0, en gros faut que ce soit de chaque coté de l'axe x
  n = 0;
  while n < 69 % ou for n = 1:maxit
    n++;
    x = a - f(a)*(b-a)/(f(b)-f(a)); % le point d'intersection entre l'abscisse et la droite reliant (a,f(a)) et (b,f(b))
    if f(a)*f(x) < 0
      b = x;
    endif
    if f(b)*f(x) < 0
      a = x;
    endif
    if f(x) < 10^(-6) # ou res, plutot que f(x(k)) == 0 car précision
      sol = x;
      break % ou return
    endif
    % sol = x
  endwhile
endfunction
