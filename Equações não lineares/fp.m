function res=fp(f,a,b,tol,n=0)
  #x=(a*f(b)-b*f(a))/(f(b)-f(a));
  err=(b-a)/2;
  printf("Int\ta\t     b\t    \t      X\t          Erro\n");
  while(err>tol)
      if(f(a)*f(b))>0
          disp("A função não tem raiz nesse intervalo");
          break;
      endif
      n=n+1;x=(a*f(b)-b*f(a))/(f(b)-f(a));
      if(f(x)*f(a))<0
          b=x;
      else
          a=x;
      endif
      #err=abs(f(x)-0);
      err=(b-a)/2;
      printf("%d  %f\t %f\t %1.9f\t %1.9f\n",n,a,b,x,err);
   endwhile
endfunction
