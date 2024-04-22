# data set Chicken Weight:
  # 1. Avaliar as premissas para rodar o teste ANOVA
  # 2. Verificar se rejeita a hipotse nula com nível confiança de 95%
        # H0 = o peso médio dos pintos (weight) pode ser igual nos quatro tipos de dieta(diet)
        # H1 = o peso médio dos pintos (weight) difere em pelo menos dois dos quatro tipos de dieta(diet)

chickWeight = ChickWeight
library(Rcmdr)

# Verificação dos dados extremos:
    # gráficos = boxplot
    # Observa-se na dieta do tipo 1 e tipo 2 temos outliers:

# Para tratar esse dados:

library(DescTools)
diet1 = subset(chickWeight,Diet ==1)
diet1$weight=Winsorize(diet1$weight)                         

diet2 = subset(chickWeight,Diet ==2)
diet2$weight=Winsorize(diet2$weight)                         

diet3 = subset(chickWeight,Diet ==3)
diet3$weight=Winsorize(diet3$weight)                         

diet4 = subset(chickWeight,Diet ==4)
diet4$weight=Winsorize(diet4$weight)                         

ChickWeight_1 = rbind(diet1, diet2, diet3, diet4)

# A base de dados ChickWeight foi subdividida em outras 4 bases de dados com a função subset, 
# cada uma contendo um dos grupos da variável Diet. Depois de tratar os dados discrepantes 
# com a função Winsorize, as 4 bases de dados foram unidas novamente com a função rbind.

# Análises de variância com 1 fator: ANOVA
ChickWeight_1
summary(aov(weight ~ Diet, data=ChickWeight_1))
# Valor de p-value menor que 1% REJEITAMOS A HIPOTESE NULA DA IGUAL DE PESOS
    # p-VALUE = 0.0000000684

with(ChickWeight_1, numSummary(weight, groups = Diet, statistics=c('mean', 'sd')))

# Como rankear as médias dos tratamentos?
# Tukey - Kramer: Quando os números de observações  for o mesmo em todos os grupos:
      # NÃO é o caso para essa base de dados... Pq o números de observações são diferentes.
TukeyHSD(aov(weight~Diet,data=ChickWeight_1),ordered = TRUE,conf.level = 0.95)

$Diet
diff         lwr      upr     p adj
2-1 20.046136   0.9822544 39.11002 0.0349282
4-1 33.400331  14.2321966 52.56847 0.0000509
3-1 40.346970  21.2830877 59.41085 0.0000004
4-2 13.354195  -8.4244422 35.13283 0.3909241
3-2 20.300833  -1.3861038 41.98777 0.0759616
3-4  6.946638 -14.8319987 28.72528 0.8441398

# Nas dietas 1-2, 1-4 e 1-3 há evidências que as dietas sejam diferentes, rejeitando a hipótese nula
# Nas dietas 4-2,3-2 e 3-4 não há evidências de rejeitar as hipóteses nulas.

# Agora o método mais apropriado de correlação com número de observações diferentes:
# Método Bonferroni:
pairwise.t.test(ChickWeight_1$weight, ChickWeight_1$Diet, p.adjust.method = "bonferroni")

1          2     3    
2 0.042      -     -    
3 0.00000044 0.097 -    
4 0.00005175 0.688 1.000

# Há diferença nas dietas 3-4, o resto podemos rejeitar a hiopotese nula.
