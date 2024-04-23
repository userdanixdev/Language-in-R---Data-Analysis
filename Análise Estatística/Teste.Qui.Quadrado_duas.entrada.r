# Teste Qui-quadrado para duas entradas independentes:

library(readxl)
cupomDesconto <- read_excel("C:/Users/jessi/Downloads/cupomDesconto.xlsx")

# Um estudo busca investigar se há diferença na motivação de clientes que utilizam 
#cupons de desconto recebidos pela internet em comparação com aqueles que recebem cupons
# pelos correios. Foram coletados 440 dados com as seguintes variáveis qualitativas:

# Nome da variável:
# TIPO = Tipo de usuário de cupons - CORREIOS OU INTERNET
# SEXO = Masculono/Feminino
# EDUC = Nível de escolaridade - SG=ENSINO MÉDIO / TEC= Técnico,GRAD=Graduação / PG=Pós-Graduação
# TRAB = Situação de trabalho - EMP=Tempo Integral / PARC = Tempo Parcial / DESC - Sem trabalho / APOOS = Aposentado
# SAT = Satisfação com os cupons - SIM- SATISFEITO / Não = Não SATISFEITO / TALVEZ - Indiferente

# No estudo sobre cupons de desconto, pode ser desejável descobrir se há diferenças nas
# características dos clientes(sexo,educação,situação de emprego e satisfação) em relação
# aos três tipos de usuários de cupons(que usam a internet, que usam os Correios ou que usam ambos)
    # Uma abordagem é determinar se cada uma das quatro variáveis de característica está
      # relacionada com o tipo de usuário de cupom:
        # Hipótese Nula: as duas variáveis categóricas são independentes
        # Hipótese Alternativa: As duas variáveis categóricas são dependentes

# Lembrando que as variáveis dependentes são as variáveis de interesse do estudo: 
      # Os usuários com cupons de desconto
  # As variáveis independentes são aquelas que procuramos identificar algum efeito sobre as variáveis dependentes
      # As caracteristicas dos clientes são exemplos de variaveis independentes.

library(Rcmdr)

# Estatistica ---> Tabelas de Contigência ---> Tabelas de duas entradas:
      # *** Fazer isso com cada coluna independente:

                              # Variável GRAU DE ESCOLARIDADE:

Frequency table:
  TIPO
EDUC   Ambos Correios Internet
GRAD    38       85        9
PG      62       96       20
SG      19       34        7
TEC     16       47        7

Pearson's Chi-squared test

data:  .Table
X-squared = 6.587, df = 6, p-value = 0.3607

    # Com um p-value de 0.3607 não há possibilidade de descartar a hipótese nula
        # Ou seja, os tipos de usuários de cupons não dependem do nível de escolaridade.
        
                                    # VARIÁVEL SATISFAÇÃO:

Frequency table:
        TIPO
SAT      Ambos Correios Internet
  Nao        3       28        4
  Sim      123      172       30
  Talvez     9       62        9

	Pearson's Chi-squared test

data:  .Table
X-squared = 30.418, df = 4, p-value = 0.000004024

# o RESULTADO DE P-VALUE É MENOR QUE 1% = 0.0000014024, MOSTRANDO QUE HÁ EVIDÊNCIA DE REJEITAR
# A HIPÓTESE NULA. 
# OU SEJA HÁ EVIDÊNCIA DE DEPENDENCIA ENTRE AS VARIAVEIS SATISFAÇÃO E TIPO DE USUÁRIO DE CUPOM.


                          # Variável sexo (independente)

Frequency table:
  TIPO
SEXO        Ambos Correios Internet
Feminino    104      178       36
Masculino    31       84        7

Pearson's Chi-squared test

data:  .Table
X-squared = 6.7971, df = 2, p-value = 0.03342

# Com p-value de 0.03342 não há possibilidade de descartar a hipótese nula ou seja:
    # Os tipos de usuários de cupons não dependem do sexo, seja masculino ou feminino.
    
# Agora se o nível de significância for de 5% e com nível de confiança de 95%:
      # os usuários de cupons irá depender se o sexo for masc/fem. 
    
                            ##    Variável SITUAÇÃO DE TRABALHO:      ##
                            
Frequency table:
      TIPO
TRAB   Ambos Correios Internet
  APOS    15       52        3
  DES     17       31        3
  EMP     90      148       29
  PARC    13       31        8

	Pearson's Chi-squared test

data:  .Table
X-squared = 11.687, df = 6, p-value = 0.06933     

# Com p-value de 0.06933 não há possibilidade de descartar a hipótese nula, ou seja,
    # Os tipos de usuários de cupons não dependem da situação de trabalho.

# Agora se o nível de significância for de 10% e com nível de confiança de 90%:
# os usuários de cupons irá depender da situação trabalhista.


