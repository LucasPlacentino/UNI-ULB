# tp11eulerret

# euler ret mais pour y vecteur

function [y] = tp11eulerret (f, y0, t)
  
  n = length(t);
  h = t(2) - t(1); # h constante
  y(:,1)=y0;
  #j=@(x) [ x - y_k - h*f(t_k+1, x) = 0]
  
  for i = 1:n-1
    g=@(X) [X-y(:,i)-h*f(t(i+1),X)];
    y(:,i+1) = fsolve(g, y(:,i));
  endfor

endfunction


