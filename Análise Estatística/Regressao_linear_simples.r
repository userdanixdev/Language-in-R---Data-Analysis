# REGRESSÃO lINEAR SIMPLES:

# Regressão Linear Simples:
mtcars = mtcars
# Problema:
  # Há relação entre as variáveis 'cyl' - número de cilindros - com a variável 'mpg' - autonomia do veículo milhas por galão
# Hipótese Nula:
      # Não há relação entre cyl e mpg
# Hipótese Alternativa: 
      # Há relação entre as variáveis

library(Rcmdr)
# Estatisticas ---> ajuste de modelo -- Modelo linear:

Call:
  lm(formula = mpg ~ cyl, data = mtcars)

Residuals:
  Min      1Q  Median      3Q     Max 
-4.9814 -2.1185  0.2217  1.0717  7.5186 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)  37.8846     2.0738   18.27  < 2e-16 ***
  cyl          -2.8758     0.3224   -8.92 6.11e-10 ***
  ---
  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 3.206 on 30 degrees of freedom
Multiple R-squared:  0.7262,	Adjusted R-squared:  0.7171 
F-statistic: 79.56 on 1 and 30 DF,  p-value: 6.113e-10

# Temos um valor estimado de intercepto de 37.88 e a inclinação de -2.8758
# Valor de p-value menor que 1%:  p-value: 6.113e-10, ou seja, não há relação entre as duas variáveis, rejeitando a hipótese nula.
# Encontrada evidência ao nível de significância de 1% da relaçao de cyl e mpg
# Signif. codes:  0 '***' 0.001 '**' 0.01 (nível de significância<1%)

# Modelo determinístico:

# autonomia(y)(variável dependente) = 37.8846 - 2.8758 * CYL + erro (= Residual Standard error: 3.206)
# Carros com mais cilindros possuem menos autonomia
# Multiple R-squared:  0.7262 = A autonomia (variável dependente é explicada pela variável independente = 73%)

# CORRELAÇÃO: Medida de relação linear entre duas variáveis
# Coeficiente de correlação : número entre 1 e -1

# No Rcmdr vai em estatística ---> Resumos  ---> Teste de correlação:

with(mtcars, cor.test(cyl, mpg, alternative="two.sided", method="pearson"))

Pearson's product-moment correlation

data:  cyl and mpg
t = -8.9197, df = 30, p-value = 6.113e-10
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 -0.9257694 -0.7163171
sample estimates:
      cor 
-0.852162 

# O coeficiente de correlação é negativo significa que quando uma variável aumenta a outra variável diminui
# O coeficiente de relação de -0,85 as variáveis estão fortemente relacionadas.


                          # PRESSUPOSTOS DE REGRESSÃO LINEAR:
                          
# Resíduos: É a diferença entre o valor estimado para a variável dependente e o seu valor real.
# Para mostrar o resíduo:

regressao = lm(mpg~cyl), data=mtcars)

library(Rcmdr)
mtcars = mtcars
regressao = lm(formula=mpg ~ cyl, data=mtcars)
regressao

# Resultado no console:
Call:
  lm(formula = mpg ~ cyl, data = mtcars)

Coefficients:
  (Intercept)          cyl  
37.885       -2.876  


residuos=regressao$residuals
summary(regressao)
# Modelo deterministico:
    # autonomia(y) = 37,8846 - 2,8758 * CYL  + erro

# Exemplo:
    # Mazda RX4 , número de cilindros = 6

37.8846 - 2.8758 * 6
# resultado no console: 20.6298 milhas por galão
# A quantidade real da base de dados

# PRESSUPOSTOS:
install.packages('lmtest')
library(lmtest)

# LINEARIDADE:
cor.test(x=mtcars$cyl,y=mtcars$mpg, method = 'pearson')
# Força de correlação entre as variáveis forte: -0.85
# Temos evidência inicial da correlação entre as variáveis

# IGUALDADE DAS VARIÂNCIAS (homoscestacidade)
      # CASO a hipotese seja rejeitada teremos um heterocestacidade = variancias diferentes
bptest(regressao)

studentized Breusch-Pagan test

data:  regressao
BP = 5.4942, df = 1, p-value = 0.01908
# com p-value perto dos 2% nós rejeitamos a hipótese nula = 0,01908
# O esperado era não rejeitar a hipótese nula.

# NORMALIDADE:

shapiro.test(residuos)
Shapiro-Wilk normality test

data:  residuos
W = 0.96323, p-value = 0.3359

# Esperamos não rejeitar a hipótese nula com um p-value maior que 5% e 10%, os resíduos
# estão sendo distribuidos conforme a distribuição normal

# AUTOCORRELAÇÃO:
    # independência de erros:
library(DescTools)
DurbinWatsonTest(regressao)
# Esperamos não rejeitar a hipótese nula que mostra que os dados não estão correlacionadas
# o P-value maior que 10% então os dados não estão correlacionados.
Durbin-Watson test

data:  regressao
DW = 1.6697, p-value = 0.1552
alternative hypothesis: true autocorrelation is greater than 0

# Os pressupostos podem ser afetados por dados extremos, outliers. é importante trata-los:
# OUTLIERS:
Outlier(mtcars$mpg)
Outlier(mtcars$mpg)
[1] 33.9

mtcars$mpg = Winsorize(mtcars$mpg)
## SUAVIZAR OS VALORES
Outlier(mtcars$mpg)
Outlier(mtcars$mpg)
numeric(0)
# Já não possui mais outliers



