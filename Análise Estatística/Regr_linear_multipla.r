# No estudo sobre autonomia dos veículos, percebemos uma relação entre o número de cilindros dos caros e a distância
# que conseguem percorrer com um galão de combustível. Vamos acrescentar a variável tipo de TRANSMISSÃO (am).

# O modelo ficará assim:
  mpg = β₀+β₁am+β₂cyl + erro

# Para testar as hipóteses temos:
    # Hipótese 0 :: NULA :: H0 :: não há relação entre as variáveis am e mpg
    # Hipótese 1 :: Alternativa :: H1 :: as variáveis am e mpg estão relacionadas.


# Aplicando a fórmula no R:
lm(formula=mpg~am+cyl,data=mtcars)
# Resultado no console:
Coefficients:
(Intercept)           am          cyl  
     34.522        2.567       -2.501  

Linear_model = lm(formula=mpg~am+cyl,data=mtcars)
summary(Linear_model)
# Resultado no console:

Residuals:
    Min      1Q  Median      3Q     Max 
-5.6856 -1.7172 -0.2657  1.8838  6.8144 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  34.5224     2.6032  13.262 7.69e-14 ***
am            2.5670     1.2914   1.988   0.0564 .  
cyl          -2.5010     0.3608  -6.931 1.28e-07 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 3.059 on 29 degrees of freedom
Multiple R-squared:  0.759,	Adjusted R-squared:  0.7424 
F-statistic: 45.67 on 2 and 29 DF,  p-value: 1.094e-09

# Número 0 é para representar transmissão automática
# Numero 1 é para representar transmissão manual

# p-value: 1.094e-09 é estatísticamente útil para explicar as alterações na variável 'mpg'
# Multiple R-squared : 76% explica as alterações em autonomia.
# p-value da variável 'cyl' estão confirmando 1.28e-07
# p-value da variável 'am' mostra que podemos rejeitar a hipótese nula ao nível de significância de 10%.
# 'am' possui inclinação positiva. Os carros percorrem mais milhas com os tipos de transmissão do tipo 0. Ou seja, 2,5 milhas a mais por galão.


# Modelo determinístico:

mpg = 34,5224 + 2,567am - 2,5010cyl

# H0 :: Hipótese Nula = A autonomia do veículo (mpg) não possui relação com o peso
# H1 :: Hipótese Alternativa :: Há evidência da relação entre a autonomia do veículo e seu peso

Linear_model_1 = lm(formula=mpg~am+cyl+wt,data=mtcars)

# Resultado no console:
Coefficients:
(Intercept)           am          cyl           wt  
    39.4179       0.1765      -1.5102      -3.1251  

summary(Linear_model_1)
# RESULTDO NO CONSOLE:
Residuals:
    Min      1Q  Median      3Q     Max 
-4.1735 -1.5340 -0.5386  1.5864  6.0812 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  39.4179     2.6415  14.923 7.42e-15 ***
am            0.1765     1.3045   0.135  0.89334    
cyl          -1.5102     0.4223  -3.576  0.00129 ** 
wt           -3.1251     0.9109  -3.431  0.00189 ** 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.612 on 28 degrees of freedom
Multiple R-squared:  0.8303,	Adjusted R-squared:  0.8122 
F-statistic: 45.68 on 3 and 28 DF,  p-value: 6.51e-11

# O P-value de 6.51e-11 mostra estatisticamente útil para explicar as alterações na autonomia do carro por milhas por galão.
# Multiple R-squared = 83% aumentou em comparação ao teste anterior com o incremento variável 'peso'.
# Como a variável 'weight'::'peso' a inclinação é negativa : -3.1251 significa que autonomia diminui quando o peso aumenta.
# Nesse teste, a variável 'am' independente não apresenta mais relação com a variável dependente 'mpg' :: p-value :: 0.89 

# Essas duas variáveis independentes podem ser fortemente correlacionadas com a variável dependente, colocadas no mesmo modelo.
# esse fenômeno chama-se MULTICOLINEARIDADE:

# PRESSUPOSTO DE MULTICOLINEARIDADE:
# Matriz de correlação:
    # lembrando que mais próximo de 1 , fortemente correlacionada.
cor(mtcars[,c('am','cyl','mpg','wt')],use='complete')

> cor(mtcars[,c('am','cyl','mpg','wt')],use='complete')
            am        cyl        mpg         wt
am   1.0000000 -0.5226070  0.5998324 -0.6924953
cyl -0.5226070  1.0000000 -0.8521620  0.7824958
mpg  0.5998324 -0.8521620  1.0000000 -0.8676594
wt  -0.6924953  0.7824958 -0.8676594  1.0000000

# Olhando par ao teste pela 'mpg' a variável de interesse:
    # Forte correlação com numero de cilindros e peso do veículo.
    # A variável peso estão fortemente correlacionadas com o numero de cilindros.
# Caso ocorra esses fenômenos é necessário transformar os dados de outra forma.
# por exemplo, transformar em logaritimo os raiz quadrada
# Os pressupostos de autocorrelação e linearidade precisam ser verificados.








