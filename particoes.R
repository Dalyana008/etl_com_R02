# amostragem sem reposição usando função sample
sample(distNormalSimulacao, 15, replace = FALSE) 
# amostragem com reposição usando função sample
sample(distNormalSimulacao, 15, replace = TRUE)

# bootstraping com função replicate
set.seed(412) 

bootsDistNormal10 <- replicate(10, sample(distNormalSimulacao, 10, replace = TRUE)) 
bootsDistNormal10

# calculando uma estatística com bootstrapping (10 amostras)

mediaBootsNormal10 <- replicate(10, mean(sample(distNormalSimulacao, 10, replace = TRUE))) 

mediaBootsNormal50 <- replicate(50, mean(sample(distNormalSimulacao, 10, replace = TRUE)))

mediaBootsNormal100 <- replicate(100, mean(sample(distNormalSimulacao, 10, replace = TRUE)) 

# vamos comparar???

mean(mediaBootsNormal10) 
mean(mediaBootsNormal50) 
mean(mediaBootsNormal100) 
mean(distNormalSimulacao) 

# partições
install.packages('caret', dependencies = T) 
library(caret)

# partições de dados
particaoDistNormal <- createDataPartition (1:length(distNormalSimulacao), p=.7) 
treinoDistNormal <- distNormalSimulacao[unlist(particaoDistNormal)] 
testeDistNormal <- distNormalSimulacao[- unlist(particaoDistNormal)]

