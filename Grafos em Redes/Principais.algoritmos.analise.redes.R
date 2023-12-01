# Principais algoritmos de análise de redes:
library(igraph)
# MUNDO PEQUENO:
#
g = sample_smallworld(1,50,1,0.005)
## Redes de mundo pequeno - Modelo proposto por  Duncan Watts e Seteven Strogatz e se caracteriza por criar clusters e caminho entre os vértices.
#Grupos de três vértices em que todos estão conectados, fazendo o coeficiente de clusterização deste modelo seja maior.
#Uma das características da rede é que a maioria dos vértices se conecta a outros por meio de um caminho mínimo, também chamado de caminho geodésico, ou seja,
#aquele formado pelo menor número de arestas que conectam um vértice origem e um vértice destino.

plot(g, vertex.label = NA, vertex.size = 5,
     layout = layout.kamada.kawai)
# vertex.label NA para vértices sem nome, e o size com tamnho reduzido
?sample_smallworld

#Modelo livre de escala:
# BArabasi & Albert desenvolveram um algoritmo de gerador de redes complexas que se baseia no grau dos vértices para determinar a probabilidade com que as conexões
#serão adicionadas em um determinado vértice. Seu crescimento começa com um pequeno número de nós conectados, a cada passo, adicionamos um novo nó com bordas 
##que ligam o novo nó a nós diferentes já presentes na rede. Com um anexo preferencial, ao escolher os nós, assumimos a probabilidade (P) que um novo nó será
#conectado ao nó. Essa características implica em redes com poucos vértices altamente conectados, denominados hubs e muitos vértices com poucas conexões.
#Ela segue uma função f(x) que permanece inalterada com um fator multiplicativo sob um reescalonamento da variável independente x.

g1 = sample_pa(100, m = 1, directed = F) # # 'm' parametro para número de etapas de construção de arestas.
plot(g1)
plot(g1, vertex.label = NA, vertex.size = 5,
     layout = layout_components)

# Outros modelos:
g2 = sample_gnp(100, 0.03, directed = F)
plot(g2, vertex.label = NA, vertex.size = 5,
     layout = layout_components)
g3 = sample_gnm(100,100, directed = F)
plot(g3, vertex.label = NA, vertex.size = 5,
     layout = layout_components)

# DETECÇÃO DE COMUNIDADES:
# algoritmo chamado:  'fastgreedy'
g = sample_gnm(100,100, directed = F)
g.comunidade = fastgreedy.community(g)   
V(g)$color = g.comunidade$membership + 1
plot(g, vertex.label = NA, vertex.size = 5,
     layout = layout_components)

# Componentes gigante:
# Separar os clusters:
cl <- clusters(g)
gc <- induced.subgraph(g,which(cl$membership == which.max(cl$csize)))
plot(gc, vertex.label = NA, vertex.size = 5,
     layout = layout_components)
# plotados apenas os vértices conectados.

# distribuição de graus:
degree_distribution(g)
# Para identificar um grau de um vértice específico:
degree(g)
# Histograma de distribuição de graus:
hist(degree_distribution(g))
# No gráfico mostra a distribuição.
#diâmetro da rede:
# O vértice para chegar a outro mais distante, terá que passar por distâncias mais longa para ser analizada.
diameter(g)
# Distances:
# Todos os menores caminhos:
distances(g)
# O o grau infinito é aquele vértice que não esta conectado com ninguém.
# Transitividade:
# Medir a probabilidade de um vértice estar conectado a outro de todo o grafo.
transitivity(g)
# Distância média entre os vértices:
mean_distance(g)
# Centralidade:
closeness(g)
# Centralidade média:
mean(closeness(g))


