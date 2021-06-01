function poli(xi,yi)
  #Entra com os pontos na forma vetorial.
  A=[];xi=xi';yi=yi';
  for n=1:length(xi)
    A=[A, xi.^(length(xi)-n)];
  end
  coef = A\yi
  xx = linspace(min(xi),max(xi));
  plot(xi,yi,'ro',xx,polyval(coef,xx),'b-');grid
  title('Interpolação polinomial');
end