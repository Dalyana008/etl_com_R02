# vetores
poissonSimulacao[1] 
poissonSimulacao[c(1:10, 15)]

# matrizes
matrix1[ ,1] 
matrix1[1, ] 
matrix1[1,1] 
View(mtcars)
# data.frames
mtcars$Species

mtcars[ , 5] 

mtcars[1:10, 2:5]

mtcars[, 'mpg'] 

mtcars[, 'mpg', drop = FALSE]

mtcars[ , -5] 

# listas
regCarros$coefficients
regCarros$coefficients[1]
regCarros[['coefficients']][1]
regCarros[[1]][1]

# usando operadores lógicos
a <- 5
b <- 7
c <- 5

a < b
a <= b
a > b
a >= b
a == b
a != b

a %in% c(b, c)
a == c & a < b
a != c | a > b
xor(a != c, a < b)
!a != c
any(a != c, a < c, a == c)
all(a != c, a < c, a == c)

# operadores lógicos na prática
mtcars$Sepal.Length <= 0 

mtcars$Sepal.Length >= 0 & mtcars$sepal.Width <= 0.2 

which(mtcars$sepal <= 5) 

match(mtcars$sepal, 'setosa') 
