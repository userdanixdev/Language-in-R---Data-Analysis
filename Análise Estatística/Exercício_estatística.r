
# A base de dados "pesqIntencoes", disponível neste link, contém os dados de uma pesquisa de intenção de
# voto feita com uma amostra de 367 pessoas, antes e
# depois de um debate político entre dois candidatos na TV aberta. 
# As pessoas que participaram da pesquisa foram selecionadas aleatoriamente, e
# informaram seu nível de escolaridade e renda antes do debate. 
# As mesmas pessoas foram consultadas novamente depois do debate.

# As variáveis da base de dados são:
  
#nivelEsc: nível de escolaridade
#renda: renda, medida em salários mínimos (SM)
#antes: a intenção de voto antes do debate (Candidato1 ou Candidato2)
#depois: a intenção de voto após o debate (Candidato1 ou Candidato2)

library(readxl)
pesqIntencoes <- read_excel("C:/Users/jessi/Downloads/pesqIntencoes.xlsx")

# Para verificar se houve mudança na intenção de voto, depois do debate na TV aberta, 
# podemos utilizar o teste não-paramétrico de McNemar para amostras relacionadas.

#No R, o primeiro passo é criar uma tabela de frequência, utilizando a função table.
# Vamos criar um objeto chamado "tabela", e acrescentar nele as frequências de 
 # intenção de voto dos dois candidatos, antes e depois do debate, com o seguinte comando:

tabela = table(pesqIntencoes$antes,pesqIntencoes$depois)
tabela              

# resultado no console:
> tabela              

              Candidato1 Candidato2
Candidato1        219         84
Candidato2         16         48

# Indicadores:

# 219 pessoas mudaram a intenção de voto para o Candidato 1
# 84 pessoas tinham o candidato 1 como intenção de voto e mudaram após o debate na TV aberta
# 16 pessoas tinham o candidato 2 como intenção de voto antes do debate na TV aberta e após o debate mudaram para o Cand1
# 48 pessoas mantiveram o condidato 2 antes e depois do debate em TV aberta

# Agora podemos rodar o teste de McNemar com o seguinte comando:

mcnemar.test(tabela)

McNemar's Chi-squared test with continuity correction

data:  tabela
McNemar's chi-squared = 44.89, df = 1, p-value = 2.084e-11


# Sendo a hipótese nula de que não houve alteração na intenção de voto após o debate, 
# o resultado do teste mostra que Resposta há evidência, ao nível de significância de Resposta 1%
# de que houve alteração na intenção de voto após o debate (portanto é possível rejeitar a hipótese nula).


# Utilizando o teste qui-quadrado para duas entradas independentes, 
# verifique a relação entre as variáveis "renda" e "nível de escolaridade" (nivelEsc).

library(Rcmdr)

Frequency table:
  nivelEsc
rendaFam           Fundamental Médio Superior
Até 1 SM                  39    24        2
Entre 1 e 1,5 SM          44    37        2
Entre 1,5 e 2 SM          26    46       15
Entre 2 e 4 SM            19    33       10
Mais que 4  SM            23    32       15

Pearson's Chi-squared test

data:  .Table
X-squared = 35.406, df = 8, p-value = 0.00002254

# Para um nível de confiança de 95%, o resultado do teste indica que a hipótese nula pode ser rejeitada
ao nível de significância de 1%.







