% tp6ex2

% Gauss-Seidel:
% en gros parei lque Jacobi mais sans x(0)


%que 1 voisin de chque coté

function [pfait, rsurb, sol] = tp6ex2(A, b, critdarret)

n = size(A,1);
x = zeros(n,1)

p = 1;
pfait = p;
residu = norm(b-A*x);
rsurb = residu/norm(b);

while rsurb > critdarret && p < 200
  
x(1) =  (1/A(1,1))*(b(1) - A(1,2)*x(2))

for i = 2:n-1

x(i) = (1/A(i,i))*(b(i) - A(i,i-1)*x(i-1) - A(i,i+1)*x(i+1))
  
endfor

x(n) = (1/A(n,n))*(b(n) - A(n, n-1)*x(n-1));

pfait = p;
residu = norm(b-A*x);
rsurb = residu/norm(b);
sol = x;

p++;

endwhile  
  
endfunction

% fait en 6 iteration
% rsurb = 0.00021966
% sol .....
% A*sol est bien égal à b (d)
