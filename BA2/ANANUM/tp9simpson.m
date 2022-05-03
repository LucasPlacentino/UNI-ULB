% tp9simpson

% intégrale

function [aire] = tp9simpson(f, a, b, n)
  h = (b-a)/n;
  int = 0;
  for i=0:n-1
    int = int + (h/6)*(f(a+i*h)+4*f(a+h*(i+0.5))+f(a+h*(i+1)));
  endfor
  
  aire = int;
  
endfunction
