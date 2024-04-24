# Inferência baseada numa amostra simples:
  # Problema:
      # Será que em média os veículos conseguem percorrer  mais de 18 milhas  com um galão  de combustível?
# Hipóteses:
    # Hipótese Nula :: A autonomia média é menor ou igual a 18?
    # Hipótese Alternativa :: A autonomia média é maior que 18?

# Variáveis:
    # Base de dados nativa do R, mt cars:
        # mpg: autonomia, medida em milhas por galão

# Resumos numéricos:
library(Rcmdr)
numSummary(mtcars[,'mpg',drop=FALSE],statistics=c('mean','sd','IQR','quantiles'),quantiles=c(0,.25,.5,.75,1))
     mean       sd   IQR   0%    25%  50%  75% 100%  n
 20.09062 6.026948 7.375 10.4 15.425 19.2 22.8 33.9 32

# Single Sample T-test:: mpg
with(mtcars,(t.test(mpg,alternative='greater',mu=18,conf.level=.95)))

One Sample t-test

data:  mpg
t = 1.9622, df = 31, p-value = 0.02938
alternative hypothesis: true mean is greater than 18
95 percent confidence interval:
 18.28418      Inf
sample estimates:
mean of x 
 20.09062 


# Ao nível de significância de 5% podemos rejeitar a hipótese nula :: 0.02938 * 100 :: p-value < 5%
    # Há evidência de autonomia média maior que 18.
------------------//---------------------------------//---------------------------------//---------------------------------///

# TESTE DE DIFERÊNÇA DE MÉDIAS:
  # Problema:
      # Será que existe diferença entre a autonomia média de veículos com câmbio automático em relação a veículos com câmbio manual?

# Hipóteses:
  # As médias são iguais :: H0 :: Hipótese Nula
  # As médias são diferentes :: H1 :: Hipótese Alternativa

  # Variáveis :
      # mpg :: autonomia, medida em milhas por galão 
      # am :: tipo de transmissão  ( 0 :: Automática , 1 :: Manual ) 

# Resumos numéricos:
library(Rcmdr)
numSummary(mtcars$mpg,groups=mtcars$am,statistics=c('mean','sd','IQR','quantiles'),quantiles=c(0,.25,.5,.75,1))

      mean       sd  IQR   0%   25%  50%  75% 100% data:n
0 17.14737 3.833966 4.25 10.4 14.95 17.3 19.2 24.4     19
1 24.39231 6.166504 9.40 15.0 21.00 22.8 30.4 33.9     13

# Inferências:
    # A média do câmbio manual é maior do que do câmbio automática em termos de autonomia milhas por galão.

# Análise da população:
  # Independents - Samples  t-Test:: mpg~am

t.test(data=mtcars,mpg~am,alternative='two.sided',conf.level=.95,var.equal=TRUE)

Two Sample t-test

data:  mpg by am
t = -4.1061, df = 30, p-value = 0.000285
alternative hypothesis: true difference in means between group 0 and group 1 is not equal to 0
95 percent confidence interval:
 -10.84837  -3.64151
sample estimates:
mean in group 0 mean in group 1 
       17.14737        24.39231 

## Inferências:
      # Podemos rejeitar a hipótese nula, p-value inferior a 1%.
      # Podemos aceitar a hipótese alternativa que as hipóteses são diferentes.

-----------------------//---------------------------------------//--------------------------------//-------------------------//

# TESTE F ANOVA:
  # Problema:
      # Será que existe diferença entre autonomia média dos veículos com diferentes números de cilindros?
  # Hipótese:
      # H0 :: As médias são iguais
      # H1 :: As médias são diferentes, entre pelo menos , duas quantidadees de cilindros.

  # Variáveis:
        # mpg :: autonomia, medida em milhas por galão
        # cyl :: número de cilindros ( 4, 6 , 8 )

# ANÁLISE DE VARIÂNCIA COM UM FATOR(ONE-WAY) : MPG ~ CYL

  anova_model <- aov(mpg~cyl,data=mtcars)

aov(formula = mpg ~ cyl, data = mtcars)

Terms:
                     cyl Residuals
Sum of Squares  817.7130  308.3342
Deg. of Freedom        1        30

Residual standard error: 3.205902
Estimated effects may be unbalanced

summary(anova_model)
            Df Sum Sq Mean Sq F value   Pr(>F)    
cyl          1  817.7   817.7   79.56 6.11e-10 ***
Residuals   30  308.3    10.3                     
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

# Com p-value menor que 1% ( 6.11e-10 < 0.001 ***) podemos rejeitar a hipótese nula de que as médias são iguais ao
# nível de significância de 1%.
with(data=mtcars,numSummary(mpg,groups=cyl,statistics=c('mean','sd')))
      mean       sd data:n
4 26.66364 4.509828     11
6 19.74286 1.453567      7
8 15.10000 2.560048     14

# Podemos ver que realmente as médias diferem de acordo com número de cilindros.
------------//---------------------//-----------------------//-------------------------//----------------------//--------------------

# REGRESSÃO LINEAR:
  # Problema:
      # Será que a autonomia muda conforme  o peso do veículo?

  # Hipóteses:
      # H0 :: A autonomia não possui relação com o peso.
      # H1 :: O peso do veículo contribui com as mudanças na autonomia.

# Variáveis:
    mpg :: autonomia, medida em milhas por galão  <-- Variável Dependente
    wt :: peso do veículo 
    am :: tipo de transmissão
    hp :: potência do motor

# Modelo Linear : RegModel: mpg ~ am + hp + wt
lm(mpg~am + hp + wt, data=mtcars)

Coefficients:
(Intercept)           am           hp           wt  
   34.00288      2.08371     -0.03748     -2.87858  

reg.model<-lm(mpg~am + hp + wt, data=mtcars)
summary(reg.model)
# resultado no console:
Coefficients:
             Estimate Std. Error t value Pr(>|t|)    
(Intercept) 34.002875   2.642659  12.867 2.82e-13 ***
am           2.083710   1.376420   1.514 0.141268    
hp          -0.037479   0.009605  -3.902 0.000546 ***
wt          -2.878575   0.904971  -3.181 0.003574 ** 
Residual standard error: 2.538 on 28 degrees of freedom
Multiple R-squared:  0.8399,	Adjusted R-squared:  0.8227 
F-statistic: 48.96 on 3 and 28 DF,  p-value: 2.908e-11

# p-value :: 2.90e-11, abaixo de 1%, rejeitando a hipótese nula de que a variável 'mpg'- autonomia milha por galão não possui relação com peso
# Agora, o tipo de transmissão 'am' possui um p-value :: 0.141268, ou seja, acima de 10% de nível de significância, ou seja, 
    # o tipo de transmissão não possui relação com autonomia 'mpg'.
# A variável 'hp' - potência do motor - p-value muito baixo, abaixo de 1% de nível de significância, rejeitando a hipótese nula de que
# a potência não possui relação com autonomia. E sim apoiando a hipótese alternativa de que a potência do motor contribui para maior autonomia.
# A variável 'weight' - Peso do veículo - com nível de significância de abaixo de 1%, conforme o resultado de regressão linear , 
      # rejeita a hipótese nula e afirmando a hipótese alternatuva de que o peso do veículo contribui para as mudanças de autonomia.


# Lembrando que o  Multiple R-squared:  0.8399 é acucária do método .
-----------------//--------------------------//------------------------//-----------------------------//---------------------//--------------------//------------











