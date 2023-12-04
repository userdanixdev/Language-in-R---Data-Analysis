** ATENÇÃO! Não foi realizado nenhum tratamento de dados no Excel ou em outra ferramentas como PowerBI.
+++++++ Os dados estão brutos e precisam ser tratados antes de utilizarmos o RStudio. ++++


Análise de dados em R - Na Prática:

	Definição do problema:
Reduzir gastos com os custos das viajens a serviço no setor público.
Qual o valor gasto por órgão?
Qual o valor gasto por cidade?
Qual é a quantidade de viajens por mês?
Precisamos obter esses dados !!

OBTENDO OS DADOS:
 - Portal das transparência para obter os dados ( CGU )
	https://portaldatransparencia.gov.br/

Portal de dados - Em viajens - Terá o ano a escolher das viajens

 Carregando os dados obtidos através do site:
 # Declarar uma variável inicialmente:
data <- read.csv(						# a função 'read()' necessita de parâmetros: 'file' endereço local do diretório para carregar
	file = "C:\Users\Daniel\Documents\2019_20230915_Viagens\2019_Viagem.csv",
	sep = ';',						# separador, o csv é separado por ';' e não por ',' em R
	dec = ','		# separador decimal 'dec' é o parâmetro para separar as casas decimais por ','-vírgula, ok?
	)				Sendo assim, é possível trabalhar com os dados organizados no padrão na linguagem em R
Outro modo de carregar o banco de dados abaixo:

data <- read.csv(file.choose(), 'incluir os parâmetros')

Terceiro modo :

data <- read.csv2("C:/Users/Daniel/Documents/2019_20230915_Viagens/2019_Viagem.csv", 
                  header=TRUE,
                  check.names=FALSE,
                  sep = ";",
                  dec = ',',
                  fileEncoding = "latin1")



# Descobrir o encoding de um banco:
string # Nome do pacote
string::stri_enc_detect("BANCO DE DADOS 5.csv")

# Leitura, carga de um banco de dados através da tecla 'tab' com a barra em seguida de tab depois da função read

# Com a função do readr
dados <- readr::read_csv2("Banco de dados 5.csv",
			locale = readr::locale(enconding = 'latin1'))

# Para mais informações do banco de dados:

> install.packages('dplyr')
> library(dplyr)
> glimpse(data)
Rows: 844,665
Columns: 22
$ Identificador.do.processo.de.viagem <int> 15045825, 15100682, 15114708, 1516…
$ Número.da.Proposta..PCDP.           <chr> "Sem informação", "Sem informação"…
$ Situação                            <chr> "Realizada", "Realizada", "Realiza…
$ Viagem.Urgente                      <chr> "NÃO", "NÃO", "NÃO", "NÃO", "NÃO",…
$ Justificativa.Urgência.Viagem       <chr> "Sem informação", "Sem informação"…
$ Código.do.órgão.superior            <int> 26000, 26000, 26000, 26000, 26000,…
$ Nome.do.órgão.superior              <chr> "Ministério da Educação", "Ministé…
$ Código.órgão.solicitante            <int> 26291, 26291, 26291, 26291, 26291,…
$ Nome.órgão.solicitante              <chr> "Fundação Coordenação de Aperfeiço…
$ CPF.viajante                        <chr> "***.377.624-**", "***.831.975-**"…
$ Nome                                <chr> "MARINA FERREIRA KITAZONO ANTUNES"…
$ Cargo                               <chr> "", "", "PESQUISADOR EM GEOCIENCIA…
$ Função                              <chr> "-1", "-1", "-1", "-1", "-1", "-1"…
$ Descrição.Função                    <chr> "Não Informado", "Não Informado", …
$ Período...Data.de.início            <chr> "06/02/2019", "01/02/2019", "01/02…
$ Período...Data.de.fim               <chr> "07/02/2019", "02/02/2019", "01/02…
$ Destinos                            <chr> "Recife/PE", "Recife/PE", "São Pau…
$ Motivo                              <chr> "Regresso de bolsista CAPES do ext…
$ Valor.diárias                       <dbl> 0.00, 0.00, 0.00, 0.00, 0.00, 0.00…
$ Valor.passagens                     <dbl> 3406.33, 2925.83, 2760.02, 2875.92…
$ Valor.devolução                     <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
$ Valor.outros.gastos                 <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…

Mais valores com a função summary() abaixo:

> summary(data)
 Identificador.do.processo.de.viagem Número.da.Proposta..PCDP.
 Min.   :1.505e+07                   Length:844665            
 1st Qu.:1.602e+07                   Class :character         
 Median :1.629e+07                   Mode  :character         
 Mean   :2.097e+07                                            
 3rd Qu.:1.655e+07                                            
 Max.   :2.019e+09                                            
   Situação         Viagem.Urgente     Justificativa.Urgência.Viagem
 Length:844665      Length:844665      Length:844665                
 Class :character   Class :character   Class :character             
 Mode  :character   Mode  :character   Mode  :character             
                                                                    
                                                                    
                                                                    
 Código.do.órgão.superior Nome.do.órgão.superior Código.órgão.solicitante
 Min.   :   -1            Length:844665          Min.   :   -1           
 1st Qu.:26000            Class :character       1st Qu.:26000           
 Median :30000            Mode  :character       Median :26436           
 Mean   :33085                                   Mean   :31000           
 3rd Qu.:44000                                   3rd Qu.:37202           
 Max.   :84000                                   Max.   :91214           
 Nome.órgão.solicitante CPF.viajante           Nome          
 Length:844665          Length:844665      Length:844665     
 Class :character       Class :character   Class :character  
 Mode  :character       Mode  :character   Mode  :character  
                                                             
                                                             
                                                             
    Cargo              Função          Descrição.Função  
 Length:844665      Length:844665      Length:844665     
 Class :character   Class :character   Class :character  
 Mode  :character   Mode  :character   Mode  :character  
                                                         
                                                         
                                                         
 Período...Data.de.início Período...Data.de.fim   Destinos        
 Length:844665            Length:844665         Length:844665     
 Class :character         Class :character      Class :character  
 Mode  :character         Mode  :character      Mode  :character  
                                                                  
                                                                  
                                                                  
    Motivo          Valor.diárias      Valor.passagens    Valor.devolução   
 Length:844665      Min.   :     0.0   Min.   :     0.0   Min.   :    0.00  
 Class :character   1st Qu.:    88.5   1st Qu.:     0.0   1st Qu.:    0.00  
 Mode  :character   Median :   431.3   Median :     0.0   Median :    0.00  
                    Mean   :   960.1   Mean   :   592.8   Mean   :   14.15  
                    3rd Qu.:   817.2   3rd Qu.:   899.4   3rd Qu.:    0.00  
                    Max.   :131223.7   Max.   :155531.4   Max.   :29546.00  
 Valor.outros.gastos
 Min.   :    0.000  
 1st Qu.:    0.000  
 Median :    0.000  
 Mean   :    9.774  
 3rd Qu.:    0.000  
 Max.   :12497.540  

TRANSFORMAÇÃO DOS DADOS OBTIDOS:
	# Converter para o tipo 'data' por que eles estão como caracteres:
$ Período...Data.de.início            <chr> "06/02/2019", "01/02/2019", "01/02…
$ Período...Data.de.fim               <chr> "07/02/2019", "02/02/2019", "01/02…

A função 'as.Date()' converte para tipo de estrutura de dados 'data':
# Nova coluna: 'data.inicio' - PARA ARMAZENAR O VALOR DA TRANSFORMAÇÃO - A COLUNA ORIGINAL NÃO É ALTERADA, SOMENTE A NOVA.
data$data.inicio <- as.Date(data$Período...Data.de.início, "%d/%m/%y")
Sendo assim, no console:
$ data.inicio                         <date> 2020-02-06, 2020-02-01, 2020-02-0…

# Continuação do campo 'data' vamos transformar em apenas mês e o ano: - para isso temos a função 'format()'
A sintaxe:
	- data$data.inicio.formatada <- format(data$data.inicio, "%Y-%m")  Obs: Atenção! Letra maiúscula para o formato da data ficar correto.

data$data.inicio.formatada  # Irá mostrar na tela todas as modificações da coluna 'data.inicio':

Um pouco do formato que ficou:

[99982] "20-03" "20-03" "20-03" "20-03" "20-03" "20-03" "20-03" "20-03" "20-03"
[99991] "20-01" "20-03" "20-03" "20-03" "20-03" "20-03" "20-03" "20-03" "20-03"

Exploração de dados ( análise de dados ):

hist(data$valor.passagens)  # Problema com gráficos de histograma. A classe da tabela está como 'data.frame'
				sendo assim, não abrirá o histograma até que converta em 'numerico'
Sendo assim, declarar uma variável para a nova tabela numérica:
data.num <- as.numeric(data)
*** Porém, ainda da error **  = 'list' object cannot be coerced to type 'double'
data.num <- as.numeric(as.character(data))
Sendo assim, o gráfico irá aparecer.

# Valores min, max, média---- da coluna específica:
summary(data$'Valor passagens')
 summary(data$'Valor passagens')
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
     0.0      0.0      0.0    592.8    899.4 155531.4 

# ATENÇÃO!!  Percebe-se que o valor máximo está muito distante da média 'mean' indicando a presença de 'outliers'. São valores que fogem da normalidade
fazendo com que o resultado da análise não reflita a realidade.

## Visualizando esse valores acima num gráfico 'boxplot':
boxplot(data$'Valor passagens')  # Certificando que realmente tem um 'outliers'

## Calculando o desvio padrão:
Necessário usar a função 'sd()' em seguida o nome do data.frame e coluna desejada.
sendo assim a sintaxe: sd(data$'Valor passagens')
Resultado no console:
sd(data$'Valor passagens')
[1] 1293.192
#  MAIS FUNÇÕES INTERESSANTES NA FASE DE EXPLORAÇÃO DE DADOS:
	PARA VERIFICAR SE EXISTEM CAMPOS DE VALORES NÃO PREENCHIDOS USA-SE A FUNÇÃO 'is.na()'
	
	Já a função 'colSums()' contabiliza a quantidade de campos não preenchidos por coluna.

Podemos usar as duas funções ao mesmo tempo, sendo assim a sintaxe:
	- colSums(is.na(data))
Resultado no console:
> colSums(is.na(data))
Identificador do processo de viagem           Número da Proposta (PCDP) 
                                  0                                   0 
                           Situação                      Viagem Urgente 
                                  0                                   0 
      Justificativa Urgência Viagem            Código do órgão superior 
                                  0                                   0 
             Nome do órgão superior            Código órgão solicitante 
                                  0                                   0 
             Nome órgão solicitante                        CPF viajante 
                                  0                                   0 
                               Nome                               Cargo 
                                  0                                   0 
                             Função                    Descrição Função 
                                  0                                   0 
           Período - Data de início               Período - Data de fim 
                                  0                                   0 
                           Destinos                              Motivo 
                                  0                                   0 
                      Valor diárias                     Valor passagens 
                                  0                                   0 
                    Valor devolução                 Valor outros gastos 
                                  0                                   0


Filtrando valores:
#Outro exemplo de histograma - filtrando valores

#Para esse exemplo serão utilizadas as funções filter e select
?dplyr::filter
?dplyr::select

# Apenas passagens entre 200 e 5000:
Segue sintaxe abaixo:   # declarar uma variável para tal fim:
	- passagens_filtro <- data %>%
		select('Valor passagens') %>%
		filter('Valor passagens' >= 200 & 'Valor passagens' <= 5000)
# Por fim, chamar a função do gráfico:
	passagens_filtro
	hist(passagens_filtro$'Valor passagens')


MAIS FUNÇÕES DE ANÁLISES DE DADOS:
	- str(data$Situação) ou a tabela inteira  'str(data)'

	# Para verificar a quantidade de ocorrências para cada classe, usamos a função 'table()'
		table(data$Situação)
	Resultado no console:
		Não realizada     Realizada 
                      19389        825276 

## Para obtermos o valor em percentual, aplicamos a função 'prop.table()' e multiplicamos por 100.
	Sendo assim:  prop.table(table(data$Situação))*100
Resultado no console:
	Não realizada     Realizada 
            2.295466     97.704534 

VISUALIZAÇÃO DOS RESULTADOS:
	# 1. Quais órgãos estão gastando mais com passagens aéreas?
Obs: Para isso devemos criar um data frame com os órgãos que mais gastam.

Carregar o módulo 'dplyr' chamar uma variável de p1:

p1 <- data %>%
	group_by('Nome do órgao superior') %>%
	summarise(n = sum('Valor passagens')) %>%  # para somar o valor gasto de passagens por órgão.
	arrange (desc(n) %>% 				# a função 'arrange' para ordenar, no caso, em decrescente
	top_n (15)		# função de filtra para somente até o 15° resultado da lista.
