# tipo de estrutura de  dados no R

# criando fatores (estruturas)
# Códigos do livro An Introduction to data cleaning with R

# criando fator
TimesserieC <- c(1, 2, 0, 1, 2, 2, 2, 2, 1, 0, 1, 1, 1, 1)
recode <- c(Nautico = 1, operario = 2)
TimesserieC<- factor(TimesserieC, levels = recode, labels = names(recode))
str(TimesserieC)
