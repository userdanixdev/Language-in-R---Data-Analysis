---
title: "Medidas Numéricas Descritivas"
author: "Daniel Martins França"
date: "2024-04-16"
output: html_document
---

```{r setup, include=TRUE}
knitr::opts_chunk$set(echo = TRUE)
```
<h2> Base de dados mtcars </h2>
<p> Apresenta o consumo de combustível, em milhas por galão e outros 10 aspectos
relacionados ao design e a performance de 32 modelos de automóveis. </p>
<p> Para este estudo foram selecionadas 3 variáveis:</p>
[,1] mpg: milhas por galão </br>
[,6] wt: peso do veículo   
[,9] am: tipo de transmissão (0=Auto,1=Manual)</br>  
```{r mt cars}
str(mtcars[,c(1,6,9)])
```
<h3>Medidas numéricas descritivas <h3>
Para a variável mpg:
```{r Medidas Numerica Descritiva}
mean(mtcars$mpg)
median(mtcars$mpg)
var(mtcars$mpg)
sd(mtcars$mpg)
quantile(mtcars$mpg)


```
<h3>Resumo numérico descritivo<h3>
```{r ResNumDesc}
summary(mtcars[,c(1,6,9)])
RcmdrMisc::numSummary(mtcars$mpg,
           statistics=c('mean','sd','IQR','Quantiles'),
           quantiles=c(0,.25,.5,.75,1),
           groups = mtcars$am)

```
<h2>Identificação de Outliers</h2>
```{r outliers}
boxplot(mtcars[,c(1,6,9)])
par(mfcol=c(1,3))
boxplot(mtcars[,1],main='mpg')
boxplot(mtcars[,6],main='wt')
boxplot(mtcars[,9],main='am')

library('DescTools')
Outlier(mtcars$wt)
