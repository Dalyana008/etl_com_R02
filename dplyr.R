# etl na prática
# base nativa do R

data_frame("starwars")
# sumários
count(starwars, species) 

# sumários com agrupamentos
starwars %>% group_by(species) %>% summarise(avg = mean(height))

### Transformação de Casos

# seleção de casos
starwars %>%  filter(species != "Droid") %>% summarise(avg = mean(height))
starwars %>%  filter(species != "Droid") %>% group_by(species, gender) %>% summarise(avg = mean(height))

# ordenar casos
arrange(starwars, mass) # ascendente
arrange(starwars, desc(mass)) # descendente

### Transformação de Variáveis

# seleção de colunas
starwars %>% select(name, species, homeworld) %>% arrange(name)

# novas colunas
starwars %>% mutate(massheight = mass/height)

# renomear
starwars %>% rename(world = homeworld)

