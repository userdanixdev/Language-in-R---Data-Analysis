# Atividade de Regressão Linear Múltipla:

Execute uma regressão linear múltipla no R para o seguinte modelo geral:

ACUR =  β0 + β1 logVM + β2 NUM + β3 DP + β4 DA + β5 PTB + β6 PREJU + ε 

Ou seja, a variável ACUR deve ser indicada como variável dependente e as demais, como variáveis independentes. Com o resultado do teste na tela,

Selecione as variáveis independentes que possuem relação com a ACUR ao nível de significância de 1%:

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept) -1.2314227  0.1932638  -6.372 2.82e-10 ***
logVM        0.1847773  0.0609587   3.031   0.0025 ** 
NUM          0.0121358  0.0095672   1.268   0.2049    
DP          -0.1852397  0.0225354  -8.220 6.10e-16 ***
DA          -0.0007663  0.0021677  -0.353   0.7238    
PTB          0.0121323  0.0131961   0.919   0.3581    
PREJU       -1.7067246  0.1188761 -14.357  < 2e-16 ***

# As respostas são as variáveis:
    # logVM, DP, PREJU


Selecione as variáveis significantes que possuem inclinação negativa em relação a ACUR, ou seja, quando o valor da variável aumenta, a acurácia diminui:

lm(formula = ACUR ~ logVM + NUM + DP + DA + PTB + PREJU, data = analistasMC)

Coefficients:
(Intercept)        logVM          NUM           DP           DA          PTB        PREJU  
 -1.2314227    0.1847773    0.0121358   -0.1852397   -0.0007663    0.0121323   -1.7067246  


# Respostas para a questão:
      # DP, DA, PREJU


O R2 (Multiple R-squared) mostra que o modelo de regressão linear explica pouco menos de 27% das variações que ocorrem na variável ACUR

# Resposta para a questão é FALSA. A resposta correta seria pouco mais de 27% :
      # Multiple R-squared:  0.2777

O modelo de regressão se mostra estatísticamente útil para explicar as variações na variável ACUR, uma vez que p-value é menor que 1%.
    # Correto ::  p-value: < 2.2e-16

