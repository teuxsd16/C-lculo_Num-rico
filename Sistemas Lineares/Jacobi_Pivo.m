function [x]=Jacobi_Pivo(A,b,x,tol,N,x0 = x,iter = 1)
  n = size(A,1);printf('Iter')
  for i=1:n
      printf('\tx%d      ',i);
  end; printf('   Erro\n')
  #Pivoteamento
  nb = n+1;
  Aug = [A b];
  for k = 1:n-1
      [big,i] = max(abs(Aug(k:n,k)));
      ipr = i+k-1;
      if ipr ~= k
          Aug([k,ipr],:)=Aug([ipr,k],:);
      end
      for i = k+1:n
          pivor = Aug(i,k)/Aug(k,k);
          Aug(i,k:nb) = Aug(i,k:nb)-pivor*Aug(k,k:nb);
      end
  end; A=Aug(:,1:n); b=Aug(:,nb);
  #Resolução do sistema
  while (iter <= N)
    for i = 1:n
      x(i) = (b(i) - A(i,[1:i-1,i+1:n])*x0([1:i-1,i+1:n]))/A(i,i);
    endfor;printf('%d   ',iter)
    for i=1:n
      printf('   %1.7f   ',x(i));
    end; printf('%1.7f\n',norm(x-x0,'inf'));
    #condicao de parada
    if (norm(x-x0,'inf')<tol)
      return
    endif
    #prepara nova iteracao
    x0 = x;
    iter += 1;
  endwhile
  error('num. max. iter. excedido.')
endfunction