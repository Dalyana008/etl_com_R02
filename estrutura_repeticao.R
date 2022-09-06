#estrutura condicional

x <- runif(1, 0, 5)  
x

if(x > 3) {
  y <- 5
} else {
  y <- 0
}
y

# avaliação condicional simples
mtcarsCopia$vs <- ifelse(mtcarsCopia$vs = '0', 1, 0)

# estrutura de repetição
par(mfrow = c(2, 2)) 

for (i in 1:4) 
  x <- mtcars[ , i] 
  hist(x,
       main = paste("Variável", i, names(mtcars)[i]), 
       xlab = "Valores da Variável", 
       xlim = c(0, 10)) 
}

lapply(mtcars[, 1:4], hist)
