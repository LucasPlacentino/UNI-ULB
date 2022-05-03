% tp9trapezes

function [aire] = tp9trapezes (f, a, b, h)
  
  n=(b-a)/h;
  int = 0;
  
  for i = 0:n-1
    int = int + (h/2)*(f(a+h*i)+f(a+h*(i+1)));
  endfor
  
  aire = int;
  
endfunction
