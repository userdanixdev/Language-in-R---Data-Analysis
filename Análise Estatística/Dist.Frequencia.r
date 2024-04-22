A distribuição de frequência é uma tabulação organizada/representação gráfica do número de indivíduos em cada categoria na escala de medição.
Ela permite que o pesquisador tenha uma visão panorâmica de todos os dados facilmente. Ele mostra se as observações são altas ou baixas e
se estão concentradas em uma área ou espalhadas por toda a escala. Assim, a distribuição de frequência apresenta uma imagem de como as 
observações individuais são distribuídas na escala de medição.

Para esse exercício, preencha a tabela de frequência a seguir, usando as mesmas técnicas do Capítulo 3 da Unidade 3,
porém agora utilizando a variável cyl, do dataset mtcars.

# Distribuição de frequência:

# Ordenação das variáveis cilindros:
cyl <- sort(round(mtcars$cyl))
# Ordenando as variáveis:
cbind(factor(cyl))
factor(cyl)
# Classificando as variáveis:
summary(factor(cyl))
frequencia =c(11,7,14)
frequencia = cbind(frequencia)

# Declarando as variáveis,transformando em colunas e seus resultados:
frequencia_relativa = round(prop.table(frequencia),2)
frequencia_percentual = round(prop.table(frequencia)*100,2)
frequencia_relativa = cbind(frequencia_relativa)
frequencia_percentual = cbind(frequencia_percentual)
frequencia_percentual


# Criando a tabela com as colunas criadas:
mt_cars_cilindros_2 = data.frame(Classes = c('4-6','6-8','8'),frequencia,
frequencia_relativa,frequencia_percentual)
mt_cars_cilindros_2
