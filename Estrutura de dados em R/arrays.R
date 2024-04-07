Arrays:
São variáveis que armazenarão coleções de Matrizes. Entretanto, em Arrays só poderemos criar elementos com o mesmo tipo de dados,
ou seja, ou só número ou só texto.


colunas.names = c('Col 1', 'Col 2', 'Col 3')
linhas.names = c('Linha 1','Linha 2')
matrizes.names = c('Matriz 1','Matriz 2')

a <- array(data='Dados', dim =c(nrow=2,ncol=3,2),
                          dimnames = list(linhas.names,
                                          colunas.names,
                                          matrizes.names))
a


> a
, , Matriz 1

        Col 1   Col 2   Col 3  
Linha 1 "Dados" "Dados" "Dados"
Linha 2 "Dados" "Dados" "Dados"

, , Matriz 2

        Col 1   Col 2   Col 3  
Linha 1 "Dados" "Dados" "Dados"
Linha 2 "Dados" "Dados" "Dados
