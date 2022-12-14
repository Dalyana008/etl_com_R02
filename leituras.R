##########

library(microbenchmark)

exporta em formato tabular (.csv) - padrão para interoperabilidade
write.csv2(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.csv")

# exporta em formato rda (.rda)
save(sinistrosRecife,file = 'bases_tratadas/sinistrosRecife.rda')

# carrega base de dados em formato nativo R
sinistrosRecife <- readRDS('bases_tratadas/sinistrosRecife.rds')

# carrega base de dados em formato tabular (.csv) - padrão para interoperabilidade
sinistrosRecife <- read.csv2('bases_tratadas/sinistrosRecife.csv', sep = ';')

# carrega base de dados em formato nativo R
load(file = 'bases_tratadas/sinistrosRecife.rda')
# compara os dois processos de exportação, usando a função microbenchmark

microbenchmark(a <- saveRDS(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.rds"), b <- write.csv2(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.csv"), times = 30L)

microbenchmark(a <- readRDS('bases_tratadas/sinistrosRecife.rds'), b <- read.csv2('bases_tratadas/sinistrosRecife.csv', sep = ';'), times = 10L)

microbenchmark(a <- save(sinistrosRecife,file = 'bases_tratadas/sinistrosRecife.rda'), b <- load(file = 'bases_tratadas/sinistrosRecife.rda'), times = 10L)

