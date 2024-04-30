# A documentação feita aqui nesse repositório tem por objetivo os estudos realizados do dataset matcars
# Manipulação de dados nativa do R:
# Criando uma tabela agrupada dos carros pela distribuição de frequência:
library(dplyr)
mpg = select(mtcars,mpg)
mpg = arrange (mpg,mpg)
mpg$index = rownames(mpg)
coluna_indice = mpg$index
coluna_indice

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
