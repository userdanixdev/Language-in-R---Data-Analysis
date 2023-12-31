FATORES:
A chamada da função de fatores é: factor()
É necessário criar uma variável, inerente ao contexto, para usar a função.
Variável UF ( Unidade Federativa ) Sendo assim:

UF <- factor(c("DF","SP","RJ","RS"))
As métricas ou categorias do fator aparecerão na tela ( console ) inclusive no enviroment, que no caso são 4 levels.
[1] DF SP RJ RS
Levels: DF RJ RS SP
Para ordenar os fatores é necessário acionar dois parâmetros:
	- levels
	- ordered
Obs: é importante listar em ordem CRESCENTE.

===================================================================================

grau.instrucao <- factor(c("Nível Médio,"Superior","Fundamental"),
			levels = c("Fundamental","Nível Médio","Nível Superior"),
			ordered = TRUE)

======================================================================================
