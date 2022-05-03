% tp9trapezessincar

function [aire] = tp9trapezessincar (a, b, h)
  
  n=(b-a)/h;
  int = 0;
  
  for i = 0:n-1
    int = int + (h/2)*(sincar(a+h*i)+sincar(a+h*(i+1)));
  endfor
  
  aire = int;
  
endfunction