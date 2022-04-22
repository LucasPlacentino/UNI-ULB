function fo = spl_eval(xo,x,s)
% FO = spl_eval(XO,X,S)
%    la fonction renvoie la valeur FO d'un polynôme cubique
%    par morceaux qui est définit par les N abscisses 
%    X(1), ..., X(N) et les parametres S(i,:) du polynome
%    entre les deux abscisses X(i) et X(i+1) successives
%    
% arguments:
%    XO- l'abscisse où on veut évaluer le polynôme cubique
%        par morceaux; X0 doit être entre X(1) et X(N)
%    X - le vecteur de taille N x 1 qui contient
%        les points d'interpolation; on demande à ce que
%        N > 1 et X(1) < X(2) < ... < X(N)
%    S - S(i,1), S(i,2), S(i,3) et S(i,4), i=1,...,N - 1
%        sont les parametres qui definissent le polynôme 
%        d'interpolation entre les abscisses X(i) et X(i+1)
%
% sortie:
%    FO- valeur d'un polynôme cubique par morceaux 
%        au point XO
%
    n = length(x);
    if (n < 3)
        error(['Le nombre d"éléments de X doit être > 2']);
    elseif (min(size(x))~=1)
        error(['X doit être un vecteur']);        
    elseif (size(s,1)~=n-1)
        error(['La matrice S doit avoir ',int2str(n-1),' lignes']);
    elseif (size(s,2)~=4)
        error(['La matrice S doit avoir 4 colonnes']);
    elseif (xo < x(1) || xo > x(n))
        error(['XO doit être entre X(1) et X(N)']);
    elseif (min( x(2:n)-x(1:n-1) ) <= 0)
        error(['X(i) doit être un vecteur strictement croissant']);
    else
        i = min(max( find(x <= xo) ), n - 1);
        fo = s(i,1)*(x(i+1)-xo)^3 + s(i,2)*(xo-x(i))^3 + ...
             s(i,3)*(xo-x(i)) + s(i,4);
    end
    