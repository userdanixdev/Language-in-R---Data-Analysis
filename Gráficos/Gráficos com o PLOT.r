# Exemplo 01:
  sexo = c('Masculino','Ferminino','Masculino','Ferminino','Masculino','Ferminino',
           'Masculino','Ferminino','Masculino','Ferminino','Masculino','Ferminino')
sexo = factor(sexo)

#Plot do gráfico:
  plot(x = sexo,
       main = 'Sexo dos alunos da turma XYZ',
       sub = 'Fonte: Elaborado pelos autores',
       xlab = 'Sexo', ylab='Frequência')

### Gráfico com duas variáveis:
## Utilizado o dataset padrão nativo do R : 'cars'
cars = cars
summary(cars)
plot(cars$speed,cars$dist, main = 'Speed and Stopping Distance',
     sub = 'Ezekiel, M (1930) Methods of Correlation Analysis.',
     xlab = 'Speed', ylab = 'Distance')

# Parâmetros gerais com a função 'par', fora da indentação:

parametro = par(bg = 'gray',  <-- BG = Background
                cex.main = 2.0, <-- Tamanho da fonte
                col.main = 'red',  <--  Cor do título
                col.axis = 'blue', <--- Cor dos eixos do gráfico
                col.lab =  'red', <-- Cor do títulos dos eixos X e Y
                family = 'mono', <-- Formato das letras
                fg = 'black' <--- Cor interna do gráfico

                
                



