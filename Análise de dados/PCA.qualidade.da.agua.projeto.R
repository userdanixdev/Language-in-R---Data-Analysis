install.packages('xlsx')

install.packages('FactomineR')

install.packages('factoextra')

install.packages('rJava')


library(rJava)

library(xlsx)

library(factomineR)

library(factoextra)

qualidade_agua <- read.xlsx('C:\\Users\\Daniel\\Desktop\\Pós-graduação- Análise de dados e Math\\Rstudio\\quali_agua.xlsx', sheetIndex = 1)

view(qualidade_agua)

qualidade_agua <- na.omit(qualidade_agua)

# Tabela nova para somente dados quantitativos:
qualidade_agua_active <- qualidade_agua[1:12,2:5]

view(qualidade_agua_active)
head(qualidade_agua_active)
# Padronizar em escala:
qualidade_agua_active<- scale(qualidade_agua_active)
# Gerar PCA:
resposta.pca <- PCA(qualidade_agua_active, graph = F)
# Extração das respostas dos altos valores:
eig.val <- get_eigenvalue(resposta.pca)
eig.val
scale(qualidade_agua_active)
# Gráficos:
fviz_eig(resposta.pca, addlabels = TRUE, ylim = c(0,90))
# O gráfico da função acima mostrará em percentual, a variância.
# Extraindo resultados individuais e por variáveis:
var <- get_pca_var(resposta.pca)
ind <- get_pca_ind(resposta.pca) 
# Plotar gráfico pca. resposta com os resultados individuais e variáveis:
fviz_pca_var(resposta.pca, col.var = "blue")
fviz_pca_ind(resposta.pca, col.var = "blue")

# Criar em grupos de CLUSTER:   Outra variável: agrupamento
grupo.cluster <- as.factor(qualidade_agua[,1])  # '-1' para retirar a coluna de variáveis sólidas,rotuladas,categóricas
# Plotar o gráfico novamente com o cluster criado com a função biplot, habilitando o novo grupo de clusters:
fviz_pca_biplot(resposta.pca, habillage = grupo.cluster, title = "Gráfio PCA Qualidade da Agua")
