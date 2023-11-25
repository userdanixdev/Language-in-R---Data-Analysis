install.packages('tidyverse')
library(tidyverse)  # Manipulação de dados
library(cluster)
# Carrgar o data set
df<-USArrests
summary(df)
df<-scale(df)
summary(df)
# Escolha da distância, no padrão R é a Euclidiana. Iremos usar o 'kmeans' para medir a distância:
# Dados serão agrupados em dois cluster (centers)
# O parâmetro 'nstart' teste configurações iniciais para certificar a qualidade das medidas. Esse método é recomendado
k2<-kmeans(df,centers = 4,nstart = 25)
str(k2)
k2$centers
#Também podemos ver nossos resultados usando fviz_cluster. Isso fornece uma boa 
#ilustração dos clusters. Se houver mais de duas dimensões (variáveis) fviz_cluster, a 
#análise de componentes principais (PCA) será executada e os pontos de dados serão 
#plotados de acordo com os dois primeiros componentes principais que explicam a 
#maior parte da variação

fviz_cluster(k2,data = df)

set.seed(130)
gap_stat <- clusGap(df, FUN = kmeans, nstart = 25, K.max=10, B=50)
print(gap_stat, method = 'firstmax')

fviz_gap_stat(gap_stat)

distance <- get_dist(df)

fviz_dist (distance, gradient = list(low = "#00AFBB', mid = 'white',high = '#FC4E07'))



