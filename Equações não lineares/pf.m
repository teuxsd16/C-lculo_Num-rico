function res=pf(f,x0,tol,n=0)  printf("Int\t X\t   Erro\n");  while(true) #Crit�rio para continuar        x=f(x0);        if (abs(x-x0)<tol)          printf("%d    %1.6f\t  %1.6f\n",(n+1), x,abs(x-x0)); break;        else          n=n+1; printf("%d    %1.6f\t  %1.6f\n",n, x0,abs(x-x0));          x0=x;        end  endwhileendfunction