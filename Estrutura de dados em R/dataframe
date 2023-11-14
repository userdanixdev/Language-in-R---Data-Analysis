FUNÇÕES DATAFRAME:
# Criando um data frame com vetores já criados anteriormente:
Obs: Utilizando a função data.frame(), as variáveis criadas são utilizadas como parâmetros.

df <- data.frame(cidade,temperatura)
df
Resultado no console:

df <- data.frame(cidade,temperatura)
> df
          cidade temperatura
1       Brasília          30
2      São Paulo          35
3 Rio de Janeiro          40
4   Porto Alegre          17
5          Goiás          33
6          Amapá          34
7        Roraima          31
8       Amazonas          35

# Criando dataframe com a lista criada anteriormente:
df2 <- data.frame(cidades)
df2

Resultado:

cidade temperatura regiao
1       Brasília          30      1
2      São Paulo          35      2
3 Rio de Janeiro          40      2
4   Porto Alegre          17      3
5          Goiás          33      1
6          Amapá          34      4
7        Roraima          31      5
8       Amazonas          35      4

  # Filtrando valores do data frame ou seja, recuperando o valor da linha desejada e da coluna desejada, assim:
df[1,2]   # chama o data frame e entre colchetes a linha, depois a vírgula ',' e digite o número da coluna antes de fechar colchetes.

Resultado:
 # FIltrando o valor da linha e coluna de um data frame:
> df[1,2]
[1] 30
> # FIltrando o valor da linha e coluna de um data frame:
> df[1,1]
[1] "Brasília"

# Filtrando todas as linhas da primeira ou de uma determinada coluna de um data frame:
df[,1]
df[,2]
Resultados das duas chamadas:
> df[,1]
[1] "Brasília"       "São Paulo"      "Rio de Janeiro" "Porto Alegre"  
[5] "Goiás"          "Amapá"          "Roraima"        "Amazonas"      
> df[,2]
[1] 30 35 40 17 33 34 31 35

# Retornar as linhas da coluna desejada:
df[1,]
df[2,]

Resultados:
df[1,]
    cidade temperatura
1 Brasília          30
> df[2,]
     cidade temperatura
2 São Paulo          35

# Filtrando data frame com intervalos de valores:
# Nesse caso, selecionar as 3 primeiras linhas da primeira e última coluna.
df2[c(1:3),c(1:3)]

Para verificar o nome das colunas:
names(nome_data_frame)
Para verificar o número de linhas X colunas:
dim(nome_data_frame)
dim(df)
Para verificar os tipos de dados contidos no data frame:
str(nome_data_frame)
str(df)
Para acessar uma coluna do dataframe:
df$cidade   # Mostrará os dados da coluna em linhas
Se for acessar por colchetes:
df['cidade']  # Buscará por colunas.
Resultados das sintaxes:

df['temperatura']
  temperatura
1          30
2          35
3          40
4          17
5          33
6          34
7          31
8          35
> df$temperatura
[1] 30 35 40 17 33 34 31 35

  
