## CORRELAÇÃO COM R ##
# PRIMEIRO, VAMOS CARREGAR OS PACOTES
pacman::p_load(corrplot, dplyr, ggplot2)

# BASE DE DADOS sem variável Murder #
usarrests2 <- USArrests %>% select(-Murder)

# TABELA DE CORRELAÇÃO COM TODAS AS VARIÁVEIS #
cor(usarrests2)

# GRÁFICOS DE DISPERSÃO PAREADOS DAS VARIÁVEIS #
pairs(usarrests2)

# CORRPLOT DAS VARIÁVEIS #
USArrestsCor <- cor(usarrests2)
corrplot(USArrestsCor, method = "number", order = 'alphabet')
corrplot(USArrestsCor, order = 'alphabet') 
