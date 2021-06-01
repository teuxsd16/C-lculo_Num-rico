function Newton(Fun,FunDer, Xest,Err,imax,n=0)
   printf("Int\t X\t     Erro\n");
  for i=1: imax
    Xi= Xest - feval(Fun, Xest)/feval(FunDer,Xest);n=n+1;
    printf("%d  %1.9f\t %1.9f\n",n,Xi,abs((Xi- Xest )/Xest ));
    if abs((Xi- Xest )/Xest )< Err
      Xs=Xi;
      break
    endif
      Xest =Xi;
  endfor
  if i==imax
    fprintf("A solução pode não ter sida obtida em %i iterações.\n", imax)
    Xs=("Sem resposta");
  endif
endfunction