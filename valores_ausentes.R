pacman::p_load(data.table, funModeling, tidyverse) 

idade <- c(floor(runif(70, 0, 80)), NA, NA)
mean(idade)
mean(idade, na.rm = TRUE)

pacman::p_load(corrplot, dplyr, ggplot2)
str(starwars)
iris_selected <- iris %>% select("Species", "Petal.Length", "Petal.Width")
view(iris)

## Shadow Matrix 
iris_selected_matriz <- as.data.frame(abs(is.na(iris_selected))) 

#variáveis com na
iris_selected_matriz_na <- iris_selected_matriz[which(sapply(iris_selected_matriz, sd) > 0)] 

#correlações
round(cor(iris_selected_matriz_na), 5) 

# traz variável de interesse 
iris_selected_matriz_n <- cbind(iris_selected_matriz_na, name = iris_selected_matriz$name) 
