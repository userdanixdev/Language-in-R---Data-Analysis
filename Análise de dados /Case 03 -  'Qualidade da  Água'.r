ANÁLISE DE COMPONENTES PRINCIPAIS:
		- A análise de componentes principais é uma técnica de estatística multivariada que consiste em transformar um conjunto de variáveis originais
em outro conjunto de variáveis de mesma dimensão denominadas de componentes principais. O objetivo é encontrar um meio de condensar a informação contida
em várias variáveis originais em um conjunto menor de variáveis estatísticas ( FATORES ) com perda mínima de informação.
		- A análise de componentes principais reduz a dimensionalidade de um dado multivariado para dois ou três componentes principais, que podem
ser visualizados graficamente. É útil quando as variáveis dentro do conjunto de dados são altamente correlacionadas. Correlação indica que há redundância nos
dados. Devido a isso, pode-se reduzir as variáveis originais em um número menor de novas variáveis. É uma abordagem estatísticas que pode ser usada para 
analisar inter-relações entre um grande número de variáveis e explicar essas variáveis em termos de suas dimensões inerentes comuns (fatores).
		- Na análise de componentes principais (ACP-PCA), os dados são representados no sistema de coordenadas X-Y. A redução de dimensão é obtida identificando
as direções principais. Ela assume que as direções com as maiores variações( dados elevados ) são as mais importantes.
		- Existe uma biblioteca na linguagem em R para essa análise multivariada.

Conceito do Professor Leandro Souto da Universidade de Sergipe:
	Estatística Multivariada: Análise Multivariada: 	Análise de componentes principais:

Como analisar vários fatores juntos?  
Para que serve?
Peso, Ph, Umidade, Temperatura, Altura da planta... ( variáveis quantitativas...)
 Essa pergunta dentro de um gráfico fica um gráfica fica difícil de interpretar, com várias variáveis juntas.
	A PCA reduz um grande número de variáveis criando novas variáveis, chamadas EIXOS PRINCIPAIS - Princípio da álgebra linear - (X -Y)
		- Número de eixos = número de variáveis  que em geral usamos os dados mais relevantes, os eixos principais, E1 e E2.

Qual situação?
A qualidade da água é diferente dependendo do local do rio? 
	- Nascente
	- área rural
	- área urbana
A redução dos CPA é criar novas variáveis ( eixos principais ) e ordenando os pontos em um gráfico bi-dimensional ( 2D )
Transformação de dados:
	- Cada variável possuem escalas e elementos diferentes, dependendo do contexto do estudo.
	- Portanto é necessário transformar os dados:
			Na tabela inserida, dependendo do software a ser utilizado, calcular o desvio padrão e a média dos dados, independente da escala.
			Logo, as diferentes variáveis devem ter o mesmo 'peso', valores co-relacionados, independente da escala ou elemento.
			A fórmula para calcular esses dados e deixarem eles correlacionados é:
					--- z = escore bruto - média/ desvio padrão ---
			Sendo assim, a tabela inserida é transformada em outra tabela com os valores transformados e a diferença entre variáveis cai bastante,
			ou seja, bem correlacionada. A média da nova tabela deve estar ZERADA e o desvio padrão deve ser 1.
			Análise exploratória:
No contexto abordado, foram definidos 4 componentes principais.( na tabela origem, existem 4 variaveis ambientais. 
Os dois primeiros eixos, compreendem a quase 90%. Para cada eixo, os maiores valores indicam a variavel mais representiva.
Eixo 1: ficaram o PH, Nitrato e Material ORgânico.
Eixo 2: Oxigênio ( Distanciou mais do que os outros elementos, sendo assm, não são representativos. )

Uso da linguagem em R do PCA para o contexto abordado do Professor Carvalho Ribeiro:
		
	Chamamento de pacotes a serem usados na análise:
		- library(xlsx)		-  # Para importar o arquivo
	-  	- library(FactormineR)	-- # Para fazer a análise PCA
		- library(factoextra)	-- # Podemos fazer a análise PCA também, mas o uso é para plotar os gráficos com o pacote.
	## Importar os dados:
# Criar uma variável para os dados que foram importados do arquivo xlsx.
	qualidade_agua <- read.slsx('')
# Visualizar os dados:
	view(qualidade_agua)
# Remover qualquer dado nulo ou faltante presente nos dados:
	qualidade_agua < - na.omit(qualidade_agua)

#Criar subconjunto de indivíduos ativos ( linhas ) e variáveis ativas (colunas ) para a análise:
# Porém, antes de chamar a função, selecionar as colunas e linhas relevantes para a análise:
# Sendo assim, iremos reduzir a tabela inserida, removendo a coluna manualmente, pois trata-se de um dado categórico, irrelevante para a análise.
## A coluna da tabela chamada 'local' não será feita análise alguma: linha 1 até 12 [1:12] e coluna 2 até a 5 [2:5]
qualidade_agua_active <- qualidade_agua[1:12,2:5]

# Visualizar os dados novamente para verificar as atualizações:
view(qualidade_agua.active)
head(qualidade_agua.active[,1:4],3)   # Opcional, para verificar somente os dados relevantes: ',[1:4]' = Selecionar as colunas e o ',3' para mostrar as linhas filtradas.

# O FactoMineR já fez a padronização automaticamente não sendo necessário o uso da escala:
qualidade_agua.active <- scale(qualidade_agua.active)
scale(qualidade_agua_active)
           ph          n       oxig    m_organ
  -0.6321607 -0.6524867  0.1618347 -0.6122789
  -1.4657791 -0.3120589  0.1618347 -0.8182792
  -0.6321607 -0.6524867  1.1328430 -0.7496124
  -1.4657791 -0.3120589  2.1038513 -0.6809456
   0.4515433 -0.6524867  0.1618347 -0.8182792
   0.2014578 -0.9929146 -0.8091736 -0.6809456
  -0.2153514 -0.3120589  0.1618347 -0.6122789
  -0.6321607 -0.6524867 -1.7801819 -0.4062785
   1.0350762  2.4113641 -0.8091736  1.2417244
   1.4518855  1.3900805  0.1618347  1.3103912
   1.2851618  0.3687969  0.1618347  1.3790580
   0.6182670  0.3687969 -0.8091736  1.4477248
attr(,"scaled:center")
           ph             n          oxig       m_organ 
 3.608225e-16  2.498002e-16 -3.238150e-17  8.789266e-17 
attr(,"scaled:scale")
     ph       n    oxig m_organ 
      1       1       1       1 								

# Gerar PCA ( Principal Components Analysis )
resposta.pcs <-PCA(qualidade_agua.active, graph = FALSE)
**Results for the Principal Component Analysis (PCA)**
The analysis was performed on 12 individuals, described by 4 variables
*The results are available in the following objects:

   name               description                          
1  "$eig"             "eigenvalues"                        
2  "$var"             "results for the variables"          
3  "$var$coord"       "coord. for the variables"           
4  "$var$cor"         "correlations variables - dimensions"
5  "$var$cos2"        "cos2 for the variables"             
6  "$var$contrib"     "contributions of the variables"     
7  "$ind"             "results for the individuals"        
8  "$ind$coord"       "coord. for the individuals"         
9  "$ind$cos2"        "cos2 for the individuals"           
10 "$ind$contrib"     "contributions of the individuals"   
11 "$call"            "summary statistics"                 
12 "$call$centre"     "mean of the variables"              
13 "$call$ecart.type" "standard error of the variables"    
14 "$call$row.w"      "weights for the individuals"        
15 "$call$col.w"      "weights for the variables"     								

# Extrair a proporção de variância dos valores dos componentes principais ( alto valores )
# 'get_eigenvalue' extraia e visualize os autovalores/variâncias de dimensões.

eig.val <- get_eigenvalue(resposta.pca)
eig.val   
eigenvalue variance.percent cumulative.variance.percent
Dim.1  2.6312084        65.780209                    65.78021
Dim.2  0.9033544        22.583860                    88.36407
Dim.3  0.3295158         8.237895                    96.60196
Dim.4  0.1359215         3.398037                   100.00000
# Plotar no gráfico mostrando a proporção de variância de cada variável:
#  fviz_eig (ou fviz_eigenvalue): extraia e visualize os autovalores/variâncias de dimensões.
## Plotar o gráfico do PCA com resultados individuais e com resultados de variáveis:
fviz_pca_var(resposta.pca, col.var = 'blue')
fviz_pca_ind(resposta.pca, col.var = "blue")
						

fviz_eig(resposta.pca, addlabels = TRUE, ylim = c(0,90))		# Parâmetros para colocar no gráfico

# Irá mostrar no gráfico o acumulativo da variância em percentual dos eixos 1,2,3,4.

# Extrair os resultados das variáveis do PCA para plotar no gráfico:
#Extraindo de dados de saídas e análise de redução de dimensão:
#get_pca: extraia todos os resultados (coordenadas, cosseno ao #quadrado, contribuições) para os indivíduos/variáveis ativos a partir 
# dos resultados da Análise de Componentes Principais (PCA).

var <- get_pca_var(resposta.pca)
ind <- get_pca_ind(resposta.pca) 

## Plotar o gráfico do PCA:
fviz_pca_var(resposta.pca, col.var = 'blue')

## Criar um grupo cluster:
grupo <- as.factor(qualidade_agua[,1])    # Outra variável de agrupamento.

# Plotar novamente usando o gráfico Biplot:
fviz_pca_biplot(res.pca, habillage = grupo, title = 'Gráfico PCA Qualidade da Água')

##		FIM

Outros tipos de gráficos:
# Checar a qualidade da representação com Cos2 e gráfico
var$cos2

library(corrplot)
corrplot(var$cos2, is.corr = F)

#Visualização dados de saídas e análise de redução de dimensão, existem outros gráficos semelhantes ao fviz para plotar:

fviz_pca_var   # Corresponde as variáveis
fviz_pca_ind	# Corresponde individual
fviz_pca_biplot   # Que é a união dos dois gráficos acima.
