function [x]=Newton_Sy(x,it)
 i=0;
 k=0;
for w=1:it
    #Usa simbolico ou digita as matrizes aqui.
    #Matriz jacobiana. Tem que isolar o zero.
    Jf(1,1) = 2*x(1)+x(2)*sin(x(1)*x(2));
    Jf(1,2) = x(1)*sin(x(1)*x(2));
    Jf(2,1) = 2*sin(x(1));
    Jf(2,2) = cos(x(2));
    #Matriz com as equações, isolando o zero.
    f(1,1) = x(1)^2-cos(x(1)*x(2))-1;
    f(2,1) = sin(x(2))-2*cos(x(1));
    
    f=-f;
    [m,n]=size(Jf);
    nb=n+1;
  E=[Jf f];
  for k=1:n-1
    for i=k+1:n
      pivo=E(i,k)/E(k,k);
      E(i,k:nb)=E(i,k:nb)-pivo*E(k,k:nb);
    endfor
  endfor
  delta=zeros(n,1);
  delta(n)=E(n,nb)/E(n,n);
  for j=n-1:-1:1
    delta(j)=(E(j,nb)-E(j,j+1:n)*delta(j+1:n))/E(j,j);
  endfor
  x=x+delta;
endfor
endfunction

