install.packages ("ggplot2")
install.packages ("esquisse")

# Carregando os pacotes:
library(esquisse)
library(ggplot2)

# Dataset nativo do R : DIAMONDS
diamonds = diamonds 
?diamonds
"Prices of over 50,000 round cut diamonds" - Preços de mais de 50.000 diamantes lapidados

ggplot(diamonds) +
  aes(x = clarity, fill = color) +
  geom_bar() +
  scale_fill_hue(direction = 1) +
  labs(
    x = "PUREZA",
    y = "CONTAGEM",
    title = "Diamantes",
    subtitle = "Nível de pureza dos diamantes",
    caption = "Fonte: Pacote ggplot2",
    fill = "Cor"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 18L,
    face = "italic",
    hjust = 0.5),
    plot.subtitle = element_text(hjust = 0.5),
    plot.caption = element_text(face = "italic")
  ) +
  facet_wrap(vars(cut))

