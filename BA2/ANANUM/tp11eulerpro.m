# tp11eulerpro

function [y] = tp11eulerpro (f, y0, t) # t contient t_min et t_max
  
  n = length(t);
  h = t(2) - t(1); # h constante
  y(:,1)=y0;
  for i = 1:n-1
    y(:,i+1) = y(:,i)+h*f(t(i),y(:,i));
  endfor
  
endfunction