salarios <- c(2000,3000,1500,2500,1800,0,0)
horas <- c(44,40,38,40,44,0,0)

funcionarios <-matrix(c(salarios,horas),nrow=2,ncol=7,byrow=T)
funcionarios
     [,1] [,2] [,3] [,4] [,5] [,6] [,7]
[1,] 2000 3000 1500 2500 1800    0    0
[2,]   44   40   38   40   44    0    0

# Criar dois vetores para dar os nomes para as linhas e colunas:
colunas <-c('Joao','Pedro','Antonio','Celso','Maria','-|-Total','Media')
linhas <- c('Salario','Horas Trabalhadas')

colnames(funcionarios) <- colunas
rownames(funcionarios) <- linhas
funcionarios
funcionarios
                  joao pedro antonio celso maria -|- Total Média
Salario           2000  3000    1500  2500  1800         0     0
Horas Trabalhadas   44    40      38    40    44         0     0


funcionarios[,6]=rowSums(funcionarios)
funcionarios[,7]=round(rowMeans(funcionarios),2)

 funcionarios
                  joao pedro antonio celso maria -|- Total   Média
Salario           2000  3000    1500  2500  1800     10800 3600.00
Horas Trabalhadas   44    40      38    40    44       206   68.67
