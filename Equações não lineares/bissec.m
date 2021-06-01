function res=bissec(f,a,b,tol,n=0,err=(b-a)/2)
  fa=f(a); fb=f(b);
  printf("Int\t    a\t           b\t    \t      X\t          Erro\n");
  while(err>tol) #Critério para continuar
      if (fa*fb)>0
          printf("A função não tem raiz nesse intervalo");
          break;
      endif
      n=n+1;x=(a+b)/2;
      printf("%d  | %1.9f|    %1.9f\t| %1.9f\t| %1.9f\n",n,a,b,x,err);
      if(f(x)*fa)<0
          b=x;
      else
        a=x;
      endif
      err=(b-a)/2;
  endwhile
endfunction
