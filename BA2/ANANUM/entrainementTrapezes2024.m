% entrainementTrapezes2024

function int = entrainementTrapezes2024 (f,a,b,ni)

  h = (b-a)/ni % sous-intervalle de largeur h

  int = 0

  for i = 1:ni

    int = int + (h/2)*( f(a+(i-1)*h) + f(a+i*h));
    % aire_trapeze = 1/2 * h * (petit_cote + grand_cote)

  endfor

endfunction
