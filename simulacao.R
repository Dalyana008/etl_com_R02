
# seta a semente aleatória de geração de dados
# usando a função addTaskCallback deixamos a set.seed fixa, rodando no ba
library(dplyr)
Date(starwars)
View(starwars)
hair_color<- addTaskCallback(function(...) {set.seed(123);TRUE})


# distribuição normal simulada
distNormalSimulacao <- rnorm(100)

summary(distNormalSimulacao) # sumário da distNormalSimulacao

# distribuição binomial simulada
distBinominalSimulacao <- rbinom(100, 1, 0.7) # rbinom para criar distribuição binominal, indicando casos, tamanho e probabilidade

# repetições
classeSimulacao <- c(rep("none", length(distBinominalSimulacao)/2), rep("blond", length(distBinominalSimulacao)/2)) 

# sequências
indexSimulacao <- seq(1, length(distNormalSimulacao)) # vetor com índex dos dados, usando a função length para pegar o total de casos

# por fim, podemos usar a função removeTaskCallback para remover a tarefa que criamos lá em cima
removeTaskCallback(hair_color)
