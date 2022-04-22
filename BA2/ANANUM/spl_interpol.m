function [s, A, d] = spl_interpol(x,y)
% S = spl_interpol(X,Y) 
%    la fonction determine le polynôme cubique par morceaux 
%    qui passe par N points (X(1), Y(1)),...,(X(N), Y(N)); 
%    le polynôme entre les deux abscisses X(i) et X(i+1) 
%    est defini via les parametres par S(i,1),..., S(i,4)
%    
% arguments:
%    X - le vecteur de taille N x 1 qui contient
%        les points d'interpolation; on demande à ce que
%        N > 2 et X(1) < X(2) < ... < X(N)
%    Y - le vecteur de taille N x 1 qui contient
%        les valeurs aux points d'interpolation;
%
% sortie:
%    S - S(i,1), S(i,2), S(i,3) et S(i,4), i=1,...,N - 1
%        sont les parametres qui specifient le polynôme
%        d'interpolation entre les abscisses X(i) et X(i+1)
%
    n = length(x);
    if (n < 3)
        error(['Le nombre d"éléments de X doit être > 2']);
    elseif (min(size(x))~=1 || min(size(y))~=1)
        error(['les arguments doivent être des vecteurs']);        
    elseif (length(y) ~= n)
        error(['Les vecteurs X & Y doivent avoir la même taille']);
    elseif (min( x(2:n)-x(1:n-1) ) <= 0)
        error(['X(i) doit être un vecteur strictement croissant']);
    else 
        % on manipule vecteurs-colonnes
        if(size(x,2)~=1) x = x'; end;
        if(size(y,2)~=1) y = y'; end;
           % h(i) vaut x(i+1)-x(i) 
        h = x(2:n) - x(1:n-1);
           % mu, lb
        hm = h(1:n-2);
        hp = h(2:n-1);
        mu = hm./(hm + hp); mu(n-1) = 1/2;
        lb(2:n-1) = hp./(hm + hp); lb(1) = 1/2; 
        d(2:n-1) = 6./(hm + hp).* ...
            ((y(3:end)-y(2:end-1))./hp-(y(2:end-1)-y(1:end-2))./hm);
        d(1) = d(2)/2; d(n) = d(n-1)/2;
        d = d';
           % détermination des parametres
        A = 2*diag(ones(n,1)) + diag(mu,-1) + diag(lb,1);
        u = A\d; % <=
        s(:,1) = u(1:n-1)./h./6;
        s(:,2) = u(2:n)./h./6;
        s(:,3) = (y(2:n)-y(1:n-1))./h-(u(2:n)-u(1:n-1)).*h./6;    
        s(:,4) = y(1:n-1)-u(1:n-1).*h.*h./6;    
    end
