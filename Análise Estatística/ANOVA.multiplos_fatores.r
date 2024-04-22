library(readxl)
paraquedas <- read_excel("C:/Users/jessi/Downloads/paraquedas.xlsx")

# Uma indústria de paraquedas pretende comparar a resistência de seus produtos (RESIST)
# em função dos quatro fornecedores (FORNEC) de matérias-primas e dos dois teares (TEAR)
# utilizados na produção. Além disso, deseja determinar se quaisquer diferenças entre os
# quatro forncedores, em termos de resistência são dependentes do tipo TEAR utilizado
# (interação entre fornecedores e teares)

library ('Rcmdr')
# ----> Estatísticas ---> médias ---> ANOVA(multi-way)

# Hipótese nula = As resistências são iguais, a resistência não muda independente do fornecedor
# Hipotese Alternativa = Diferente fornecedores oferecem diferentes resistencias no paraquedas

Response: resist
Sum Sq Df F value   Pr(>F)   
fornec      134.349  3  5.1999 0.004866 **
tear          6.972  1  0.8096 0.374968   
fornec:tear   0.287  3  0.0111 0.998365   
Residuals   275.592 32                    
---
  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

# A hipotese nula poderia ser rejeitada ao nível de significância de 1%,
# indicando que a resistência dos paraquedas difere entre os fornecedores de materia-prima


# Depois que você fizer o teste ANova de múltiplos fatores, seguindo as instruções da aula, 
# utilize este script para fazer o mesmo teste utilizando apenas a variável independente "fornec",
# e para fazer o ranquemaneto dos resultados:

    aov(resist ~ fornec, data=paraquedas)
    tapply(paraquedas$resist, paraquedas$fornec, mean)
    TukeyHSD(aov(resist ~ fornec, data=paraquedas), ordered = TRUE, conf.level = 0.95)
    
    tapply(paraquedas$resist, paraquedas$fornec, mean)
    Fornecedor 1 Fornecedor 2 Fornecedor 3 Fornecedor 4 
    18.97        23.90        22.41        20.83 
    
    TukeyHSD(aov(resist ~ fornec, data=paraquedas), ordered = TRUE, conf.level = 0.95)
    Tukey multiple comparisons of means
    95% family-wise confidence level
    factor levels have been ordered
    
    Fit: aov(formula = resist ~ fornec, data = paraquedas)
    
    $fornec
    diff                                 lwr      upr     p adj
    Fornecedor 4-Fornecedor 1 1.86 -1.51610226 5.236102 0.4575145
    Fornecedor 3-Fornecedor 1 3.44  0.06389774 6.816102 0.0444506
    Fornecedor 2-Fornecedor 1 4.93  1.55389774 8.306102 0.0019926
    Fornecedor 3-Fornecedor 4 1.58 -1.79610226 4.956102 0.5934289
    Fornecedor 2-Fornecedor 4 3.07 -0.30610226 6.446102 0.0858305
    Fornecedor 2-Fornecedor 3 1.49 -1.88610226 4.866102 0.6378330
    

# A função tapply vai mostrar a resistência média dos paraquedas para cada fornecedor de matéria-prima.
# Em ordem decrescente de resistência estão os fornecedores 2 (com média = 23,90), 3, 4 e 
#  1 (este último com resistência = 18,97).

#O procedimento de Tukey Kramer vai indicar entre quais fornecedores a resistência média pode ser 
#considerada diferente. Observe que, ao nível de significância de 5%, 
#podemos rejeitar a hipótese de que a resistência média dos fornecedores 2 e 1 e
#dos fornecedores 3 e 1 sejam iguais, ou seja, há evidência da diferença 
#entre as médias desses fornecedores (p-value = 0,0019926 e 0,0444506, respectivamente)
