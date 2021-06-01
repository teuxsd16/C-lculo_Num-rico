function SecanteRaiz(Fun,X0, X1,Err,imax,n=0)
  printf("Int\t X\t        Erro\n");
  for i=1: imax
    FunX0= feval(Fun,X0);
    FunX1= feval(Fun,X1);
    Xi=X1-FunX1*(X0-X1)/(FunX0-FunX1);n=n+1;
    printf("%d  %1.5f   %1.7f\n",n,Xi,abs((Xi- X1 )/X1 ));
    if abs((Xi- X1)/X1)< Err
      Xs=Xi;
      break
    endif
    X0=X1;
    X1=Xi;
  endfor
  if i==imax
  fprintf("A solução não foi obtida em %i iterações.\n", imax)
  Xs=("Sem resposta")
  endif
endfunction