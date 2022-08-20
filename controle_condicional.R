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
irisCopia$SpeciesDummy <- ifelse(irisCopia$Species == 'setosa', 1, 0)

# estrutura de repetição
par(mfrow = c(2, 2)) 
for (i in 1:4) { 
  x <- iris[ , i] 
  hist(x,
       main = paste("Variável", i, names(iris)[i]), 
       xlab = "Valores da Variável", # rótulo do eixo x
       xlim = c(0, 10)) 

lapply(iris[, 1:4], hist)

