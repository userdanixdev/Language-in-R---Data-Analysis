# A documentação feita aqui nesse repositório tem por objetivo os estudos realizados do dataset matcars ::
#Ordenação e isolamento da variável em questão mpg de mtcars::
library(dplyr)
mpg = select(mtcars,mpg)
mpg = arrange (mpg,mpg)
print(mpg)

# Puxando informações estatísticas da variável:
numSummary(mpg,statistics=c('mean','quantiles'),quantiles=c(0,.25,.5,.75,1))
# Boxplot da variável mpg de mtcars para quartis e mediana:
boxplot(mtcars$mpg,
        main = "Boxplot da Variável MPG",
        ylab = "MPG - Milhas por Galão",
        col = "skyblue",
        border = "black",
        yaxt = 'n')

# Adicionar linhas para os quartis
quartis <- quantile(mtcars$mpg, probs = c(0,0.25, 0.5, 0.75,1))
abline(h = quartis, col = c("blue","blue", "yellow", "red",'red'), lty = 2)
                # Criar uma legenda
                legend("topright",legend=c("Q4","Q3","Q2-Mediana","Q1"),
                       col=c('red','red','yellow','blue'),lty=2,
                        bty = 'n', cex=0.8)   

                # Definir os intervalos do eixo y de 4 em 4 - OPCIONAL
                axis(2, at = seq(10, 38, by = 4))
                # Adicionar rótulos dos quartis no eixo y
                axis(2, at = quartis, labels = floor(quartis))  

# Formatando a distribuição de frequência:
is.data.frame(mpg) # Deve ser true
mpg_matrix = as.matrix(mpg) # Converter como uma matriz
# Verificação do tipo de estrutura:
is.data.frame(mpg_matrix)
is.matrix(mpg_matrix)
# Converter em uma matriz em formato ROL
mpg_matrix = matrix(mpg_matrix,nrow=4,ncol=8,byrow = TRUE)
# Arredondar a variável:
mpg_matrix = round(mpg_matrix)
print(mpg_matrix)
# Amplitude Total:
  # A amplitude total é a diferença entre o maior e o menor valor em um conjunto de dados.
calc_amplitude_total <- function(mpg_matrix) {
  amplitude_total <- max(mpg_matrix) - min(mpg_matrix)
  return(amplitude_total)
}
amplitude_total = calc_amplitude_total(mpg_matrix)
print(amplitude_total)
# Intervalo de classe:
calc_intervalos_sturges <- function(mpg_matrix) {
        n <- length(mpg_matrix) # Tamanho de amostra
        k <- 1 + 3.3 * log10(n) # - Número de intervalos de classe (Método de Sturges)
        k <- round(k) # Arredondando para o número inteiro mais próximo
        return(k)
      }
      # Declarar uma variável com o número de intervalos pois usaremos para quebrar a matriz
      num_intervalos <- calc_intervalos_sturges(mpg_matrix)
      print(num_intervalos)
# Amplitude de classe:
amplitude_classe = amplitude_total / num_intervalos        
print(amplitude_classe)
******
# Verificação da distribuição dos valores sem os invervalos:
summary(factor(mpg_matrix))
# Dividindo os intervalos:
intervalos <- cut(mpg, breaks = num_intervalos, include.lowest = TRUE,right = FALSE)
print(summary(intervalos))
intervalos <- names(table(cut(mpg_matrix, breaks = num_intervalos, include.lowest = TRUE,right = FALSE)))
# O valor de include.lowest é definido como FALSE, o que significa que o limite inferior do primeiro intervalo não é incluído.
print(intervalos)
# Calculando a frequência absoluta:
frequencia_absoluta <- as.numeric(table(intervalos))
print(frequencia_absoluta)
# Calculando frequência relativa:
freq_relativa = prop.table(frequencia_absoluta)
print(freq_relativa)
# Calculando frequência relativa percentual (porcentagem):
freq_relativa_perc = prop.table(frequencia_absoluta)*100
print(freq_relativa_perc)
# Criação da tabela de distribuição de frequência:
dist_freq = data.frame(intervalos,frequencia_absoluta,freq_relativa,freq_relativa_perc)
print(dist_freq)

# Segunda forma, trabalhando com outliers:
# Intervalos de classe:
inter_cl <- seq(10,38,4)
# Extrair a frequência:
classes_frequencia = table(cut(mpg,breaks=inter_cl,right=FALSE))
# Frequência:
frequencia = c(3,9,10,4,2,3,1)
# Vetores do intervalo de classes para composição da tabela de distribuição de frequência:
classes=c('10-14','14-18','18-22','22-26','26-30','30-34','34-38')
# Frequência relativa:
frequencia_relativa = prop.table(frequencia)
# Frequência relativa percentual:
frequencia_relativa_perc = frequencia_relativa*100
# Criação da tabela de distribuição de frequência:
mtcars_mpg = data.frame(classes,frequencia,frequencia_relativa,frequencia_relativa_perc)
# Plot gráfico da distribuição de frequência com o pacote ggplot2:
library(esquisse)
library(ggplot2)
esquisser(mtcars_mpg)
ggplot(mtcars_mpg) +
  aes(x = reorder(classes, -frequencia), y = frequencia, fill = frequencia) +
  geom_col() +
  scale_fill_gradient(low = "#FF0000", high = "#00FF00") +  # Cores em gradiente
  labs(title = "Distribuição de Classes & Frequência", 
       subtitle = "Variável mpg",
       x = 'MPG - MILHAS POR GALÃO',
       y = 'Quantidade de automóveis') +
  scale_y_continuous(breaks = seq(0, 10, by = 1)) +  # Intervalos de 1 unidade no eixo y
  geom_text(aes(label = paste0(round(porcentagem), "%")), # Especifica que o texto a ser exibido é em percen
            position = position_stack(vjust = 0.5), size = 3) +  # Define a posição do texto dentro das barras
  coord_flip() +
  theme_minimal() +
  theme(plot.title = element_text(size = 20, hjust = 0.5),
        plot.subtitle = element_text(size = 13, hjust = 0.5),
        axis.text.x = element_text(angle = 0, vjust = 0.5),  # Ajustando orientação dos rótulos do eixo x
        legend.position = "none")  # Removendo a legenda
# Plot gráfico da distribuição de frequência em barras nativo do R:
barplot(mtcars_mpg$frequencia, 
        main = "Distribuição de Classes & Frequência",
        sub = "Variável mpg",
        xlab = 'MPG - MILHAS POR GALÃO',
        ylab = 'Quantidade de automóveis',
        col = colorRampPalette(c("#CCCCCC", "#CCCCCC"))(nrow(mtcars_mpg)),
        ylim = range(0:12),
        names.arg = mtcars_mpg$classes,
        cex.names = 0.8,  # Reduzir o tamanho dos rótulos do eixo x
        las = 1)  # Rótulos do eixo x na vertical = 1 na horizontal = 2

# Adicionar texto com a porcentagem dentro das barras
text(x = barplot(mtcars_mpg$frequencia, plot = FALSE),
     y = mtcars_mpg$frequencia,
     labels = paste0(round(mtcars_mpg$porcentagem), "%"),
     pos = 3,  # Posição do texto
     cex = 0.7)  # Tamanho do texto
# Plot gráfico de Marimekko com ggplot para distribuição em proporção da variável mpg:
library(ggplot2)
# Criar o gráfico de Marimekko
ggplot(mtcars_mpg, aes(x = "", y = frequencia_relativa_perc, fill = classes)) +
  geom_bar(stat = "identity", color = "black") +
  geom_text(aes(label = paste0(frequencia_relativa_perc, "%")),
            position = position_stack(vjust = 0.5), size = 3) +
  labs(title = "Gráfico Marimekko para Distribuição de MPG",
       x = NULL,
       y = 'Quartis',
       fill = "Classes de MPG") +
  scale_fill_manual(values = rainbow(nrow(mtcars_mpg), start = 0.2, end = 0.8)) +
  theme_minimal() +
  theme(legend.position = "bottom")  # Posicionar a legenda na parte inferior

# Manipulação de dados nativa do R:
# Criando uma tabela agrupada dos carros:
library(dplyr)
mpg = select(mtcars,mpg)
mpg = arrange (mpg,mpg)
mpg$index = rownames(mpg)
coluna_indice = mpg$index
print(coluna_indice)

# Dividir a coluna de índices em 7 partes proporcionis ao intervalo de classe :

partes <- list(
  coluna_indice[1:3],
  coluna_indice[4:12],
  coluna_indice[13:22],
  coluna_indice[23:26],
  coluna_indice[27:28],
  coluna_indice[29:31],
  coluna_indice[32]
)
# Nos mostra a lista com as 7 partes de maneira organizada:
for (i in 1:7) {
  cat("Parte", i, ":", partes[[i]], "\n")
}
# Criar o dataframe com as partes em colunas:
partes_df = data.frame(
  Parte1 = rep(NA, max(sapply(partes, length))),
  Parte2 = rep(NA, max(sapply(partes, length))),
  Parte3 = rep(NA, max(sapply(partes, length))),
  Parte4 = rep(NA, max(sapply(partes, length))),
  Parte5 = rep(NA, max(sapply(partes, length))),
  Parte6 = rep(NA, max(sapply(partes length))),
  Parte7 = rep(NA, max(sapply(partes, length)))
)
# Preencher o data.frame com os valores nas partes:
for (i in 1:7) {
  partes_df[1:length(partes[[i]]), i] <- partes[[i]]
}
# Renomear as colunas :
classes=c('10-14(mpg)','14-18(mpg)','18-22(mpg)','22-26(mpg)','26-30(mpg)','30-34(mpg)','34-38(mpg)')
colnames(partes_df)= classes
print(partes_df)
# Remover as linhas que contêm <NA>:
clean_df <- partes_df
clena_df [is.na(clean_df)] <- ''
print(clean_df)

---------//-----------------//---------------//----------------------
# Manipulação de dados na linguagem R com o pacote dplyr ( opcional )

library(dplyr)

# Adicionar uma coluna de índices ao dataset mtcars
mtcars$indice_linha <- rownames(mtcars)

# Selecionar a coluna de índices
coluna_indices <- mtcars$indice_linha

# Dividir a coluna de índices em 7 partes conforme especificado
partes <- list(
  coluna_indices[1:3],
  coluna_indices[4:12],
  coluna_indices[13:22],
  coluna_indices[23:26],
  coluna_indices[27:28],
  coluna_indices[29:31],
  coluna_indices[32]
)

# Preencher as partes com NA para que todas tenham o mesmo comprimento
max_len <- max(sapply(partes, length))
partes <- lapply(partes, function(x) c(x, rep(NA, max_len - length(x))))

'''
max_len <- max(sapply(partes, length)):
sapply(partes, length): Isso calcula o comprimento de cada parte.
max(): Retorna o comprimento máximo encontrado.
max_len armazena o comprimento máximo entre todas as partes.
partes <- lapply(partes, function(x) c(x, rep(NA, max_len - length(x)))):
lapply(partes, ...) aplica a função a todas as partes da lista.
A função function(x) c(x, rep(NA, max_len - length(x))) é aplicada a cada parte individualmente:
x é cada parte.
rep(NA, max_len - length(x)) cria um vetor de NA com o comprimento necessário para igualar ao max_len - length(x) (ou seja, a diferença entre o comprimento máximo e o comprimento atual da parte).
c(x, ...) combina a parte atual com o vetor de NA, preenchendo as partes com NA para igualar ao comprimento máximo.
Isso resulta em todas as partes tendo o mesmo comprimento, preenchendo com NA onde necessário.      '''           

# Criar o dataframe com as partes como colunas
partes_df <- as.data.frame(partes)

# Renomear as colunas do dataframe
colnames(partes_df) <- paste0("Parte", 1:7)

# Converter o dataframe para tibble (opcional)
partes_df <- as_tibble(partes_df)

# Imprimir o dataframe
print(partes_df)
