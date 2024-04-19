Teste de diferença de médias - amostras independentes

# Teste de diferença de médias - amostras independentes

momento = c(rep('Antes',7),rep('Depois',7))
nota = c(6,5,6,9,6,8,7,8,10,7,9,10,9,9)
nova_politica = data.frame(momento,nota)

library('Rcmdr')

# Problema de pesquisa:
# Será que a nota média antea da nova política era menor do que  a nota média  depois da nova política?

#Hipótese NULA : A nota média antes da nova política era menor ou igual a nota média depois da nova política?

# Nível de significância = 1,5,10 - Nível de confiança (90,95,99%)

#p-value < nível de signifiCância, rejeita a hipótese nula
# p-value > nível de significância, não rejeita a hipótese nula

# p.value = 0,9962 - Não podemos rejeitar a hipotese nula.

data:  nota by momento
t = -3.2476, df = 11.294, p-value = 0.9962
alternative hypothesis: true difference in means between group Antes and group Depois is greater than 0
95 percent confidence interval:
  -3.325016       Inf
sample estimates:
  mean in group Antes mean in group Depois 
6.714286             8.857143 

------------//--------------------//------------------------//----------------


library(readxl)
vendas <- read_excel("C:/Users/jessi/Downloads/vendas.xlsx", 
                     sheet = "amostra")

# Problema de pesquisa:
  # A média de vendas de uma empresa é diferente da outra empresa?
# Teste de diferença de amostras pareadas:
  # HIpótese 1 = NULA = A média de vendas da empresa 1 é igual a média de vendas das empresa 2
  # Hipótese 2 = ALTERNATIVA = A média de vendas da empresa 1 é diferente da média de vendas da emp 2

library('Rcmdr')

# Nível de significância = 1,5,10 - Nível de confiança (90,95,99%)

#p-value < nível de signifiCância, rejeita a hipótese nula
# p-value > nível de significância, não rejeita a hipótese nula

# Nesse caso o nível de significância é de 5% com nível de confiança de 95%...
# De acordo com os calculos o p-value deu maior que o nível de signicância, não podemos rejeitar a
# hipótese nula: 0.4767
# Não há diferença entre as médias, de acordo com o intervalo de confiança :
    # -194 |-| 92 
'''
data:  empresa1 and empresa2
t = -0.72094, df = 29, p-value = 0.4767
alternative hypothesis: true mean difference is not equal to 0
95 percent confidence interval:
  -194.14582   92.94582
sample estimates:
  mean difference 
-50.6 
'''
===========/=/===========================//===============================//=============================


# Teste de diferença de proporções:
 # Montadora pretende comparar o potencial de mercado  das regiões norte e sul
# Perguntou para 300 pessoas

# TESTE DE HIPÓTESES 1 = nula:
    # A proporção de pessoas que responderam sim é igual em ambas as regiões
# TESTE DE HIPÓTESE 2 = ALTERNATIVA:
  #  A proporção de pessoas que responderam sim difere entre as regiões

# IMPORTAÇÃO DOS DADOS A SEREM INFERIDOS:
library(readxl)
automoveis <- read_excel("C:/Users/jessi/Downloads/automoveis.xlsx", 
                         sheet = "Base3")

library('Rcmdr')

# Nível de significância = 1,5,10 - Nível de confiança (90,95,99%)

#p-value < nível de signifiCância, rejeita a hipótese nula
# p-value > nível de significância, não rejeita a hipótese nula
'''

Percentage table:
       Resposta
Regiao   Nao  Sim Total Count
  Norte 42.3 57.7   100   300
  Sul   52.0 48.0   100   300
  
data:  .Table
X-squared = 5.6247, df = 1, p-value = 0.01771
alternative hypothesis: two.sided
95 percent confidence interval:
  -0.17617796 -0.01715538
sample estimates:
  prop 1    prop 2 
0.4233333 0.5200000 
'''

# Temos um p-value dentro do nível de significância = 0.01 então podemos rejeitar a hipotese nula
# Não temos numero 0 no intervalo de confiança entao pouco provável que a diferença de proporçãopo sejam iguais

------------//---------------------------//------------------------------//--------------------------

# Suponha que, no estudo que deu origem a base de dados "habitoLeitura", 
# o pesquisador queira testar as seguintes hipóteses, ao nível de confiança de 95%:

#H0: A quantidade média anual de livros consumidos por uma pessoa que gosta de ler
# é igual a quantidade média de livros consumidos por uma pessoa que não gosta de ler;

#H1: A quantidade média anual de livros consumidos por uma pessoa que gosta de ler 
# é diferente da quantidade média de livros consumidos por uma pessoa que não gosta de ler.

# Nível de significância = 1,5,10 - Nível de confiança (90,95,99%)

#p-value < nível de signifiCância, rejeita a hipótese nula
# p-value > nível de significância, não rejeita a hipótese nula

#nível de confiança de 95% com nível de significância de 5%

library(readxl)
habitoLeitura <- read_excel("C:/Users/jessi/Downloads/habitoLeitura.xlsx")
View(habitoLeitura)

library('Rcmdr')

data:  QTDE by GOSTALER
t = -5.0072, df = 33.921, p-value = 0.00001691
alternative hypothesis: true difference in means between group Não and group Sim is not equal to 0
95 percent confidence interval:
  -9.669476 -4.086080
sample estimates:
  mean in group Não mean in group Sim 
2.900000          9.777778 

                                      #Problema de pesquisa:
# O teste apresenta um p-value menor que 5%, há evidência para rejeitar a hipótese nula. (VERDADEIRO)

# Uma diferença igual a zero não está no intervalo de confiança de 95%, 
# portanto há evidência para rejeitar a hipótese nula, confirmando a hipótese de que as duas médias são diferentes. (VERDADEIRO)

# O teste mostra que o consumo médio de livros por pessoas que gostam de ler é maior 
# que o consumo médio de livros por pessoas que não gostam de ler, mas não há nenhuma
# evidência estatística que esta diferença também pode ocorrer na população.  (FALSO)


# Será que a proporção da preferência por e-books difere entre pessoas que gostam 
# e não gostam de ler livros?


# H0: A proporção da preferência por e-books é igual entre pessoas que gostam e não gostam de ler;
# H1: A proporção da preferência por e-books difere entre pessoas que gostam e não gostam de ler.

                          # PROBLEMAS:

# A proporção de pessoas da amostra que não gostam de ler mas, 
 # quando necessário, preferem e-books, é de 20%. (VERDADEIRO)

# Com p-value menor que 5%, não há evidência para rejeitar a hipótese nula. (FALSO)

# Uma diferença igual a zero está dentro do intervalo de confiança de 95%. 
 # Portanto, não há evidência para rejeitar a hipótese nula. (VERDADEIRO)

'''
GOSTALER E-books Livro físico Total Count
Não    20.0         80.0   100    10
Sim    18.5         81.5   100    27

2-sample test for equality of proportions without continuity correction

data:  .Table
X-squared = 0.010441, df = 1, p-value = 0.9186
alternative hypothesis: two.sided
95 percent confidence interval:
  -0.2731637  0.3027934
sample estimates:
  prop 1    prop 2 
0.2000000 0.1851852 
'''



