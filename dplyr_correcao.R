# Etl na pratica 
# Atividade dplyr

library(dplyr)

# dados utilizados
View(sinistrosRecifetotal)

# sumários

count(sinistrosRecifetotal, natureza_acidente) 

# sumários com agrupamentos
sinistrosRecifetotal %>% group_by(natureza_acidente) %>% summarise(avg = mean(10))

# Transformação de Casos

sinistrosRecifetotal %>%  filter(natureza_acidente!= "COM VÍTIMA") %>% summarise(avg = mean(20))

sinistrosRecifetotal %>%  filter(natureza_acidente= "COM VÍTIMA") %>% group_by(natureza_acidente, bairro) %>% summarise(avg = mean(10)

# ordenar casos

arrange(sinistrosRecifetotal, natureza_acidente) # ascendente
arrange(sinistrosRecifetotal, desc(natureza_acidente)) # descendente

# Transformação de Variáveis

# seleção de colunas
sinistrosRecifetotal%>% select(natureza_acidente, situacao, bairro) %>% arrange(natureza_acidente)

# novas colunas
sinistrosRecifetotal %>% mutate(danos.imateriais = natureza_acidente)

# renomear
sinistrosRecifetotal %>% rename(Reach = natureza_acidente)
