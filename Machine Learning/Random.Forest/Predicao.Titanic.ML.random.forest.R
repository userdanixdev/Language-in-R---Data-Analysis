#Predição de sobreviventes do Titanic(1912)
library(randomForest)
library(ggplot2)
# Importação de dados:
?read.csv
test_set <- read.csv(file="C:\\Users\\Daniel\\Desktop\\Pós-graduação- Análise de dados e Math\\Rstudio\\test.ML.titanic.csv",stringsAsFactors=T)
train_set <- read.csv(file="C:\\Users\\Daniel\\Desktop\\Pós-graduação- Análise de dados e Math\\Rstudio\\train.ML.titanic.csv",stringsAsFactors=T)
#check dos dados faltantes:
colSums(is.na(test_set))  # Na coluna 'age' tem 86 NA
colSums(is.na(train_set)) # Na coluna 'age' do dataset_train tem 177 NA
colSums(train_set=="") # Coluna 'cabines' tem 687 vazias - será necessário tratamentos nelas
# Coluna 'Embarque=2 valores NA
colSums(test_set=="") # Coluna 'cabin' tem 327 vazios

# Criar o mesmo número de colunas com valores 'NA' que do data_set_train para test:
test_set$Survived <- NA
# Mesmo número de colunas que o data_set_train com os valores NA para elas.

#Existem dados faltantes nas duas bases, sendo assim é necessário
#Criar coluna extra para identificar se o dado é treino ou teste:
train_set$IstrainSet <- T
test_set$IstrainSet <- F

# Agrupar os datasets usando rbind ( 'rowbinds') 
titanic_set <- rbind(train_set, test_set)

# Estatística descritiva 'summary' que vai trazer dados importantes do conjunto de dados:
summary(titanic_set)
# Com as informações do summary temos as seguintes conclusões:
  # AGE = 263 Total vazios FARE: 1 VAZIO, EMBARQUE = 2 vazios  - Todos para tratamento

#Check dados faltantes
colSums(is.na(titanic_set)) 
colSums(is.na(titanic_set)) # Age = 263 vazias  # Atenção - pode ser um fator importante.
colSums(titanic_set =="")  # Cabine - 1014 cabines vazias

#Transformações simples ETL/4Cs (Cleaning, completing, correting, creating)
titanic_set$Survived <- as.factor(titanic_set$Survived) # Qualitativa nominal, então é necessário transformar em factor.
titanic_set$Pclass   <- as.factor(titanic_set$Pclass)  # Qualitativa ordinal , portanto é factor também.
titanic_set$Age[is.na(titanic_set$Age)] <- median(titanic_set$Age, na.rm = T) # Se é nulo então calcular a mediana com os 'na=not available' removidos 'rm'= TRUE.
titanic_set$SibSp<- as.numeric(titanic_set$SibSp)
titanic_set$Parch<- as.numeric(titanic_set$Parch)
titanic_set$Fare[is.na(titanic_set$Fare)]<- median(titanic_set$Fare, na.rm = T) # Mesmo esquema das idades.
titanic_set$Embarked[titanic_set$Embarked==""] <-"S"   # Qualitativa 'S', de acordo com a moda. Aquela que aparece mais;
titanic_set$Embarked <-as.factor(as.character(titanic_set$Embarked))
table(titanic_set$Embarked)  # Verificar se for para o embarque S. e transformada em factor.

# O fator família foi importante na sobrevivência das pessoas?

# Para construir o modelo temos que separar novamente os dados
# COnstrução do modelo então:
titanic_train <- titanic_set[titanic_set$IstrainSet == T,]   # depois da vírgula é a coluna - ATENÇÃO!  Entre colchetes
titanic_test <- titanic_set[titanic_set$IstrainSet==F,]	 #   # depois da vírgula é a coluna - ATENÇÃO!	ENtre colchetes

# Depois dos tratamentos básicos  
#****Obs: Predição no campo idade poderia ser feito da melhor forma, 'fare' na mediana, a tarifa era por família.

#Criando a fórmula:
# A variável 'survived' é a preditora que é coluna também. Contra as outras colunas são a features preditoras
survived_formula<- as.formula("Survived ~ Sex + Age + SibSp + Parch + Fare + Embarked")

#Enfim, o modelo:
library(randomForest)
titanic_model <-randomForest(formula = survived_formula,
                             data = titanic_train,
                             ntree = 65,  # Padrão é 500.
                             importance = T)   # A importância das variáveis.

#Interpretando os resultados:
titanic_model   # 82,49 % de acurácia.
# Note que a estimativa de erro foi de 18.07%, ou seja, acurácia de 81,93%.

# Mostrar no gráfico para análise:
plot(titanic_model)

#Gerar a importância matriz das variáveis:
importance_var <- importance(titanic_model, type=1)
#ou pode gerar sem criar uma variável, assim:
importance(titanic_model)
####################################
importance_var
?importance
> importance(titanic_model)
#0         1 MeanDecreaseAccuracy MeanDecreaseGini
#Sex      23.122996 33.480739            36.823694        107.85568
#Age       8.007576  6.408504            11.577539         58.56534
#SibSp    13.113766  2.833348            13.869207         23.47931
#Parch     4.479855  3.915695             6.880882         16.56453
#Fare      9.920634 14.420912            17.664054         86.13345
#Embarked  1.075629  5.650821             4.880357         12.98278
#> ####################################
#> importance_var
#MeanDecreaseAccuracy
#Sex                 36.823694
#Age                 11.577539
#SibSp               13.869207
#Parch                6.880882
#Fare                17.664054
#Embarked             4.880357

#Dando uma formatada na tabela: Só pra ficar mais claro o entendimento da importância das variáveis.
tabela_de_importancia <- data.frame(variaveis=row.names(importance_var), 
                                    importancia=importance_var[,1])

#Resultado no console:
#> tabela_de_importancia
#variaveis importancia
#Sex            Sex   36.823694
#Age            Age   11.577539
#SibSp        SibSp   13.869207
#Parch        Parch    6.880882
#Fare          Fare   17.664054
#Embarked  Embarked    4.880357

#Gerando o grafico:
grafico <- ggplot(tabela_de_importancia, 
                  aes(x=reorder(variaveis,importancia), y=importance_var)) +
  geom_bar(stat="identity", fill="#5cc9c1") +
  coord_flip() + 
  theme_light(base_size=20) +
  xlab("") +
  ylab("Importância") + 
  ggtitle("Importância das variáveis no Modelo RF") +
  theme(plot.title=element_text(size=18))

grafico
# terminado ##
##################################################################################
#Preparando material para submissão (Obs: DOCUMENTO PRA ENTREGA NO SITE DE DISPUTA)

#Cria um data frame com o campo PassengerId
submission <- data.frame(PassengerId = test_set$PassengerId,
                         Survived = predict(titanic_model, newdata =  titanic_test))

#View nos dados de saida
View(submission)

write.csv(submission, file = "titanic_kaggle_r.csv", row.names=F)



