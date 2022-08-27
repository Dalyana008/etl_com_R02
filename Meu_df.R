install.packages("eeptools")
library(eeptools)

# vetor com nome das mulheres
nomeMulheres <- c("Joana", "Lucia", "Vera", "Luana", "Ana")

# vetor com idade das mulheres
IdadeMulheres <- c("32", "27", "25", "17", "18")

# vetor filhos
filhosMulheres <- c("FALSE", "TRUE", "TRUE", "FALSE", "FALSE")

# vetor com data de nascimento

nascimentoMulheres <- as.Date(c("1991-05-30", "1989-03-12", "1983-08-20", "1989-05-15", "1993-01-06"))

# vetor com as idades
?age_calc
idadeAluno <- round( age_calc( nascimentoMulheres, units = 'years'))

# data.frame com base nos vetores
# data.frame com base nos vetores
meu.df <- data.frame(nomeMulheres,IdadeMulheres,filhosMulheres,nascimentoMulheres)
