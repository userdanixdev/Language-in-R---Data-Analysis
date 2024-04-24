Faça um Teste de Diferença de Médias para testar as seguintes hipóteses:
H0: A média da acurácia (variável ACUR), depois de 2018, é igual a média da acurácia antes de 2018 (variável ANO);
H0: A média da acurácia mudou depois de 2018.

library(Rcmdr)
numSummary(analistasMC$ACUR,groups=analistasMC$ANO,statistics=c('mean','sd','IQR','quantiles'),quantiles=c(0,.25,.5,.75,1))
# resultado console:
                       mean       sd       IQR        0%        25%        50%        75%         100% data:n
A partir de 2008 -0.7521873 1.363891 0.6087597 -10.37500 -0.7247685 -0.2648498 -0.1160089 -0.004645761    539
Antes de 2008    -0.7269017 1.258975 0.5261447 -13.58503 -0.6679487 -0.2793301 -0.1418040  0.000000000    494

# Na amostra, a média da acurácia antes de 2018 é maior que a média da acurácia a partir de 2018. [VERDADEIRO]

t.test(data=analistasMC,ACUR~ANO,alternative='two.sided',conf.level=.95,var.equal=TRUE)
Two Sample t-test

data:  ACUR by ANO
t = -0.30877, df = 1031, p-value = 0.7576
alternative hypothesis: true difference in means between group A partir de 2008 and group Antes de 2008 is not equal to 0
95 percent confidence interval:
 -0.1859795  0.1354084
sample estimates:
mean in group A partir de 2008    mean in group Antes de 2008 
                    -0.7521873                     -0.7269017 

O p-value é maior que 5%, indicando que a hipótese nula deve ser rejeitada.[FALSO] Indica que a hipótese nula não deve ser rejeitada.

O número zero não aparece no intervalo de confiança, motivo pelo qual a hipótese nula deve ser rejeitada. [FALSO]
[INDICANDO QUE A HIPÓTESE NULA NÃO DEVE SER REJEITADA]





