function x = GaussPivo(A,b)
  fprintf("Soluções em ordem x1,x2... :\n");
  [m,n] = size(A);
  if m~=n
      fprintf("Matriz deve ser quadrada\n")
  end
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
  end
  x = zeros(n,1);
  x(n) = Aug(n,nb)/Aug(n,n);
  for i = n-1:-1:1
      x(i) = (Aug(i,nb)-Aug(i,i+1:n)*x(i+1:n))/Aug(i,i);
  end;   
end