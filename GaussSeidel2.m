x0=zeros(11,1);
qtd=0;
iter=1;
while qtd<3 && iter<200
   x(1)=x0(2);
   for j=2:10
     x(j)=(cos(j/10)+x(j-1)+x0(j+1))/5;
   end
   x(11)=x0(10)/2;
   erro=norm(x-x0,'inf');
   if erro<10^-5
     qtd=qtd+1;
   else
     qtd=0;
   end
   iter=iter+1;
   x0=x;
end
disp('Seidel:')
disp(x);