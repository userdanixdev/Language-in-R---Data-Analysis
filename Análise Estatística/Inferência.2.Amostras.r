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

