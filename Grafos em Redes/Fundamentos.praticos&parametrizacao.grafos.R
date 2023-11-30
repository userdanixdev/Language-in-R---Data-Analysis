# Redes, Grafos
install.packages("igraph", dependencies = T)
library(igraph)

grafo1 = graph(edges = c(1,2, 2,3, 3,1), directed = F)
plot(grafico1)
grafo2 = graph(edges = c(1,2, 2,3, 3,1), directed = T)
plot(grafo2)
g3 = graph(edges = c(1,2,2,3,3,1),n = 5)
plot(g3) # Note que ao criar número de vértices maior que os declarados,
# Teremos assim 2 nós ( vértices ) isolados. Plote o gráfico para ver.
# Note que ao gerar o gráfico sem parâmetro, ele nos dá direcionado. Como no 'g3'.
g4 = graph(c("Rodrigo","Cássio", "Cássio", "Leonardo", "Leonardo", "Rodrigo"))
plot(g4)
g5 = graph(c("Rodrigo", "Michele", "Michele", "Rodrigo","Michele", "leonardo", "Rodrigo", "Rodrigo"),
           isolates = c("Larissa", "Vivi","Juliana", "Cássio"))
plot(g5)           
# Note que usei o parâmetro 'isolates' para criar vértices isolados
plot(g5, edge.arrow.size = .5)
# edge.arrow.size, parâmetro para configurar o tamanho da linha e seta
plot(g5, edge.arrow.size = .5, vertex.color = 'red')
# vertex.color, parâmetro para configurar a cor do nó ou do vértice.
plot(g5, edge.arrow.size = .5, vertex.color = 'red', vertex.size = 20)
# vertex.size, parâmetro para configurar o tamanho do nó ou vértice.

plot(g5, edge.arrow.size = .5, vertex.color = 'red', 
     vertex.frame.color = 'green',vertex.label.color='black')
# vertex.frame.color para mudar a borda do vértice & vertex.label.color para mudar o nome do vértice.


plot(g5, edge.arrow.size = .5, vertex.color = 'red', 
     vertex.frame.color = 'green',vertex.label.color='black',
     vertex.label.cex=1)  # Vertex.label.cex para configurar o tamanho dos nomes dos vértices.


plot(g5, edge.arrow.size = .5, vertex.color = 'red', 
     vertex.frame.color = 'green',vertex.label.color='black',
     vertex.label.cex=1, vertex.label.dist = 2.5)  
# O vertex.label.dist configura a distância do nome do vértice para o nó.

# Acessar arestas e vértices:
# Arestas em inglês é EDGES, portanto, para ver os vértices é:
E(g5)
#Resultado no console:
 # [1] Rodrigo->Michele  Michele->Rodrigo  Michele->leonardo Rodrigo->Rodrigo 
# VÉRTICES:
V(g5)
# Resultado no console:
#[1] Rodrigo  Michele  leonardo Larissa  Vivi     Juliana  Cássio  

# Acessar MATRIZ, por colchetes depois da variável:
g5[]
# Resultado no console abaixo:
#7 x 7 sparse Matrix of class "dgCMatrix"
#Rodrigo Michele leonardo Larissa Vivi Juliana Cássio
#Rodrigo        1       1        .       .    .       .      .
#Michele        1       .        1       .    .       .      .
#leonardo       .       .        .       .    .       .      .
#Larissa        .       .        .       .    .       .      .
#Vivi           .       .        .       .    .       .      .
#Juliana        .       .        .       .    .       .      .
#Cássio         .       .        .       .    .       .      .

# g5 # Acessos:
g5[1,]  # Acesso a primeira linha da matrix
g5[2,]  # Acesso a segunda linha da matrix
g5[,1]  # Acesso a primeira COLUNA DA MATRIX
g5[1,1]  # ACESSO A PRIMEIRA LINHA E PRIMEIRA COLUNA DA MATRIX 7X7, OK?

