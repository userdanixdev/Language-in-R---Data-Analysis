
Analistas do mercado de capitais são profissionais que emitem recomendações de compra ou de venda de ações que podem ser
utilizadas por diversos interessados. Há vários estudos sobre os analistas, 
entre eles aqueles que buscam identificar variáveis que influenciam na acurácia de suas recomendações.

Um desses estudos pode ser conferido, na íntegra, nesta página da internet.
Parte da base de dados utilizada no estudo está disponível no arquivo "analistasMC", disponível neste link.

Esta atividade utilizará as seguintes variáveis:

ACUR: medida de acurácia dos analistas - quanto mais próxima de zero, menos os analistas erram em suas previsões;
logVM: logarítimo do valor de mercado da empresa, como medida do seu tamanho.

Um possível objetivo para a pesquisa relacionada aos analistas é o de verificar a relação entre a acurácia das suas previsões e o
tamanho da empresa, ou seja, testar a hipótese de que a acurácia dos analistas pode aumentar conforme aumenta o tamanho da empresa.

O modelo de regressão linear poderia ser escrito da seguinte maneira: ACUR = β0 + β1 logVM + ε 

Depois de executar a Regressão Linear Simples no R, utilizando a variável dependente ACUR e a variável independente logVM, julgue as afirmações a seguir como "Verdadeira" ou "Falsa":

O R2 (Multiple R-squared) mostra que o modelo de regressão linear simples explica pouco mais de 4% das variações que ocorrem na variável ACUR.

Call:
lm(formula = ACUR ~ logVM, data = analistasMC)

Residuals:
     Min       1Q   Median       3Q      Max 
-12.7060  -0.0027   0.3529   0.5912   1.4980 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) -2.06148    0.19729  -10.45  < 2e-16 ***
logVM        0.38445    0.05621    6.84 1.36e-11 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 1.286 on 1031 degrees of freedom
Multiple R-squared:  0.04341,	Adjusted R-squared:  0.04248 
F-statistic: 46.78 on 1 and 1031 DF,  p-value: 1.357e-11

# Questão 1:
# O R2 (Multiple R-squared) mostra que o modelo de regressão linear simples 
# explica pouco mais de 4% das variações que ocorrem na variável ACUR. ( Verdadeiro)
# [Multiple R-squared:  0.04341]

# Questão 02:

# O modelo de regressão se mostra estatísticamente útil para explicar as variações na variável ACUR
# uma vez que p-value é menor que 1%.[VERDADEIRO][MOSTRA QUE NÃO RELAÇÃO ENTRE AS VARIÁVEIS]

 # Ao nível de significância de 10%, não há evidência da relação entre as variáveis logVM e ACUR, 
# portando, não há evidência de que a acurácia dos analistas possa aumentar conforme 
# o aumento do tamanho da empresa. [VERDADEIRO]

# A inclinação de logVM (Estimate) é positiva, mostrando que, pela aplicação do modelo de regressão linear, 
# a acurácia (ACUR) aumenta quando o tamanho da empresa (logVM) aumenta.[VERDADEIRO]

# Antes de oficializar as conclusões sobre a relação entre as variáveis ACUR e logVM, 
# cujo modelo de regressão linear simples está disponível na questão anterior, 
# é importante conferir se os pressupostos dos modelos de regressão linear estão sendo atendidos. 
# Nesta atividade, você deve conferir cada um dos pressupostos e escolher a opção mais adequada:

# Pressuposto de Linearidade:

install.packages('lmtest')
library(lmtest)
cor.test(x=analistasMC$ACUR,y=analistasMC$logVM, method = 'pearson')
# Resultado no console:

Pearson's product-moment correlation

data:  analistasMC$ACUR and analistasMC$logVM
t = 6.8398, df = 1031, p-value = 1.357e-11
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 0.1492441 0.2659566
sample estimates:
      cor 
0.2083419 

# Há evidência fraca de correlação entre as variáveis  ACUR  e logVM(cor < 0,30)

# Homoscedasticidade ( Igualdade das variâncias):

regressao = lm(formula=ACUR~logVM, data=analistaMC)
bptest(regressao)







