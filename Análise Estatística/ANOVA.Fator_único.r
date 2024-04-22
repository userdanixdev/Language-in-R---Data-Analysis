# ANOVA de fator único:
tipo = c(rep('t1',7),rep('t2',7),rep('t3',7),rep('t4',7))
tipo = factor(tipo)
pLucro = c(20,16,20,22,24,25,23,21,23,20,26,17,27,24,12,30,14,25,18,23,28,29,39,39,27,33,21,26)
lucratividade = data.frame(tipo,pLucro)

library('Rcmdr')

# Verificação se não existe nenhum outlier:
# De acordo com o gráfico boxplot puxado através do 'Rcmdr' não há valores discrepantes.
# Portanto os dados não precisam ser tratados;
# Lembrando que os campos 't' são empresas.

# PREMISSAS:
# Aleatoriedade e indepedência na seleção da amostra
# Normalidade = Shapiro Test (H0 : Distribuição Normal)
  # H0 = Os dados numéricos respeitados os moldes da distribuição normal?
        # Todos os valores de P-values em relação as empresas são maiores que 10%.
        # Não temos evidência para rejeitar hipótese nula.

Shapiro-Wilk normality test
p-values adjusted by the Holm method:
  unadjusted adjusted
t1 0.65424    1       
t2 0.92452    1       
t3 0.63943    1       
t4 0.54010    1 

# PREMISSA:
    # Igualdade de variâncias: HOMOGEINIDADE = TESTE DE LEVENE(H0= Igualdade de variância)
    # P- value maior que 10% então não há evidência estatística para rejeitar a hipótese que as
          # variancias são iguais.
    # portanto as variancias são iguais.

Levene's Test for Homogeneity of Variance (center = "median")
      Df F value Pr(>F)
group  3  2.1205 0.1241

# Realizadas as vistorias iremos fazer o teste ANOVA para verificar se há diferença:
    # com 1 fator: Lucratividade

# PROBLEMA DE PESQUISA:
    # Será que o percentual médio de lucro difere entre os tipos de empresas?
    Hipótese NUla: O percentual médio de lucro pode ser igual
    Hipotese Alternativa: Difere em pelo menos dois tipos de empresas.
    
# Nível de confiança de 95% com nível de significância de 5%
  # SENDO ASSIM REJEITAMOS A HIPOTESE NULA SE P-VALUE FOR<5%
  
summary(AnovaModel.1)
            Df Sum Sq Mean Sq F value  Pr(>F)   
tipo         3  409.1  136.38   4.724 0.00995 **  <------ < que 5%


# O p-value está abaixo de 1% o que nos da a evidência de rejeitarmos a H0 = hipótese nula
    # e que há diferença entre as médias de lucro em pelo menos 2 empresas.
  
    
