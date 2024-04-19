# Inferência sobre a proporção da população
# Inferência QUALITATIVA:

vota = c("Sim","Nao","Nao","Sim","Nao","Sim",
         "Sim","Nao","Sim","Sim","Nao","Sim",
         "Sim","Sim","Nao","Sim","Nao","Sim",
         "Sim","Nao","Sim","Sim","Sim","Nao",
         "Nao","Sim","Sim","Sim","Nao","Sim")
eleicoes=data.frame(vota)

# Hipóteses
# H0 (hipótese nula): a proporcao de pessoas da população que não escolheria o 
# candidato poderia ser maior ou igual que 50%

# H1 (hipótese alternativa): a proporcao de pessoas da população que não escolheria 
# o candidato é menor que 50%

# Nível de significância = 1 - nível de confiança (90, 95 ou 99%)

# p-value < nível de significância, rejeita a hipótese nula
# p-value > nível de significância, não rejeita a hipótese 

# Ao nível de significância de 10%, a hipótese nula poderia ser rejeitada e a hipótese alternativa será considerada.
# Ao nível de significância de 5% , a hipótese nula não poderá ser rejeitada.

X-squared = 2.1333, df = 1, p-value = 0.07206  <---
alternative hypothesis: true p is less than 0.5
95 percent confidence interval:
 0.0000000 0.5167364
----------//---------------//------------------//----------------//





