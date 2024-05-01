# A documentação feita aqui nesse repositório tem por objetivo os estudos realizados do dataset matcars ::
#Ordenação e isolamento da variável em questão mpg de mtcars::
library(dplyr)
mpg = select(mtcars,mpg)
mpg = arrange (mpg,mpg)
print(mpg)
# Puxando informações estatísticas da variável:
numSummary(mpg,statistics=c('mean','quantiles'),quantiles=c(0,.25,.5,.75,1))
# Formatando a distribuição de frequência:
summary(factor(,mpg))
mpg= c(10.4, 10.4, 13.3, 14.3, 14.7, 15, 15.2, 15.2, 15.5, 15.8, 
       16.4, 17.3, 17.8, 18.1, 18.7, 19.2, 19.2, 19.7, 21, 21,
       21.4, 21.4, 21.5, 22.8, 22.8, 24.4, 26, 27.3, 30.4, 30.4, 32.4, 33.9) 
# Arrendomento da variável mpg:
mpg = round(mpg)
# Criação de um rol dos número por meio da uma matrix ( boa prática ):
mpg = matrix(mpg,nrow=4,ncol=8,byrow = TRUE)
# Amplitude total:
  34-10=24
# Intervalo de classe:
  1 + 3.3 * 1.5 = 6
# Amplitude de classe:
  24 / 6 = 4
# Intervalos de classe:
inter_cl <- seq(10,38,4)
# Extrair a frequência:
classes_frequencia =  table(cut(mpg,breaks=inter_cl,right=FALSE))
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
library(ggplot2)
ggplot(mtcars_mpg) +
+  aes(x = classes, y = frequencia, fill = classes) +
+  geom_col() +
+  scale_fill_manual(values = c(`10-14` = "#058BDE", 
+ `14-18` = "#03324F", `18-22` = "#03324F", `22-26` = "#6BAED6", `26-30` = "#3787C0", `30-34` = "#105BA4", 
+ `34-38` = "#89B0EA")) +
+  labs(title = "Distribuição de Classes & Frequência", subtitle = "Variável mpg", 
+  fill = "Legenda",x = 'MPG - MILHAS POR GALÃO',y='Quantidade de automóveis') +
+  coord_flip() +
+  theme_minimal() +
+  theme(plot.title = element_text(size = 20L, 
+  hjust = 0.5), plot.subtitle = element_text(size = 13L, hjust = 0.5))

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
