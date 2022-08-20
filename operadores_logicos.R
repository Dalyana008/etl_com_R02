# vetores
poissonSimulacao[1] # acessa o primeiro elemento
poissonSimulacao[c(1:10, 15)] # acessa os elementos 1, 2 até 10 e 15

# matrizes
matrix1[1, ] # linha 1
matrix1[ ,1] # coluna 1
matrix1[1,1] # linha 1, coluna 1

# data.frames
iris$Species 

iris[ , 5] 
iris[1:10, 2:5] 

iris[, 'Species'] 
iris[, 'Species', drop = FALSE] 

iris[ , -5] 
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
iris$Sepal.Length <= 0 
iris$Sepal.Length >= 0 & iris$Sepal.Width <= 0.2 
which(iris$Sepal.Length <= 5) 

match(iris$Species, 'setosa')

