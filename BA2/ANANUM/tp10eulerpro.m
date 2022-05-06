# tp10eulerpro

# euler progressive

# tp10eulerpro(f, 1, 0:0.01:10 ) et h = t_2-t_1 comme h constant

function [y] = tp10eulerpro (f, y0, t) # t contient t_min et t_max
  
  n = length(t);
  h = t(2) - t(1); # h constante
  y(1)=y0;
  for i = 1:n-1
    y(i+1) = y(i)+h*f(t(i),y(i));
  endfor
  
endfunction
