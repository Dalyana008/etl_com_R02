# tipo de estrutura de  dados no R

# criando fatores (estruturas)
# Códigos do livro An Introduction to data cleaning with R

class(c("FM", "def"))
class(1:10)
class(c(pi, exp(1)))
class(factor(c("FM", "def")))

vrNumeric <- c("7", "7*", "7.0", "7,0")
is.numeric(vrNumeric)
as.numeric(vrNumeric)
as.integer(vrNumeric)
as.character(vrNumeric)

is.na(as.numeric(vrNumeric))

vrFactor <- factor(c("M", "F", "M", "F", "M"))
levels(vrFactor)

gender <- c(1, 0, 1, 0, 1,0)
recode <- c(male = 1, female = 0)
(gender <- factor(gender, levels = recode, labels = names(recode)))

(gender <- relevel(gender, ref = "female"))

age <- c(28, 57, 30, 38, 70, 50)
(gender <- reorder(gender, age))

attr(gender, "scores") <- NULL
gender