% entrainementEurlerPro


function y = entrainementEurlerPro2024 (f,y0,t)

  y(1) = y0;

  for i = 1:length(t)-1

    h = t(i+1)-t(i);
    % h est pas constant ? on pourrait juste en dehors de la boucle h=t(2)-t(1)

    y(i+1) = y(i) + h*f(t(i),y(i));

  endfor

endfunction
