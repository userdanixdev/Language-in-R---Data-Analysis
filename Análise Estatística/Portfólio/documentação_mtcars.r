# Manipulação de dados nativa do R:
# Criando uma tabela agrupada dos carros pela distribuição de frequência:
mpg$index = rownames(mpg)
coluna_indice = mpg$index
coluna_indice

# Dividir a coluna de índices em 7 partes iguais proporcional ao intervalo de classe e a amplitude

partes7_32_4 <- list(
  coluna_indice[1:3],
  coluna_indice[4:12],
  coluna_indice[13:22],
  coluna_indice[23:26],
  coluna_indice[27:28],
  coluna_indice[29:31],
  coluna_indice[32]
)
partes7_32_4
# Nos mostra a lista com as 7 partes
for (i in 1:7) {
  cat("Parte", i, ":", partes7_32_4[[i]], "\n")
}



# Criar o dataframe com as partes como colunas:
partes_df_2 = data.frame(
  Parte1 = rep(NA, max(sapply(partes7_32_4, length))),
  Parte2 = rep(NA, max(sapply(partes7_32_4, length))),
  Parte3 = rep(NA, max(sapply(partes7_32_4, length))),
  Parte4 = rep(NA, max(sapply(partes7_32_4, length))),
  Parte5 = rep(NA, max(sapply(partes7_32_4, length))),
  Parte6 = rep(NA, max(sapply(partes7_32_4, length))),
  Parte7 = rep(NA, max(sapply(partes7_32_4, length)))
)
  
partes_df_2
# Preencher o data.frame com os valores nas partes:
for (i in 1:7) {
  partes_df[1:length(partes7_32_4[[i]]), i] <- partes7_32_4[[i]]
}
# Renomear as colunas :
partes_df
colnames(partes_df)= classes
?sapply
partes_df
classes=c('10-14(mpg)','14-18(mpg)','18-22(mpg)','22-26(mpg)','26-30(mpg)','30-34(mpg)','34-38(mpg)')


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

# Criar o dataframe com as partes como colunas
partes_df <- as.data.frame(partes)

# Renomear as colunas do dataframe
colnames(partes_df) <- paste0("Parte", 1:7)

# Converter o dataframe para tibble (opcional)
partes_df <- as_tibble(partes_df)

# Imprimir o dataframe
print(partes_df)
