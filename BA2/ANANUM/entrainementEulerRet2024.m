% entrainementEulerRet2024

% implicite, on doit utiliser fsolve()

function y = entrainementEulerRet2024 (f,y0,t)

  y(1)=y0;

  for i = 1:length(t)-1

    h = t(i+1)-t(i);

    g = @(X) [y(i) + h*f(t(i+1),X) - X];

    y(i+1) = fsolve(g, y(i));

  endfor

endfunction
