function res=fpb(f,a,b,tol,n=0)
  a1=a; b1=b; a2=a;b2=b;
  x1=(a*f(b)-b*f(a))/(f(b)-f(a));
  err2=(b-a)/2;
  printf("Int  Xbis\t    Xfp\t\t    Ebis\t  Efp\n");
  while(abs(f(x1))>tol && err2>tol)#Caso um dos métodos atinga a tolerância.
      if(f(a)*f(b))>0
          printf("A função não tem raiz nesse intervalo");
          break;
      endif
      x2=(a2+b2)/2;
      if(f(x1)*f(a1))<0
          b1=x1;
      else
          a1=x1;
      endif
      if(f(x2)*f(a2))<0
          b2=x2;
      else
          a2=x2;
      endif
      err1=abs(f(x1)-0);err2=(b-a)/2;
      n=n+1;x1=(a1*f(b1)-b1*f(a1))/(f(b1)-f(a1));
      printf("%d   %f\t %f\t %f\t %f\n",n,x2,x1,err1,err2);
   endwhile
endfunction
