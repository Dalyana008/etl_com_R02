# funções de repetição - família apply

# média de cada variável do data frame iris
apply(iris[ ,-5], 2, mean) 

# sintaxe mais simples
lapply(iris[, -5], mean) 

sapply(iris[, -5], mean) 

# plotagem
par(mfrow = c(2, 2)) 

sapply(iris[ , 1:4], hist)
mapply(hist, iris[ , 1:4], MoreArgs=list(main='Histograma', xlab = 'Valores', ylab = 'Frequência')) 

for (i in 1:4) { # cria o loop, que deve ir de 1 a 4
  x <- iris[ , i] # atribui as colunas da base de dados a uma variável temporária
  hist(x,
       main = names(iris)[i], # atribui o nome ao gráfico de forma incremental, passando coluna por coluna
       xlab = "Valores da Variável", # rótulo eixo x
       ylab = 'Frequência', # rótulo eixo y
       xlim = c(min(iris[, i]), max(iris[, i]))) # limites do eixo x
}

