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

O p-value é maior que 5%, indicando que a hipótese nula deve ser rejeitada.[VERDADEIRO] 

O número zero não aparece no intervalo de confiança, motivo pelo qual a hipótese nula deve ser rejeitada. [FALSO]
[INDICANDO QUE A HIPÓTESE NULA NÃO DEVE SER REJEITADA]

#################################
# Um possível problema de pesquisa para a base de dados "analistasMC" poderia ser:
# "Será que a média da acurácia dos analistas difere entre empresas que possuem suas ações negociadas em diferentes quantidades de países?".
# Ou seja, um pesquisador poderia testar as seguintes hipóteses:

H0: A média da acurácia (variável ACUR) é igual entre empresas que possuem suas ações negociadas em 1, 2, 3 ou mais que 3 países;
H0: A média da acurácia difere entre empresas que possuem suas ações negociadas em, pelo menos, duas quantidades diferentes de países.

# Supondo que os dados são independentes e que foram coletados aleatoriamente, 
# resta ao pesquisador verificar, antes de rodar o teste F Anova, se as premissas da normalidade e da homogeneidade das variâncias 
# foram atendidas.

a) Para verificar a premissa da normalidade, execute os seguintes comandos no R:

library(RcmdrMisc)
normalityTest(ACUR ~ as.factor(NPAIS), test="shapiro.test", data = analistasMC)

as.factor(NPAIS) = 1 país 

	Shapiro-Wilk normality test

data:  ACUR
W = 0.55569, p-value < 2.2e-16

 --------
 as.factor(NPAIS) = 2 países 

	Shapiro-Wilk normality test

data:  ACUR
W = 0.54875, p-value < 2.2e-16

 --------
 as.factor(NPAIS) = 3 países 

	Shapiro-Wilk normality test

data:  ACUR
W = 0.35695, p-value < 2.2e-16

 --------
 as.factor(NPAIS) = Mais que 3 países 

	Shapiro-Wilk normality test

data:  ACUR
W = 0.61796, p-value = 0.00001025

 --------

 p-values adjusted by the Holm method:
                  unadjusted  adjusted   
1 país            < 2.22e-16  < 2.22e-16 
2 países          < 2.22e-16  < 2.22e-16 
3 países          < 2.22e-16  < 2.22e-16 
Mais que 3 países 0.000010252 0.000010252

# Os resultados indicam que a distribuição da acurácia é normal para mais que 3 países.

b) Para verificar a premissa da igualdade das variâncias, execute o seguinte comando no R:

leveneTest(ACUR ~ as.factor(NPAIS), data=analistasMC, center="median")

Levene's Test for Homogeneity of Variance (center = "median")
        Df F value Pr(>F)
group    3  1.0313 0.3779
      1029               

O resultado traz evidências de que as variâncias são IGUAIS.

# Depois de checar as premissas, o pesquisador pode testar as hipóteses da pesquisa. Para fins didáticos,
# considere que os dados atendem as premissas da distribuição normal e da igualdade das variâncias,
# independente dos resultados obtidos nas questões anteriores.

summary(aov(ACUR ~ as.factor(NPAIS), data = analistasMC))
                   Df Sum Sq Mean Sq F value Pr(>F)
as.factor(NPAIS)    3    7.8   2.586   1.499  0.213
Residuals        1029 1774.6   1.725               


Para um nível de confiança de 95%, há evidências para não rejeitar a hipótese nula, uma vez que p-value é maior que o nível de significância.










