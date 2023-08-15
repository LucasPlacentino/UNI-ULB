# tp12func

# m=3
# h=1/3
#function [y] = tp12f (h, f) # que dans ce cas ci tp12ex1 d)
#  A = [1+(h^2/2), -1, 0 ; -1, 2+h^2, -1 ; 0, -1, 2+h^2];
#  b = [h^2 *f(0); h^2 * f(h); h^2 * f(2*h)];
#  y=A\b;
#  y3 = 0;
#  y = [y ; y3];
#endfunction

% attention, ici 1 CL, donc plutot faire h = 1/(m-1) ? puisqu'on
function [y] = tp12func (m, a, b, f, cl) # fonctionne pour tout m (nbre de points ou la sol est calculee)
  h = 1/m;

  A = diag(-ones(1,m-1),1) + diag(-ones(1,m-1),-1);
  A = A + diag((2+h^2)*ones(1,m),0);
  A(1,1) = 1+(h^2/2);

  d(1)= (h^2/2) * f(a);
  for i=1:m-1
    d = [d ; h^2*f(a+i*h)];
  endfor

  y = A\d;
  y3 = cl;
  y = [y; y3];
endfunction

