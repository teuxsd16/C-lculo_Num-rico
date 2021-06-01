function GaussJordan(A,b) #Tem pivoteamento
    Aug = [A b];
    [m,n] = size(Aug);
    for i = 1:n-1
        [big,k] = max(abs(Aug(i:n-1,i)));
        ipr = i+k-1;
        if ipr ~= i
          Aug([i,ipr],:)=Aug([ipr,i],:);
        end
        N = Aug(i,:);
        N = N/N(i); #Divide pelo pivo - normalização
        Aug(i,:) = N; #Substitui pela equação dividida pelo pivo
        for j = 1:n-1 #i=1,j=2
            if i!=j
                Aug(j,:) = N*(-1*Aug(j,i)) + Aug(j,:); #Pega a linha 
                #normalizada e com o resto das linhas.
            end
        end
    end
    disp('Soluções em ordem x1,x2... :')
    x = Aug(:,n) #No final, mostra a última coluna e todas as linhas. 
end
