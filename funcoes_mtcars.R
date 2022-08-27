# funções de repetição - família apply

# média de cada variável do data frame mtcars
apply(mtcars[ ,-5], 2, mean) 


lapply(mtcars[, -5], mean) 
sapply(mtcars[, -5], mean) 
par(mfrow = c(2, 2)) 
sapply(mtcars[ , 1:4], hist)
mapply(hist, mtcars[ , 1:4], MoreArgs=list(main='Histograma', xlab = 'Valores', ylab = 'Frequência')) 


for (i in 1:4) 
  x <- mtcars[ , i] 
  hist(x,
       main = names(iris)[i], 
       xlab = "Valores da Variável", # rótulo eixo x
       ylab = 'Frequência', # rótulo eixo y
       xlim = c(min(mtcars[, i]), max(mtcars[, i]))) # limites do eixo x
}

