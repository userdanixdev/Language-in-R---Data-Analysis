# Inferência Estatística:
# Teste QUI Quadrado para uma entrada:


# Um estudo busca investigar se há diferença na motivação de clientes que utilizam 
#cupons de desconto recebidos pela internet em comparação com aqueles que recebem cupons
# pelos correios. Foram coletados 440 dados com as seguintes variáveis qualitativas:

# Nome da variável:
  # TIPO = Tipo de usuário de cupons - CORREIOS OU INTERNET
  # SEXO = Masculono/Feminino
  # EDUC = Nível de escolaridade - SG=ENSINO MÉDIO / TEC= Técnico,GRAD=Graduação / PG=Pós-Graduação
  # TRAB = Situação de trabalho - EMP=Tempo Integral / PARC = Tempo Parcial / DESC - Sem trabalho / APOOS = Aposentado
  # SAT = Satisfação com os cupons - SIM- SATISFEITO / Não = Não SATISFEITO / TALVEZ - Indiferente

library(readxl)
cupomDesconto <- read_excel("C:/Users/jessi/Downloads/cupomDesconto.xlsx")

# Quais as proporções  de usuários apenas  de correios, apenas de internet  ou de ambos
  # Essas proporções são estatisticamente diferentes?
    # Hipótese NUla = H0 =
        # p(ambos)=1/3=0,33
        # p(correios)=1/3=0,33
        # p(internet)=1/3=0,33
  
# Hipótese Alternativa = H1 = pelo menos duas proporções diferem da expectativa.

library(Rcmdr)
# Estatísticas - Resumos - Distribuição de frequência

# Resposta do console:

counts:
  TIPO
Ambos Correios Internet 
135      262       43 

percentages:
  TIPO
Ambos Correios Internet 
30.68    59.55     9.77 

Chi-squared test for given probabilities

data:  .Table
X-squared = 164.9, df = 2, p-value < 2.2e-16

# Valor p-value menor que 1% = p-value < 2.2e-16 trazendo aqui a evidência de rejeitar a hipótese nula.
  # Ou seja, pelo menos 2 usuários diferem da expectativa de que seria 33% dos usuários de cupons.
      # LEMBRANDO QUE FOI APLICADO A UMA VARIÁVEL MULTINOMIAL (TIPO DE USUARIOS DE CUPONS)
          
