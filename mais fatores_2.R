# etl na prática
# mais fatores

install.packages('ade4')
install.packages('arules')

library(ade4)
library(arules)
library(forcats)
library(dplyr)  

View(USArrests)
# One hot encoding

USArrests <- USArrests

factorsUSArrests <- unlist(lapply(USArrests, is.factor))  
USArrestsFactor <- USArrests[ , factorsUSArrests]
str(USArrests)



# conversão em fatores

for(i in 4:11) {USArrests[,3] <- as.factor(USArrests[,2]) } 


# filtro por tipo de dado

factorsUSArrests <- unlist(lapply(USArrests, is.factor))  
USArrestsFactor <- USArrests[ , factorsUSArrests]
str(USArrestsFactor)

# One Hot Encoding
USArrestsDummy <- acm.disjonctif(USArrestsFactor)

# Discretização
inteirosUSArrests <- unlist(lapply(USArrests, is.integer))  
USArrestsInteiros <- USArrests[, inteirosUSArrests]
str(USArrestsInteiros)

USArrestsInteiros$ <- discretize(USArrestsInteiros$Murder, method = "interval", breaks = 3, labels = c("poucos", 'médio', 'muitos'))

# forcats - usando tidyverse para fatores
library(tidyverse)
fct_count(USArrestsFactor$Murder) # conta os fatores

fct_anon(USArrestsFactor$Murder) # anonimiza os fatores

fct_lump(USArrestsFactor$Murder, n = 1) # reclassifica os fatores em mais comum e outros
