# função
f <- function() {
  cat("Hello, world!\n")
}
f()

# função com estrutura de repetição
f <- function(nro) {
  for(i in 1:nro) {
    cat("To cansada,vou dormir!\n")
  }
}
f(3)

# função com estrutura condicional e de repetição
f <- function(nro) {
  if(nro < 200) {
    for(i in 1:nro) {
      cat("to cansada,ja deu por hoje!\n")
    }
  } else {
    cat("Tá de brincadeira imprimir isso tudo")
  }
}
f(99)
f(100)

# funçao
centralizacao <- function(x) {
  x <- x - mean(x)
  return(x)
}

centralizacao(mtcars$mpg.Length)

centralizacao <- function(x) {
  x <- x - mean(x)
}

centralizacao(mtcarsCopia$mpg.Length)
centroTeste <- centralizacao(mtcarsCopia$mpg.Length)
