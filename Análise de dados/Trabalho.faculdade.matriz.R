# Desafio: Trabalho da faculdade UNYLEYA: 
#crie uma matriz adjacente com 10 (dez) cidades de sua escolha e a 
#quilometragem que as separa.

cidades <- c("Rio de Janeiro","São Paulo", "Brasilia","Nova York","Tokio","londres","Vancouver",
            "Buenos Aires","Las Vegas","California")

matriz = matrix(dimnames = list(c("Rio de Janeiro","São Paulo", "Brasilia","Nova York","Tokio","londres","Vancouver",
                                  "Buenos Aires","Las Vegas","California"),c("Rio de Janeiro","São Paulo", "Brasilia","Nova York","Tokio","londres","Vancouver",
                                                                             "Buenos Aires","Las Vegas","California")),nrow = 10, ncol = 10,byrow=T)

# Segunda forma de tratamento da matriz:
row.names(matriz)=c(cidades)
colnames(matriz)=c(cidades)



# Primeiro bloco de inserção de dados na matriz:
matriz['Rio de Janeiro','Rio de Janeiro']<- 0
matriz['Rio de Janeiro','São Paulo']<-500
matriz['Rio de Janeiro', 'Brasilia']<-1200
matriz['Rio de Janeiro', 'Nova York']<-20000
matriz['Rio de Janeiro', 'Tokio']<-50000
matriz['Rio de Janeiro', 'londres']<-25000
matriz['Rio de Janeiro', 'Vancouver']<-35000
matriz['Rio de Janeiro', 'Buenos Aires']<-20000
matriz['Rio de Janeiro', 'Las Vegas']<- 25000
matriz['Rio de Janeiro', 'California']<- 24000

# Segunda linha da matriz:

matriz['São Paulo','Rio de Janeiro']<-500
matriz['São Paulo', 'São Paulo']<-0
matriz['São Paulo', 'Brasilia']<-1300
matriz['São Paulo', 'Nova York']<-21000
matriz['São Paulo', 'Tokio']<-51000
matriz['São Paulo', 'londres']<-26000
matriz['São Paulo', 'Buenos Aires']<- 21000
matriz['São Paulo', 'Las Vegas']<- 26000
matriz['São Paulo', 'California']<-25000
matriz['São Paulo', 'Vancouver']<-36000


matriz['Brasilia','Rio de Janeiro']<-1200
matriz['Brasilia', 'São Paulo']<-1300
matriz['Brasilia', 'Brasilia']<-0
matriz['Brasilia', 'Nova York']<-19000
matriz['Brasilia', 'Tokio']<-50000
matriz['Brasilia', 'londres']<-28000
matriz['Brasilia', 'Vancouver']<- 35500
matriz['Brasilia', 'Buenos Aires']<- 20000
matriz['Brasilia', 'Las Vegas']<-25000
matriz['Brasilia', 'California']<-24000

# Quarta linha de execução de inserção de dados em KM de distância estimada aproximada:
matriz['Nova York','Rio de Janeiro']<-20000
matriz['Nova York', 'São Paulo']<-21000
matriz['Nova York', 'Brasilia']<-19000
matriz['Nova York', 'Nova York']<-0
matriz['Nova York', 'Tokio']<-50000
matriz['Nova York', 'londres']<-25000
matriz['Nova York', 'Vancouver']<- 10000
matriz['Nova York', 'Buenos Aires']<- 12000
matriz['Nova York', 'Las Vegas']<-8000
matriz['Nova York', 'California']<-8000

matriz['Tokio','Rio de Janeiro']<-50000
matriz['Tokio', 'São Paulo']<-51000
matriz['Tokio', 'Brasilia']<-50000
matriz['Tokio', 'Nova York']<-50000
matriz['Tokio', 'Tokio']<-0
matriz['Tokio', 'londres']<-50000
matriz['Tokio', 'Vancouver']<- 55000
matriz['Tokio', 'Buenos Aires']<- 57000
matriz['Tokio', 'Las Vegas']<-55000
matriz['Tokio', 'California']<-55000

matriz['londres','Rio de Janeiro']<-25000
matriz['londres', 'São Paulo']<-26000
matriz['londres', 'Brasilia']<-28000
matriz['londres', 'Nova York']<-25000
matriz['londres', 'Tokio']<-50000
matriz['londres', 'londres']<-0
matriz['londres', 'Vancouver']<- 35000
matriz['londres', 'Buenos Aires']<- 45000
matriz['londres', 'Las Vegas']<-40000
matriz['londres', 'California']<-40000


matriz['Vancouver','Rio de Janeiro']<-35000
matriz['Vancouver', 'São Paulo']<-36000
matriz['Vancouver', 'Brasilia']<-35500
matriz['Vancouver', 'Nova York']<-10000
matriz['Vancouver', 'Tokio']<-55000
matriz['Vancouver', 'londres']<-35000
matriz['Vancouver', 'Vancouver']<- 0
matriz['Vancouver', 'Buenos Aires']<- 15000
matriz['Vancouver', 'Las Vegas']<-10000
matriz['Vancouver', 'California']<-10000

matriz['Buenos Aires','Rio de Janeiro']<-20000
matriz['Buenos Aires', 'São Paulo']<-21000
matriz['Buenos Aires', 'Brasilia']<-20000
matriz['Buenos Aires', 'Nova York']<-12000
matriz['Buenos Aires', 'Tokio']<-57000
matriz['Buenos Aires', 'londres']<-45000
matriz['Buenos Aires', 'Vancouver']<- 15000
matriz['Buenos Aires', 'Buenos Aires']<- 0
matriz['Buenos Aires', 'Las Vegas']<-5000
matriz['Buenos Aires', 'California']<-5000

matriz['Buenos Aires','Rio de Janeiro']<-20000
matriz['Buenos Aires', 'São Paulo']<-21000
matriz['Buenos Aires', 'Brasilia']<-20000
matriz['Buenos Aires', 'Nova York']<-12000
matriz['Buenos Aires', 'Tokio']<-57000
matriz['Buenos Aires', 'londres']<-45000
matriz['Buenos Aires', 'Vancouver']<- 15000
matriz['Buenos Aires', 'Buenos Aires']<- 0
matriz['Buenos Aires', 'Las Vegas']<-5000
matriz['Buenos Aires', 'California']<-5000


matriz['Las Vegas','Rio de Janeiro']<-25000
matriz['Las Vegas', 'São Paulo']<-26000
matriz['Las Vegas', 'Brasilia']<-25000
matriz['Las Vegas', 'Nova York']<-8000
matriz['Las Vegas', 'Tokio']<-55000
matriz['Las Vegas', 'londres']<-40000
matriz['Las Vegas', 'Vancouver']<- 10000
matriz['Las Vegas', 'Buenos Aires']<- 5000
matriz['Las Vegas', 'Las Vegas']<-0
matriz['Las Vegas', 'California']<-1000


matriz['California','Rio de Janeiro']<-24000
matriz['California', 'São Paulo']<-25000
matriz['California', 'Brasilia']<-24000
matriz['California', 'Nova York']<-8000
matriz['California', 'Tokio']<-55000
matriz['California', 'londres']<-40000
matriz['California', 'Vancouver']<- 10000
matriz['California', 'Buenos Aires']<- 5000
matriz['California', 'Las Vegas']<-1000
matriz['California', 'California']<-0

# Instalação de dos pacotes para visualização do grafo e outras análises:
install.packages('igraph',dependencies = TRUE)
library(igraph)
grupos<- hclust(dist(matriz))

# Dendograma: Análise de agrupamentos por distâncias:
plot(grupos, xlab='Cidades', ylab = 'KM (kilometragem)', main = 'Grupagem de cidades por suas distâncias')
rect.hclust(grupos,k=4,border='10')

# Grafo para a matriz adjacente:
matriz_adj = graph.adjacency(matriz, mode='undirected', weighted=TRUE)
plot(matriz_adj)

