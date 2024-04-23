
Analistas do mercado de capitais são profissionais que emitem recomendações de compra ou de venda de ações que podem ser
utilizadas por diversos interessados. Há vários estudos sobre os analistas, 
entre eles aqueles que buscam identificar variáveis que influenciam na acurácia de suas recomendações.

Um desses estudos pode ser conferido, na íntegra, nesta página da internet.
Parte da base de dados utilizada no estudo está disponível no arquivo "analistasMC", disponível neste link.

Esta atividade utilizará as seguintes variáveis:

ACUR: medida de acurácia dos analistas - quanto mais próxima de zero, menos os analistas erram em suas previsões;
logVM: logarítimo do valor de mercado da empresa, como medida do seu tamanho.

Um possível objetivo para a pesquisa relacionada aos analistas é o de verificar a relação entre a acurácia das suas previsões e o
tamanho da empresa, ou seja, testar a hipótese de que a acurácia dos analistas pode aumentar conforme aumenta o tamanho da empresa.

O modelo de regressão linear poderia ser escrito da seguinte maneira: ACUR = β0 + β1 logVM + ε 

Depois de executar a Regressão Linear Simples no R, utilizando a variável dependente ACUR e a variável independente logVM, julgue as afirmações a seguir como "Verdadeira" ou "Falsa":

O R2 (Multiple R-squared) mostra que o modelo de regressão linear simples explica pouco mais de 4% das variações que ocorrem na variável ACUR.
