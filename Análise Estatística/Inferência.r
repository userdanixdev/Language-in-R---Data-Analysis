# Criando a base de dados
tmcBr=c(29,31,35,39,39,42,44)
calcados=data.frame(tmcBr)

# Hipótese:
# H0  = Hipótese NULA = O tamanho médio do calçado da população é = a 40
# H1 = Hipotese ALTERNATIVA = Tamanho médio do calçado diferente de 40

library ("Rcmdr")
# DENTRO DO CONSOLE DO PACOTE, IMPORTAR OS DADOS 'caldados', selecionar estatistica - Média -TESTE t para uma amostra
Resultado:
Rcmdr>  with(calcados, (t.test(tmcBr, alternative = "two.sided", mu = 40, 
Rcmdr+    conf.level = .95)))

	One Sample t-test

data:  tmcBr
t = -1.4256, df = 6, p-value = 0.2039
alternative hypothesis: true mean is not equal to 40
95 percent confidence interval:
 31.85068 42.14932
sample estimates:
mean of x 
       37 


# p-value < nível de significância, rejeita a hipótese nula
# p-value > nível de significância, não rejeita a hipótese nula

# Ao nível de significância de 5% (ou ao nível de confiança de 95%), 
# não há evidência estatística para rejeitar a hipótese nula.
--------------//--------------------//---------------------//---------------------//---------
