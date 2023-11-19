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

# Gerar PCA ( Principal Components Analysis )
resposta.pcs <-PCA(qualidade_agua.active, graph = FALSE)

# Extrair a proporção de variância dos valores dos componentes principais ( alto valores )
# 'get_eigenvalue' extraia e visualize os autovalores/variâncias de dimensões.

eig.val <- get_eigenvalue(resposta.pca)
eig.val   

# Plotar no gráfico mostrando a proporção de variância de cada variável:
#  fviz_eig (ou fviz_eigenvalue): extraia e visualize os autovalores/variâncias de dimensões.

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
