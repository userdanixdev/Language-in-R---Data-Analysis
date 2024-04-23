# Teste Qui-quadrado para amostras relacionadas:

# Suponha que um blind test seja realizado com 600 pessoas, para testar duas marcas de
# bebidas semelhantes: COCA e GUARA. Antes de fazer o teste, as pessoas informavam sua
# preferência. Depois do teste, indicavam qual tinham preferido. As amostras são relacionadas
# pois os dados foram coletados repetidas vezes da mesma amostra.

# Os resultados indicaram que:
  # 246 pessoas responderam Guara antes do teste e escolheram Guara depois do teste.
  # 36 responderam Guara antes do teste e escolheram COCA depois do teste.
  # 12 pessoas responderam COCA antes do teste e escolheram Guara depois do teste.
  # 306 pessoas responderam COca antes do teste e escolheram COCA depois do teste.

# O teste deseja investigar se houve alguma mudança significativa na preferência dos 
  # consumidores que participaram.
# BASE DE DADOS: BLIND TEST
# ATENÇÃO: a mesma pessoa participou do teste: antes e depois

library(readxl)
blindTest <- read_excel("C:/Users/jessi/Downloads/blindTest.xlsx")

# 1°passo: Criar uma tabela de frequência com a função : table
tabela = table(blindTest$Antes,blindTest$Depois)
tabela # <- O resultado abaixo é a tabela de frequência
       Coca Guara
Coca   306    12
Guara   36   246

# Teste de McNemar para amostras relacionadas :
    # Para verificar se houve ou não mudança na opinião dos consumidores após a degustação as cegas
  
# Hipótese nula: H0 : A opinião quanto a marca preferida é a mesma, antes e depois da degustação.
# Hipótese Alternativa :: H1 :: A opinião muda quando comparado antes sem degustar e depois com a degustação.

# O teste de MCNemar não tem no Rcmdr,sendo assim:
mcnemar.test(tabela)
# Resulado do teste no console:
McNemar's Chi-squared test with continuity correction

data:  tabela
McNemar's chi-squared = 11.021, df = 1, p-value = 0.0009009

# Com um p-value de 0.0009009 menor que 1%, sendo uma evidência de rejeitar a hipótese nula
  # Ou seja, há evidência com nível de significância de 1% que as opinião difere entre o antes e o depois da marca preferida.
