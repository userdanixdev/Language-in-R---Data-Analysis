nome = 'joaquim'
cores = c('verde','vermelho')
pi = 3.1415
logico = c(TRUE,FALSE)
matriz = matrix(1:6,ncol=2,byrow=T)
lista = list(nome,cores,pi,logico,matriz)
names(lista)<-c('Nome','Cores','PI','Lógicos','Matriz')
lista

> lista
$Nome
[1] "joaquim"

$Cores
[1] "verde"    "vermelho"

$PI
[1] 3.1415

$Lógicos
[1]  TRUE FALSE

$Matriz
     [,1] [,2]
[1,]    1    2
[2,]    3    4
[3,]    5    6
