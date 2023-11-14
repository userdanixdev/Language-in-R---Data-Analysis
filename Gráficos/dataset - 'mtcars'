GRÁFICOS:
'mtcars' - dataset padrão R
Descrição:
Os dados foram extraídos da revista Motor Trend US de 1974 e compreendem o consumo de combustível e
 10 aspectos do design e desempenho de automóveis para 32 automóveis (modelos de 1973 a 1974).
No caso deste dataset usaremos as colunas 1, 2 e 9, respectivamente 'mpg','cyl','am'.
carros <- mtcars[,c(1,2,9)]
# Primeiro gráfico será o HISTOGRAMA:
O nome da função é hist(), sendo assim:
hist(carros$mpg)  
#MPG significa milhas por galão – ou milhas percorridas divididas por milhas percorridas.
 É uma maneira de medir a economia de combustível de um carro.
# Gráfico de dispersão:
plot(carros$mpg,carros$cyl)
#install.packages("ggplot2")
library(ggplot2)

ggplot(carros,aes(am))+
	geom_bar()
