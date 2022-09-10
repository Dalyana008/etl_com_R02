# etl na prática


#install.packages("microbenchmark")
sinistrosRecife <-("bases_tratadas")
library(microbenchmark)

install.packages('writexl')
library(writexl)

write_xlsx(sinistrosRecife, "bases_tratadas/sinistrosRecife.xlsx")

sinistrosRecifeRaw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/3531bafe-d47d-415e-b154-a881081ac76c/download/acidentes-2019.csv', sep = ';', encoding = 'UTF-8')


# exporta em formato nativo do R
saveRDS(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.rds")

# exporta em formato tabular (.csv) - padrão para interoperabilidade
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

