# carrega as bibliotecas
pacman::p_load(ade4, car, caret, corrplot, data.table, dplyr, forcats, funModeling, ggplot2, mlbench, mltools, randomForest, rattle, tidyverse)

# leitura da base de dados
sinistros_recife_2021 <- read.csv2("http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2021-jan.csv", sep = ';', encoding = 'UTF-8',
stringsAsFactors = T)



# carregando a base já tratada para o ambiente do R

sinistros_recife_2021 <- sinistros_recife_2021

View(sinistros_recife_2021)

#dumies
sinistros_recife_2021_raw <- acm.disjonctif(as.data.frame(sinistros_recife_2021$mao_direcao)) 


sinistros_recife_2021 <- cbind(sinistros_recife_2021, sinistros_recife_2021_raw)

# AED 
status(sinistros_recife_2021) # explorar a qualidade das variáveis
freq(sinistros_recife_2021) # explorar os fatores
plot_num(sinistros_recife_2021) # exploração das variáveis numéricas
profiling_num(sinistros) # estatísticas das variáveis numéricas

corrplot(cor(sinistros_recife_2021[ , c(14:16)])) # correlação entre as variáveis

# Treino e Teste: Pré-processamento
particaosinistros = createDataPartition(sinistros_recife_2021$mao_direcao, p=.7, list = F) # cria a partição 70-30


treinosinistro = sinistros_recife_2021[particaosinistros, ] # treino
testesinistro = sinistros_recife_2021[-particaosinistros, ] # - treino = teste

# Validação Cruzada: Pré-processamento
# Controle de treinamento
train.control <- trainControl(method = "cv", number = 10, verboseIter = T) # controle de treino

# Treinamentos
## Regressão Linear

sinistros_recife_2021_LM <- train(mao_direcao ~ vitimas + direcao + viatura + caminhao + data = treinosinistro, method = "lm", trControl = train.control)
summary(sinistro_LM) # sumário do modelo linear
 # NÃO ESTÁ RODANDO

## Árvore de Decisão
sinistros_recife_2021_RPART <- train(mao_direcao ~ viatura + vitimas + caminhao + onibus, data = treinosinistro, method = "rpart", trControl = train.control)

summary(sinistros_recife_2021_RPART)

fancyRpartPlot(sinistros_recife_2021_RPART$finalModel) # desenho da árvore
plot(varImp(sinistros_recife_2021_RPART)) # importância das variáveis

# Bagging com Floresta Aleatória
sinistros_recife_2021_RF <- train(mao_direcao ~ viatura + vitimas + caminhao + onibus, data = treinosinistro, method = "cforest", trControl = train.control)

plot(sinistros_recife_2021_RF) # evolução do modelo
plot(varImp(sinistros_recife_2021_RF)) # plot de importância

# Boosting com Boosted Generalized Linear Model
sinistros_recife_2021_ADA <- train(mao_direcao ~ viatura + vitimas + caminhao + onibus, data = treinosinistro, method = "glmboost", trControl = train.control)

plot(sinistros_recife_2021_ADA) # evolução do modelo
print(sinistros_recife_2021_ADA) # modelo
summary(sinistros_recife_ADA) # sumário

melhor_modelo <- resamples(list(LM = sinistros_recife_2021_LM, RPART = sinistros_recife_2021_RPART, RF = sinistros_recife_2021_RF, ADABOOST = sinistros_recife_2021_ADA))
melhor_modelo

summary(melhor_modelo)

predVals <- extractPrediction(list(sinistros_recife_2021_RF), testX = testesinistros[, c(4, 16:17)], testY = testesinistro$mao_direcao) 

plotObsVsPred(predVals)
