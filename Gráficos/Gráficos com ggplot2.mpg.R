# VARIÁVEIS QUANTITATIVAS $
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
# Editando e aprofundando sobre gráfico ggplot:

ggplot(mpg) +
  aes(x = displ, y  = hwy,fill=drv)+
  geom_point(alpha = 0.8, # <- TRANSPARÊNCIA
             colour = 'red',
             #shape = 24,
             size=2,
             shape = 24)  +
  labs(x = "Cilindradas no Motor", y = "Consumo na Estrada (milhas x galão)", 
       title = "Relação entre consumo e cilindradas do motor",
       subtitle = "O consumo em milhas diminiu quanto mais cilindros tem o motor", 
       caption = "Pacote: ggplot2",fill='Tração') +
  theme_bw()+
  theme(plot.title=element_text(face='bold',colour='red',hjust=0.5,
                                margin=margin(unit='cm')))+
  theme(plot.subtitle =element_text(hjust=0.5,face='italic'),
        plot.caption=element_text(face='italic'),
        axis.title.x=element_text(color='blue'),
        legend.background=element_rect(fill='yellow',linetype = 2),
        legend.title=element_text(face='bold'),
        plot.background = element_rect(fill='gray'),
        panel.background = element_rect(fill='yellow'),
        panel.grid=element_line(colour='gray'),
        panel.border=element_line(face='bold')
        )
        


