VETORES: 
	É necessário chamar a função c():
# Vetores
cidade <- c("Brasília",
            "São Paulo",
            "Rio de Janeiro",
            "Porto Alegre")

Obs: Os elementos separados por vírgulas e entre aspas duplas para strings.

Vetores com valores numéricos:
	- temperatura <- c(32,22,35,17)
	- regiao <- c(1,2,2,3)

# Acessando qualquer elemento do vetor:
cidade[1] # Irá mostrar na tela a cidade de 'Brasilia' entre colchetes.
# Para acessar intervalos de elementos de vetores:
cidade[2:5]  <- Separar pelo elemento dois pontos ':'

Resultado: [1] "São Paulo"      "Rio de Janeiro" "Porto Alegre"   "Goiás"

# Para copiar um vetor basta atribui-lo á uma variável com nome diferente:
cidade2 <- cidade
Resultado no console abaixo:
> cidade2
[1] "Brasília"       "São Paulo"      "Rio de Janeiro" "Porto Alegre"  
[5] "Goiás"          "Amapá"          "Roraima"        "Amazonas"   

# Excluir elemento de um vetor:
temperatura2 [-2]
temperatura2 [-2]
[1] 30 40 17 33 34 31 35
> temperatura2
[1] 30 35 40 17 33 34 31 35

# Alterando um vetor:
cidade2[5] <- "Belo Horizonte"
cidade2
[1] "Brasília"       "São Paulo"      "Rio de Janeiro" "Porto Alegre"  
[5] "Belo Horizonte" "Amapá"          "Roraima"        "Amazonas"  

#Adicionar um novo elemento:
cidade2[9]<- "goiás"

# Deletar todos os elementos do vetor e deixa-lo NULO:
cidade2 <- NULL   
