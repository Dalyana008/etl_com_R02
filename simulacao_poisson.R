# o R como calculadora

binomialnegSimulacao <- rnbinom(500, mu = 3, size = 10)

poissonSimulacao <- rpois(500, 3)

hist(binomialnegSimulacao)
hist(poissonSimulacao)

binomialnegSimulacao + poissonSimulacao 

poissonSimulacao + 200 

poissonSimulacao^2

poissonSimulacao * binomialnegSimulacao 

round(distNormalSimulacao, 0)

ceiling(distNormalSimulacao) 

floor(distNormalSimulacao) 

distNormalSimulacao %% poissonSimulacao # módulo dos vetores



# média
mean(poissonSimulacao)
mean(binomialnegSimulacao)

# mediana
median(poissonSimulacao)
median(binomialnegSimulacao)

# desvio padrão
sd(poissonSimulacao)
sd(binomialnegSimulacao)

# variância
var(poissonSimulacao)
var(binomialnegSimulacao)

#  simulação poisson
poissonSimulacaoCentral <- poissonSimulacao - mean(poissonSimulacao)
hist(poissonSimulacao)
hist(poissonSimulacaoCentral)
