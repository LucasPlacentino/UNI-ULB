% TP1 ex 4. b)

function RES = tp1ex4b (x)
  for i = 1:length(x)
  if (x(i)==0)
    RES(i) = 1
  else
    RES(i) = sin(x(i))/x(i)
  end
  endfor
endfunction
