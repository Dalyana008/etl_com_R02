
# funçao
centralizacao <- function(x) {
  x <- x - mean(x)
  return(x)
}

centralizacao(mtcars$mpg)

centralizacao <- function(x) {
  x <- x - mean(x)
}

centralizacao(mtcars$mpg)
centroTeste <- centralizacao(mtcars$mpg)
