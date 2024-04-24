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



