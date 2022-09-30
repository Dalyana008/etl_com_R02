# etl na prática
pacman::p_load(dplyr)

sinistrosRecife2018Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2485590a-3b35-4ad0-b955-8dfc36b61021/download/acidentes_2018.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2019Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/3531bafe-d47d-415e-b154-a881081ac76c/download/acidentes-2019.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2020Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2021Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes2021.csv', sep = ';', encoding = 'UTF-8')

# colunas iguais 

colunas_iguais <- names(sinistrosRecife2020Raw[
  intersect(
    names(sinistrosRecife2020Raw), names(sinistrosRecife2021Raw))])

sinistrosRecife2020Raw <- sinistrosRecife2020Raw %>% select(all_of(colunas_iguais))


view(sinistrosRecife2018Raw)

# mudar nome da coluna TIPO

sinistrosRecife2018Raw <- sinistrosRecife2018Raw %>% rename(tipo = tipo)

sinistrosRecife2018Raw <- sinistrosRecife2018Raw %>%  select(all_of(colunas_iguais))

sinistrosRecife2019Raw <- sinistrosRecife2019Raw %>% rename(tipo = tipo)

sinistrosRecife2019Raw <- sinistrosRecife2019Raw %>%  select(all_of(colunas_iguais))

# unindo as bass de dados 

sinistrosRecifeRaw <- rbind(sinistrosRecife2018Raw, sinistrosRecife2019Raw)

# trnsformando em TIPO
sinistrosRecifeRaw$tipo <- as.Date(sinistrosRecifeRaw$tipo, format = "%Y-%m-%d")

# modificando para factor 
sinistrosRecifeRaw$tipo <- as.factor(sinistrosRecifeRaw$tipo)

# cria funçaõ para substituir not available (na) por 0
naZero <- function(x) {
  x <- ifelse(is.na(x), 0, x)
}

# aplica a função naZero a todas as colunas de contagem
sinistrosRecifeRaw[, 15:25] <- sapply(sinistrosRecifeRaw[, 15:25], naZero)

#Lista os objetos carregados
ls()


for (itm in ls()) { 
  print(formatC(c(itm, object.size(get(itm))), 
                format="d", 
                width=30), 
        quote=F)
}




# Os objetos mais pesados são a base unificada, seguida da base relativa ao ano de 2019.

# Remoção de objetos desnecessários

rm(list = c('sinistrosRecife2020Raw', 'sinistrosRecife2021Raw', 
            'sinistrosRecife2019Raw', 'colunas_iguais', 'colunas_iguais_2'))

