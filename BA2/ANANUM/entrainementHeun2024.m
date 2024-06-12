% entrainementHeun2024

function y = entrainementHeun2024 (f,y0,t)

  y(1)=y0;

  for i = 1:length(t)-1

    h = t(i+1)-t(i);

    %%%fi = f(t(i),y(i)); % pour simplifier l'eq d'en dessous, pas besoin

    y(i+1) = y(i) + (h/2)*( f(t(i),y(i)) + f(t(i+1), y(i) + h*f(t(i),y(i)) ) );

  endfor

endfunction
