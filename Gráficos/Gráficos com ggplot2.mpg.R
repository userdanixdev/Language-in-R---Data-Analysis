## Usando o dataset MPG = Milhas por galão- Consumo de carros - 
## Fuel economy data from 1999 to 2008 for 38 popular models of cars
mpg
summary(mpg)
mpg = mpg
esquisser(mpg)

library(ggplot2)

ggplot(mpg) +
 aes(x = displ, y = hwy, colour = cyl) +
 geom_point(shape = "circle", size = 1.5) +
 geom_smooth(span = 0.75) +
 scale_color_steps() +
 labs(x = "Cilindradas no Motor", y = "Consumo na Estrada (milhas x galão)", 
 title = "Relação entre consumo e cilindradas do motor", subtitle = "O consumo em milhas diminiu quanto mais cilindros tem o motor", 
 caption = "Pacote: ggplot2") +
 theme_minimal() +
 theme(plot.title = element_text(size = 20L, hjust = 0.5), 
 plot.subtitle = element_text(face = "italic", hjust = 0.5))

------------//-----------------//---------------------------//----------------//----------------//-------------------

