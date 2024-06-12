% entrainementSimpson2024


function int = entrainementSimpson2024 (f,a,b,ni)

  h = (b-a)/ni % sous-intervalle de largeur h

  int = 0;

  for i = 1:ni

    int = int + (h/6)*( f(a+(i-1)*h + 4*f(a+(i-1/2)*h) + f(a+i*h) );
    % formules: Newton-Cotes d'ordre 2

  endfor

endfunction
