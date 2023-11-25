#Análise de componentes principais:
 # Modelo de processamento de dados: Exploração de resultados.
    #& visualização.
#01. Qual o uso prático dos resultados de uma PCA?
 # - Os resultados na maioria são PC: 1, 2, 3 & 4. EU posso ter 50 variáveis e posso sintetizar para 3.
#- Performance do computador é melhor.
#- Ajuda na estabilidade de modelos lineares.
#- Explorar de dados, analisar fenômenos, criar hipóteses e compreender melhor os dados.
#- Redução de dimensionalidade, de variáveis.
#- Feature extraction é o BIG DATA transformar em SMALL DATA.
#- Os pacotes são bem semelhantes, os algoritmos. A mudança está na construção.
#cada um entrega um produto diferente.

#Sintaxes em R:
 # - %>% = e então ( pipe )  Uma continuação que pode cotinuar na linha de baixo. 
    #Sempre com o pipe ao lado.

#Bibliotecas a serem utilizadas:

library(janitor)    # Formatação de strings e textos
library(FactomineR) # Exploração multivariada de aálise de dados e Mineração de dados
library(tidymodels) # 
library(corrplot)   # Plotar gráficos
library(caret)      # Classificação e Regressão treinos
library(broon)      # Converter dados estatísticos em tidy tibbles
library(patchwork)  # Composição de gráficos
library(factoextra)
#dataset usado - 'iris' - 
  
data(iris)
iris <- iris %>% janitor::clean_names()  # Formatar os dados (janitor)

# pca usando prcomp:  Obs: pca explora dados quantitativos e não qualitativos 
#( variáveis categórica ) SOMENTE NUMÉRICAS, portanto, eliminar a coluna 'species'.
pca_iris_prc <- iris %>% select(-species) %>% prcomp( center = TRUE, scale = TRUE) 
# Antecipando os dados e deixando na mesma escala. 
# Isso impacta muito negativamente no resultado da PCA.
# O pca irá resultar os loads e desvio padrão = distância da média.
pca_iris_prc
#pca_iris_prc
#Standard deviations (1, .., p=4):
#  [1] 1.7083611 0.9560494 0.3830886 0.1439265
# A maior parte das variâncias estão nos componentes PC1 e PC2=1.70 e 0.95 ( Deviations)
# As variações PC03 e PC04 são irrelevantes estão bem abaixo.
#
#Rotation (n x k) = (4 x 4):
#  PC1         PC2        PC3        PC4
#sepal_length  0.5210659 -0.37741762  0.7195664  0.2612863
#sepal_width  -0.2693474 -0.92329566 -0.2443818 -0.1235096
#petal_length  0.5804131 -0.02449161 -0.1421264 -0.8014492
#petal_width   0.5648565 -0.06694199 -0.6342727  0.5235971
# obs: A maior parte das variâncias estão nos componentes PC1 e PC2=1.70 e 0.95 ( Deviations)
# As variações PC03 e PC04 são irrelevantes estão bem abaixo.
 pca_iris_prc$center # Dados correspondentes a médias apuradas:
#sepal_length  sepal_width petal_length  petal_width 
#5.843333     3.057333     3.758000     1.199333 
 summary(pca_iris_prc)
#Importance of components:
#  PC1    PC2     PC3     PC4
#Standard deviation     1.7084 0.9560 0.38309 0.14393
#Proportion of Variance 0.7296 0.2285 0.03669 0.00518
#Cumulative Proportion  0.7296 0.9581 0.99482 1.00000
 
pca_iris_prc$rotation   # Cargas
#PC1         PC2        PC3        PC4
##sepal_length  0.5210659 -0.37741762  0.7195664  0.2612863
#sepal_width  -0.2693474 -0.92329566 -0.2443818 -0.1235096
#petal_length  0.5804131 -0.02449161 -0.1421264 -0.8014492
#petal_width   0.5648565 -0.06694199 -0.6342727  0.5235971

pca_iris_prc$sdev   # Desvio padrão standart
pca_iris_prc$sdev
#[1] 1.7083611 0.9560494 0.3830886 0.1439265
pca_iris_prc$scale  # Escala padronizada:
#sepal_length  sepal_width petal_length  petal_width 
#0.8280661    0.4358663    1.7652982    0.7622377
pca_iris_prc$x
# Plot:
fviz_pca_var(pca_iris_prc)
# Esse gráfico vai mostrar coeficientes, coordenadas.
# Multiplicar a carga * o desvio padrão, teremos as coordenadas
# do gráfico corretas.
# Quanto mais longe sepals e petals da média, 'center' mais importante é a variação.
# Ambos são bem correlacionados ' sepals e petals'

# pca_results_prcomp:
# Pegar todas as variáveis que o PCA nos fornece
loadings_prc <- pca_iris_prc$rotation  
scores_prc <- pca_iris_prc$x
variance_prc <- (pca_iris_prc$sdev)^2 # Ocorre que o a variância é o desvio padrão ao quadrado.

# pca_factominer:

pca_iris_fcm <- iris %>% PCA(scale.unit = TRUE, quali.sup = 5, graph = TRUE)
# Os mesmo resultados em relação ao prcomp
# A escala é feita automática, mas é interessante colocar, qual.sup é a variável
# categórica.
# 
pcs_iris_fcm$eig
#0.8280661    0.4358663    1.7652982    0.7622377
# Os resultados dos altos valores (eig do factomine) são os mesmos de que:
(pca_iris_prc$sdev)^2
#0.8280661    0.4358663    1.7652982    0.7622377
# O pacote prcomp devemos pegar o desvio padrão elevado ao quadrado.

pca_iris_fcm$var$coord
# As COORDENADAS DIVIDAS PELO DESVIO PADRÃO (AUTOVALORES = EIGENVALUES) VÃO DAR 
# OS LOADS( CARGAS = ROTATION)  O gráfico quer mostrar a importância da variável 
# dentro do componetes, mesmo com escala diferente.
#Dim.1      Dim.2       Dim.3       Dim.4
#sepal_length  0.8901688 0.36082989 -0.27565767 -0.03760602
#sepal_width  -0.4601427 0.88271627  0.09361987  0.01777631
#petal_length  0.9915552 0.02341519  0.05444699  0.11534978
#petal_width   0.9649790 0.06399985  0.24298265 -0.07535950

pca_iris_fcm$var
# São medidas de qualidade dentro do mapa de fator.
#$coord
#Dim.1      Dim.2       Dim.3       Dim.4
#sepal_length  0.8901688 0.36082989 -0.27565767 -0.03760602
#sepal_width  -0.4601427 0.88271627  0.09361987  0.01777631
#petal_length  0.9915552 0.02341519  0.05444699  0.11534978
#petal_width   0.9649790 0.06399985  0.24298265 -0.07535950

#$cor
#Dim.1      Dim.2       Dim.3       Dim.4
#sepal_length  0.8901688 0.36082989 -0.27565767 -0.03760602
#sepal_width  -0.4601427 0.88271627  0.09361987  0.01777631
#petal_length  0.9915552 0.02341519  0.05444699  0.11534978
#petal_width   0.9649790 0.06399985  0.24298265 -0.07535950

#$cos2    # É O COEFICIENTE DETERMINANTE
#Dim.1       Dim.2       Dim.3
#sepal_length 0.7924004 0.130198208 0.075987149
#sepal_width  0.2117313 0.779188012 0.008764681
#petal_length 0.9831817 0.000548271 0.002964475
#petal_width  0.9311844 0.004095980 0.059040571
#Dim.4
#sepal_length 0.0014142127
#sepal_width  0.0003159971
#petal_length 0.0133055723
#petal_width  0.0056790544

#$contrib   # Contribuição dentro do mapa de fator EM PERCENTUAL
#Dim.1       Dim.2     Dim.3     Dim.4
#sepal_length 27.150969 14.24440565 51.777574  6.827052
#sepal_width   7.254804 85.24748749  5.972245  1.525463
#petal_length 33.687936  0.05998389  2.019990 64.232089
#petal_width  31.906291  0.44812296 40.230191 27.415396

pca_iris_fcm$ind  
# FACTOR MINER NÃO RETORNA LOADS
#pca_results_fACtominer:    # como achar os loads?
              
loadings_fcm <- sweep(pca_iris_fcm$var$coord,2,sqrt(pca_iris_fcm$eig[,1]), FUN = '/')
#> sweep(pca_iris_fcm$var$coord,2,sqrt(pca_iris_fcm$eig[,1]), FUN = '/')
#Dim.1      Dim.2      Dim.3      Dim.4
#sepal_length  0.5210659 0.37741762 -0.7195664 -0.2612863
#sepal_width  -0.2693474 0.92329566  0.2443818  0.1235096
#petal_length  0.5804131 0.02449161  0.1421264  0.8014492
#petal_width   0.5648565 0.06694199  0.6342727 -0.5235971

# sweep = girar a matrix
scores_fcm <- pca_iris_fcm$ind$coord
variance_fcm <- pca_iris_fcm$eig

#plot:
fviz_pca_var(pca_iris_fcm)

# pca tidymodels:
pca_iris_tdm <-
  iris %>%
  recipe(species~.) %>% step_normalize(all_numeric_predictors()) %>% step_pca(all_numeric_predictors()) %>% prep()
# step_normalizr é colocar  ESCALA NO CENTRO
# recipe = species como variável de resultado e o restante coomo preditores
# PREP() rodar o bloco

pca_iris_tdm
#── Inputs 
#Number of variables by role
#outcome:   1       ( RESULTADO )
#predictor: 4

#── Training information 
#Training data contained 150 data points and no incomplete rows.

#── Operations 
#• Centering and scaling for: sepal_length, sepal_width, ... | Trained
#• PCA extraction with: sepal_length, sepal_width, ... | Trained

pca_iris_tdm$steps
# Irá mostrar na tela todos os passos dos resultados e predições, inclusive os rotations (loads, cargas)
# Podemos simplificar o resultado dos steps, mostrando um 'summary', sendo assim:
summary(pca_iris_tdm$steps)
#ength Class          Mode
#1,]  9     step_normalize list
#2,] 13     step_pca       list
# Step 01 - linha 01  e step 2 linha 02
# o resultado pca está dentro do step 02. É preciso extraí-lo.
pca_iris_tdm$steps[[2]]$res

#Standard deviations (1, .., p=4):
 # [1] 1.7083611 0.9560494 0.3830886 0.1439265

#Rotation (n x k) = (4 x 4):
 # PC1         PC2        PC3        PC4
#sepal_length  0.5210659 -0.37741762  0.7195664  0.2612863
#sepal_width  -0.2693474 -0.92329566 -0.2443818 -0.1235096
#petal_length  0.5804131 -0.02449161 -0.1421264 -0.8014492
#petal_width   0.5648565 -0.06694199 -0.6342727  0.5235971

# PCA_RESULT_TIDYMODELS:
loadings_tdm <- pca_iris_tdm$steps[[2]]$res$rotation
scores_tdm <- bake(pca_iris_tdm, new_data = NULL) # O resultado aparecerá no mesmo conjunto, portanto é NULL
# Se fosse para escolher um local, è necessário colocar o devido local.
# A fórmula do bloco acima foi somente 'rodou' o modelo 'prep()', o 'bake' é o resultado dos scores.
# o 'bake' é como se fosse o predict
variance_tdm <- (pca_iris_tdm$steps[[2]]$res$sdev)^2 # Desvio padrão ao quadrado
variance_tdm
#[1] 2.91849782 0.91403047 0.14675688 0.02071484

# Plot:
data_plot<- tidy(pca_iris_tdm,2)  # o 2 é o step2
tidy(pca_iris_tdm,2)  
# A tibble: 16 × 4
#terms          value component id       
#<chr>          <dbl> <chr>     <chr>    
#  1 sepal_length  0.521  PC1       pca_vraAZ
#  2 sepal_width  -0.269  PC1       pca_vraAZ
#3 petal_length  0.580  PC1       pca_vraAZ
#4 petal_width   0.565  PC1       pca_vraAZ
#5 sepal_length -0.377  PC2       pca_vraAZ
#6 sepal_width  -0.923  PC2       pca_vraAZ
#7 petal_length -0.0245 PC2       pca_vraAZ
#8 petal_width  -0.0669 PC2       pca_vraAZ
#9 sepal_length  0.720  PC3       pca_vraAZ
#10 sepal_width  -0.244  PC3       pca_vraAZ
#11 petal_length -0.142  PC3       pca_vraAZ
#12 petal_width  -0.634  PC3       pca_vraAZ
#13 sepal_length  0.261  PC4       pca_vraAZ
#14 sepal_width  -0.124  PC4       pca_vraAZ
#15 petal_length -0.801  PC4       pca_vraAZ
#16 petal_width   0.524  PC4       pca_vraAZ
# DADOS PARA PLOTAR O GRÁFICO, ACIMA. EM NEGATIVO SÃO OS LOADS

data_plot %>% 
  filter(component %in% paste0('PC',1:2)) #%>% # Somente os componentes 1 e 2, filtrados.
A tibble: 8 × 4
terms          value component id       
<chr>          <dbl> <chr>     <chr>    
  1 sepal_length  0.521  PC1       pca_vraAZ
2 sepal_width  -0.269  PC1       pca_vraAZ
3 petal_length  0.580  PC1       pca_vraAZ
4 petal_width   0.565  PC1       pca_vraAZ
5 sepal_length -0.377  PC2       pca_vraAZ
6 sepal_width  -0.923  PC2       pca_vraAZ
7 petal_length -0.0245 PC2       pca_vraAZ
8 petal_width  -0.0669 PC2       pca_vraAZ  
  #ggplot(aes(x = value, y=terms, fill = terms()+
  #geom_col()+
  #facet_grid(~component, scales= 'free')+
  #scale_fill_brewer(palette = )    
  
tidy(pca_iris_tdm,2)  
