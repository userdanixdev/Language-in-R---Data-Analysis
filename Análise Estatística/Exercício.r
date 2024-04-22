# No mercado de Bolsa de Valores, investidores costumam utilizar o múltiplo de mercado 
# chamado PVPA para tentar comprar ações de empresas que podem proporcionar melhores retornos no futuro.

# O indicador PVPA é resultado da divisão entre o Preço da Ação e o Valor do Patrimônio Líquido 
# por Ação da mesma empresa. Um PVPA igual a 1 significa que o valor da empresa (preço da ação) 
# é igual ao valor do seu patrimônio líquido.

# Um estudo levantou uma amostra do PVPA e do retorno após um ano da compra daquela ação.
# As 74 observações coletadas estão na base de dados "pvpa", disponível neste link. 
# As variáveis selecionadas para esta atividade são:
  
#   grupo: indicador PVPA organizado em quatro grupos (menor que 1, entre 1 e 2, entre 2 e 3, e maior que 3);
# ret1ano: retorno obtido após 1 ano, por quem comprou a ação daquela empresa no primeiro dia útil 
# do ano e a vendeu no último dia útil do mesmo ano.

# A questão levantada para as variáveis PVPA e ret1ano é a seguinte: 
# Será que o retorno médio, após um ano do investimento, difere entre os grupos de PVPA? Ou seja:

#H0: o retorno médio, após um ano do investimento, pode ser igual nos quatros grupos de PVPA;#
# H1: o retorno médio, após um ano do investimento, difere entre, pelo menos, dois dos quatro grupos de PVPA.
# Para testar as hipóteses, assuma que as premissas da normalidade e da igualdade das variâncias não foram violadas, 
# e que os dados foram coletados de maneira aleatória e independente.
# Para um nível de confiança de 95%, complete o resultado do teste Anova de fator único com o dado que falta:


AnovaModel.1 <- aov(ret1ano ~ grupo, data=pvpa)
summary(AnovaModel.1)
> summary(AnovaModel.1)
Df Sum Sq Mean Sq F value Pr(>F)  
grupo        3   8976  2991.9   3.207 0.0283 *
  Residuals   70  65299   932.8                 
---
  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

# A hipótese nula pode ser rejeitada ao nível de significância de 5%

library(readxl)
pvpa <- read_excel("C:/Users/jessi/Downloads/pvpa.xlsx")

# PREMISSAS:
# Aleatoriedade e indepedência na seleção da amostra
# Normalidade = Shapiro Test (H0 : Distribuição Normal)
# H0 = Os dados numéricos respeitados os moldes da distribuição normal?
# Todos os valores de P-values devem ser maiores que 10%.
# Não temos evidência para rejeitar hipótese nula.

# Utilize o teste de Levene para verificar a premissa da igualdade das variâncias da variável "ret1ano",
# agrupada pela variável "grupo".

# Antes de fazer o teste, converta a variável "grupo" para o tipo fator. Utilize o seguinte comando:
  
pvpa$grupo = factor(pvpa$grupo)

Rcmdr>  Tapply(ret1ano ~ grupo, var, na.action=na.omit, data=pvpa) # variances by group
Entre 1 e 2 Entre 2 e 3 Maior que 3 Menor que 1 
1506.9522   1794.4761   1043.5867    107.7205 

Rcmdr>  leveneTest(ret1ano ~ grupo, data=pvpa, center="median")
Levene's Test for Homogeneity of Variance (center = "median")
      Df F value   Pr(>F)   
group  3  5.7853 0.001361 **
      70                    
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1


# Há evidência para rejeitar a hipótese de igualdade entre as variâncias, 
uma vez que p-value é menor que 10%.


# Faça um teste de normalidade de Shapiro-Wilk da variável "ret1ano", 
# agrupada pela variável "grupo". Antes de fazer o teste, 
# converta a variável "grupo" para o tipo fator. Utilize o seguinte comando:


pvpa$grupo = factor(pvpa$grupo)
normalityTest(ret1ano ~ grupo, test="shapiro.test", data=pvpa)

grupo = Entre 1 e 2 

	Shapiro-Wilk normality test

data:  ret1ano
W = 0.9593, p-value = 0.5022

 --------
 grupo = Entre 2 e 3 

	Shapiro-Wilk normality test

data:  ret1ano
W = 0.94381, p-value = 0.6733

 --------
 grupo = Maior que 3 

	Shapiro-Wilk normality test

data:  ret1ano
W = 0.95495, p-value = 0.3943

 --------
 grupo = Menor que 1 

	Shapiro-Wilk normality test

data:  ret1ano
W = 0.8819, p-value = 0.009079

 --------

 p-values adjusted by the Holm method:
            unadjusted adjusted
Entre 1 e 2 0.502171   1.000000
Entre 2 e 3 0.673264   1.000000
Maior que 3 0.394283   1.000000
Menor que 1 0.009079   0.036316

# Os retornos do grupo 'Menor que 1' não apresentam distribuição normal



