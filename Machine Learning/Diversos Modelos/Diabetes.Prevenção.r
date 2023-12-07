Aplicação da linguagem R na análise de dados:
	Estudo de caso : Prevendo a ocorrência de diabetes
Vamos aprender a construção de um modelo de machine learning utilizando a linguagem em R. Um modelo preditivo, usado para identificar padrões.
Definição do problema:
	- Identificar pacientes com alta probabilidade de serem diagnosticados com diabetes, tendo no mínimo 75% de acurácia.
Obtenção dos dados:

diabetes <- read.csv(
  file = "C:/Users/Daniel/Desktop/Pós-graduação- Análise de dados e Math/Rstudio/diabetes.csv "
  )
##Preparação dos dados:
head(diabetes) <- Verificar se todos os registros foram carregados
str(diabetes) <- Verifica a estrutura e tipos de dados
colSums(is.na(diabetes) <- Verifica se todos os registros estão preenchidos
table(diabetes$Outcome) <- Verifica a proporção dos valores de cada categoria
diabete$Outcome <- as.factor(diabete$Outcome) <- Alterar o tipo da coluna 'Outcome' que é int para factor
summary(diabetes$Insulin) <- Verificando os valores min, max, média e mediana do dados
carregar o pacote 'dplyr'
#Filtrando o dataset por Insulin - Remoção de outliers
diabetes2 <- diabetes %>%
  filter(Insulin <= 250)

boxplot(diabetes2$Insulin) ou hist(diabetes$Insulin)

## Análise Exploratória>
Usar o boxplot para identificar outliers:
boxplot(diabetes2)
## Criação de histogramas para visualizar a distribuição dos dados:
hist(diabetes2$Pregnancies)
hist(diabetes2$Age)
hist(diabetes2$BMI)

# Construção do modelo preditivo em treino e teste:
# Divisão dos dados
install.packages("caTools")
library(caTools)  <- carregar o pacote

#Divisão dos dados em treino e teste - 70% dos dados para treino e 30% dos dados para teste.

set.seed(123)
index = sample.split(diabetes2$Pregnancies, SplitRatio = .70)   <- Funçao com dois parâmetros, o 1°'coluna do do dataset, parâmetro 'splitRatio' - Relação de divisão.
index

# Criar dois conjunto de dados: Um para treino 70% e 30% para teste
train = subset(diabetes2, index == TRUE)
test = subset(diabetes2, index == FALSE)

# Para verificar se foi feita a divisão corretamente usa-se:
dim(diabetes2)
Resultado:  712 obs of 9 variaveis
dim(train)
498 obs of 9 variaveis
dim(test)
214 of 9 variáveis

# Agora que os dados estão divididos, iremos criar o modelo com a função 'train()' do pacote 'caret'

install.packages("caret")
install.packages("e1071")

library(caret)
library(e1071)   

# Treinando a primeira versão do modelo - KNN:
#'Outcome ~.' como variável resposta sendo que o ponto no final significa que as outras variáveis serão usadas como preditoras.
		# É possível utilizar apenas algumas variáveis preditoras, informando individualmente depois do caractere tio '~'.
#Parâmetro data = train 
# Parâmetro method deve-se inserir o algoritmo a ser utilizado. 'knn'
Sendo assim, a sintaxe é:

	modelo <- train(
		Outcome ~., data = train, method = 'knn')

modelo$results < - Teremos o melhor valor de 'K'
modelo$bestTune
modelo$results
  k  Accuracy     Kappa AccuracySD    KappaSD
 5 0.6994301 0.3304260 0.02891085 0.05206534
 7 0.7122624 0.3542100 0.02964882 0.05515594
 9 0.7292772 0.3900502 0.02653426 0.05508801
> modelo$bestTune
  k
 9

#Treinando a segunda versão do modelo - testando o comportamento do modelo com outros valores de k
Sendo assim é necessário inserir um intervalo de valores para o parâmetro 'tuneGrid' da função 'train()'
modelo2 <- train(
  Outcome ~., data = train, method = "knn",
  tuneGrid = expand.grid(k = c(1:20)))

O valor k9 teve o melhor desenpenho, com acurácia de 72%.

### Treinando a terceira versão do modelo - Naive bayes:
install.packages("naivebayes")
library(naivebayes)

modelo3 <- train(
  Outcome ~., data = train, method = "naive_bayes")

#Visualizando os resultados do modelo
modelo3$results
modelo3$bestTune

 Outcome ~., data = train, method = "naive_bayes")   ## Com esse algoritmo, a acurácia foi maior, de 75%.
> modelo3$results
  usekernel laplace adjust  Accuracy     Kappa AccuracySD    KappaSD
1     FALSE       0      1 0.7591054 0.4602829 0.02024163 0.04927343
2      TRUE       0      1 0.7428681 0.4228983 0.02839154 0.06401695
> modelo3$bestTune
  laplace usekernel adjust
1       0     FALSE      1


### Treinando a quarta versão do modelo - randomForest 
install.packages("randomForest")
library(randomForest)

modelo4 <- train(
  Outcome ~., data = train, method = "rpart2"
)

modelo4$results
  maxdepth  Accuracy     Kappa AccuracySD    KappaSD
1        1 0.7011515 0.3295232 0.04800947 0.08027179
2        2 0.7206774 0.3363327 0.04137119 0.08169853
3        3 0.7117133 0.3351991 0.03181717 0.06471408

#Verificando a importância das váriaveis para o aprendizado do modelo
varImp(modelon4$finalModel)

varImp(modelo4$finalModel)
                           Overall
Age                      23.902489
BMI                      33.891176
DiabetesPedigreeFunction  7.012698
Glucose                  46.255240
Insulin                  13.313459
Pregnancies              10.276057
SkinThickness             4.429762
BloodPressure             0.000000

#As colunas "Insulin e Blood Pressure" não contribuem muito para o aprendizado do modelo  
#Sendo assim , excluir essas colunas. Treinando o modelo sem as colunas "Insulin e BloodPressure" - train[,c(-3,-5)] exclui as colunas
ATENÇÃO - renomear a variável 'modelo4' para 'modelo4_1'.

modelon4_1 <- train(
  Outcome ~., data = train[,c(-3,-5)], method = "rpart2"
)

Resultado no console:

modelon4_1
CART 

498 samples
  6 predictor
  2 classes: '0', '1' 

No pre-processing
Resampling: Bootstrapped (25 reps) 
Summary of sample sizes: 498, 498, 498, 498, 498, 498, ... 
Resampling results across tuning parameters:

  maxdepth  Accuracy   Kappa    
  1         0.7030888  0.3471281
  2         0.7294555  0.3608912
  3         0.7238857  0.3663172

Accuracy was used to select the optimal model using the largest value.
The final value used for the model was maxdepth = 2.

# Visualizando a arvore de decisão
plot(modelon4_1$finalModel)
text(modelon4_1$finalModel)

MODELO 05:

install.packages("kernlab")
library(kernlab)

set.seed(100)
modelo5 <- train(
  Outcome ~., data = train, method = "svmRadialSigma"
  ,preProcess=c("center")
)

modelo5$results
modelo5$bestTune

# Avaliando os modelos, para isso usamos a função 'predict'. Essa função retorna as previsções com base no modelo treinado.
?predict

#Testando o modelo com os dados de teste
predicoes5 <- predict(modelo5,test)

# Visualizando o resultado das prediçoes do modelo
predicoes5

###Com as previsões geradas pelo modelo, vamos comparar com os dados esperados do conjunto de dados de treino.
## Para isso devemos chamar a função 'confusionMatrix', para calcular a diferença entre os valores previstos e os valores esperados.
sintaxe: confusionMatrix(predicoes5, test$Outcome)
Reesultado no console:

> confusionMatrix(predicoes5, test$Outcome)
Confusion Matrix and Statistics

          Reference
Prediction   0   1
         0 133  27
         1  16  38
                                         
               Accuracy : 0.7991         
                 95% CI : (0.739, 0.8506)
    No Information Rate : 0.6963         
    P-Value [Acc > NIR] : 0.0004692      
                                         
                  Kappa : 0.5011         
                                         
 Mcnemar's Test P-Value : 0.1272627      
                                         
            Sensitivity : 0.8926         
            Specificity : 0.5846         
         Pos Pred Value : 0.8313         
         Neg Pred Value : 0.7037         
             Prevalence : 0.6963         
         Detection Rate : 0.6215         
   Detection Prevalence : 0.7477         
      Balanced Accuracy : 0.7386         
                                         
       'Positive' Class : 0          



predicoes4 <- predict(modelo4,test)
predicoes4
confusionMatrix(predicoes4, test$Outcome)
###Predições de acurárcia um pouco menor nas cadas decimais, para o o algoritmo 'randomForest'



 confusionMatrix(predicoes4, test$Outcome)
Confusion Matrix and Statistics

          Reference
Prediction   0   1
         0 132  27
         1  17  38
                                         
               Accuracy : 0.7944         
                 95% CI : (0.734, 0.8465)
    No Information Rate : 0.6963         
    P-Value [Acc > NIR] : 0.000824       
                                         
                  Kappa : 0.4919         
                                         
 Mcnemar's Test P-Value : 0.174844       
                                         
            Sensitivity : 0.8859         
            Specificity : 0.5846         
         Pos Pred Value : 0.8302         
         Neg Pred Value : 0.6909         
             Prevalence : 0.6963         
         Detection Rate : 0.6168         
   Detection Prevalence : 0.7430         
      Balanced Accuracy : 0.7353         
                                         
       'Positive' Class : 0              


predicoes3 <- predict(modelo3, test)

predicoes3
confusionMatrix(predicoes3, test$Outcome)                                       
# Tivemos uma acurácia de predição de 74% para o algoritmo 'naive_bayes'

confusionMatrix(predicoes3, test$Outcome)
Confusion Matrix and Statistics

          Reference
Prediction   0   1
         0 120  25
         1  29  40
                                          
               Accuracy : 0.7477          
                 95% CI : (0.6839, 0.8044)
    No Information Rate : 0.6963          
    P-Value [Acc > NIR] : 0.05745         
                                          
                  Kappa : 0.4136          
                                          
 Mcnemar's Test P-Value : 0.68309         
                                          
            Sensitivity : 0.8054          
            Specificity : 0.6154          
         Pos Pred Value : 0.8276          
         Neg Pred Value : 0.5797          
             Prevalence : 0.6963          
         Detection Rate : 0.5607          
   Detection Prevalence : 0.6776          
      Balanced Accuracy : 0.7104          
                                          
       'Positive' Class : 0    


predicoes2 <- predict(modelo2,test)
predicoes2
confusionMatrix(predicoes2, test$Outcome)

## Modelo 'knn' com uma acurácia de 71% nas predições. ###

Confusion Matrix and Statistics

          Reference
Prediction   0   1
         0 118  31
         1  31  34
                                          
               Accuracy : 0.7103          
                 95% CI : (0.6445, 0.7701)
    No Information Rate : 0.6963          
    P-Value [Acc > NIR] : 0.3583          
                                          
                  Kappa : 0.315           
                                          
 Mcnemar's Test P-Value : 1.0000          
                                          
            Sensitivity : 0.7919          
            Specificity : 0.5231          
         Pos Pred Value : 0.7919          
         Neg Pred Value : 0.5231          
             Prevalence : 0.6963          
         Detection Rate : 0.5514          
   Detection Prevalence : 0.6963          
      Balanced Accuracy : 0.6575          
                                          
       'Positive' Class : 0          


# Realizando predições:

#Criando um dataframe apenas com o registro de um unico paciente para simular a utilização do modelo
novos.dados <- data.frame(
  Pregnancies = c(3),           
  Glucose = c(111.50),
  BloodPressure = c(70),
  SkinThickness = c(20),          
  Insulin = c(47.49),
  BMI = c(30.80),       
  DiabetesPedigreeFunction = c(0.34),
  Age = c(28)                     
)

Resultado no console no ambiente de desenvolvimento:
paciente1
  Pregnancies Glucose BloodPressure SkinThickness Insulin  BMI
1           3   111.5            70            20   47.49 30.8
  DiabetesPedigreeFunction Age
1                     0.34  28



#Utilizando o modelo para gerar a previsão - passando os dados do paciente
       

previsao1 <- predict(modelo5,paciente1) 
resultado1 <- ifelse(previsao1 == 1, "Positivo","Negativo")
print(paste("Resultado:",resultado1))
Results no console:
	'NEGATIVO'

### VISUALIZAÇÃO DOS RESULTADOS:  ENTREGA DE RELATÓRIOS ###
Obs: Para entregar os resultados da análise, é necessário utilizar a função 'write.csv()' e aplicar o data frame,'paciente1' e o nome do arquivo'resultado1.csv'
write.csv(paciente1,'resultado1.csv')

#Lendo o arquivo de previsões que foi gerado:
resultado1.csv <- read.csv('resultado1.csv')

#Alterando o nome das colunas do dataframe:
names(resultado.csv) <- c('Indice','Valor previsto')

#Visualizando o dataframe
resultado.csv

REsultado no console:

resultado1.csv
  Indice Valor previsto    NA NA NA    NA   NA   NA NA
      1              3 111.5 70 20 47.49 30.8 0.34 28

### Para emitar o relatório é necessário usar o pacote'markdown' para formatar seus relatórios:
#Instalação do Rmarkdown
install.packages("rmarkdown")
install.packages('tinytex')
library(tinytex)

# Próximos passos

# Criar um arquivo R Markdown: File > New File RMarkdown
# Criar script
# Gerar Relatório: Knit > Knit to PDF

Obs: O documento 'rmarkdown' consiste em blocos de código e blocos de textos para documentar a análise.
##  Obs: Para inserir mais blocos de cógido, no ambiente 'source' no menu 'insert' e clicar em opção 'R'.
Obs: PARA GERAR UM DOCUMENTO (EMITIR) È NECESSÁRIO SELECIONAR 'KNIT', LOCALIZADO A ESQUERDA DA JANELA 'SOURCE' E CLICAR EM 'KNIT TO PDF'.

## Criando gráficos

Você também pode adicionar gráficos, por exemplo:

```{r pressure, echo=FALSE}
plot(pressure)
```

Observe que o parâmetro `echo = FALSE` foi adicionado ao código para evitar a impressão do código R que gerou o gráfico.


Agora você pode realizar suas análises (carregar, tratar, explorar os dados), 
gerar gráficos e em seguida gerar um relatório da sua análise em pdf, html ou DOC

#  No relatório 'rmarkdown':
Obtendo os dados:

'''{r}

diabetes<- read.csv("C:/Users/Daniel/Desktop/Pós-graduação- Análise de dados e Math/Rstudio/diabetes.csv "
)

head(diabetes)

resultado1<- read.csv ("C:/Users/Daniel/Documents/resultado1.csv")
