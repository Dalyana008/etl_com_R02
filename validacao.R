# análise descritiva
# validação


pacman::p_load(data.table, dplyr, tidyverse, validate)

pacman::p_load(data.table, dplyr, tidyverse, validate)

str(iris)
iris_selected <- iris %>% select("Species", "Sepal.Length", "Sepal.Width")

regras_iris_selected <- validator(Species >= 50.0000, Sepal.Width >= 100)

validacao_iris_selected <- confront(iris_selected, regras_iris_selected)

summary(validacao_iris_selected)

plot(validacao_iris_selected)

