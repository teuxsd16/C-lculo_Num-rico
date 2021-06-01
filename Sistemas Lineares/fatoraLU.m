function fatoraLU(A,b)
  fprintf("Soluções em ordem x1,x2... :\n");
  n=size(A,1);
  L=eye(n,n);
  for j=1:n-1
    for i=j+1:n
    L(i,j) = A(i,j)/A(j,j);
    A(i,j+1:n) = A(i,j+1:n) - L(i,j)*A(j,j+1:n);
    A(i,j)=0;
    endfor
  endfor
  nb = n+1;
  #L*y=b
  Aug = [L b];
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
  end
  y = zeros(n,1);
  y(n) = Aug(n,nb)/Aug(n,n);
  for i = n-1:-1:1
      y(i) = (Aug(i,nb)-Aug(i,i+1:n)*y(i+1:n))/Aug(i,i);
  end
  #U*x=y
  Aug = [A y];
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
  end
  x = zeros(n,1);
  x(n) = Aug(n,nb)/Aug(n,n);
  for i = n-1:-1:1
      x(i) = (Aug(i,nb)-Aug(i,i+1:n)*x(i+1:n))/Aug(i,i);
  end;x
endfunction