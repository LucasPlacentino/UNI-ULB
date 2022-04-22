% TP 6

% Ax=b
%de maniere iterative
% (k) num d'iteration
%erreur e^(k) = x - x^(k)
% Ae^(k) = b-Ax^(k)


%x^(k+1) = x^(k) + e^(k)
% il faut que cette erreur e va tendre vers zero après les itérations

% e^(k) = A^(-1) (b-Ax^(k)
%         ^^  B~=A

% A = tril(A) + trim(A) - diag(A)     (! ? !)
%     ^^^L_A    ^^^U_A    ^^^D_A 
%       ^^ GS               ^^ Jacobi
%le choix des diagonales ou triangulaire sera pratique pour l'inversion
%(in version, aucun element diagonal

% critère d'arret
%||r^(k)||/||b|| <= 10^(-3)    (10^(-3) dans cet exo)

% il faut mettre un max de nombre d'iteration (100 ou 200 par ex)
% permet de savoir pourquoi on sort de la routine

% ||~x - x||/||x|| <= k(A) ||r^(k)||/||b||





% ----------------  EX 1  -----------------------


% algo de Jacobi
% matr tri-diagonale

# J:
%premiere ligne , que 1 voisin
function [pfait, rsurb, sol] = tp6(A, b, critdarret)
  
x = zeros(size(A,1),1);
n = size(A,1) 

p = 1;
pfait = p;
residu = norm(b-A*x);
rsurb = residu/norm(b);

while rsurb > critdarret && p < 200
 
x(1) = (1/A(1,1))*(b(1) - A(1,2)*x(2));

for i = 2:n-1
  x(i)=(1/A(i,i))*(b(i) - A(i, i-1)*x(i-1) - A(i, i+1)*x(i+1));
endfor
%A(n,n);
%x(n)=(1/A(n,n))*(b(n) - A(n, n-1)*x(n-1));
x(n)=(1/A(n,n))*(b(n) - A(n, n-1)*x(n-1));

sol = x;
pfait = p;
residu = norm(b-A*x);
rsurb = residu/norm(b);

p++;

endwhile

endfunction

% fait en 5 iteration
% rsurb = 0.00091775
% sol ..... 
% A*sol est bien égal à b (d)



