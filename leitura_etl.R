#ETL NA PRÁTICA E LEITURAS



## Importando dados de sinistros da PCR ##
sinistrosRecife2018Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2485590a-3b35-4ad0-b955-8dfc36b61021/download/acidentes_2018.csv',
                                    sep = ';', encoding = 'UTF-8') ## 2018 ##

sinistrosRecife2019Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/3531bafe-d47d-415e-b154-a881081ac76c/download/acidentes-2019.csv',
                                    sep = ';', encoding = 'UTF-8') ## 2019 ##

sinistrosRecife2020Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv',
                                    sep = ';', encoding = 'UTF-8') ## 2020 ##

sinistrosRecife2021Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes2021.csv',
                                    sep = ';', encoding = 'UTF-8') ## 2021 (ate julho) ##

## Concatenando ##

## Transformando nome da coluna 'data' para 'DATA' que possam ser mergidas sem a criacao de uma nova coluna ##
colnames(sinistrosRecife2020Raw)[which(names(sinistrosRecife2020Raw) == "data")] <- "DATA"

sinistrosRecifetotal <- bind_rows(sinistrosRecife2018Raw, sinistrosRecife2019Raw, sinistrosRecife2020Raw)

## Ajustando o formato de data ##
sinistrosRecifetotal$DATA <- as.Date(sinistrosRecifetotal$DATA, format = "%Y-%m-%d")

## Alterando variavel categorica para fator ##
sinistrosRecifetotal$tipo <- as.factor(sinistrosRecifetotal$tipo) ## Tipo do sinistro ##
sinistrosRecifetotal$situacao <- as.factor(sinistrosRecifetotal$situacao) ## Situacao da chamada ##

# Funçao para substituir NA por 0
naZero <- function(x) {
  x <- ifelse(is.na(x), 0, x)
}

## Extracao ##

ls()

for (itm in ls()) { 
  print(formatC(c(itm, object.size(get(itm))), 
                format="d", 
                width=30), 
        quote=F)
}

rm(list = ls()[!ls() %in% c("sinistrosRecifetotal", "naZero")])

## Principais fontes para extracao ##

## Exemplo de extracao .csv (Relacao das pessoas vacinadas - Covid-19)
vacinados_covid <- read.csv2('http://dados.recife.pe.gov.br/dataset/f381d9ea-4839-44a6-b4fe-788239189900/resource/966e9c4c-df45-40d7-9c58-2f13c61a6d28/download/vacinados.csv',
                             sep = ';', encoding = 'UTF-8') ## Vacinados Covid-19 ##

## Exemplo de extracao JSON (Malha cicloviaria do Recife - metadados das rotas operacionais)

malha_cicloviaria <- fromJSON(file = "http://dados.recife.pe.gov.br/dataset/667cb4cf-fc93-4687-bb8f-431550eeb2db/resource/f0fdaad1-080e-40d0-a712-c152509d6f99/download/metadados-malhaoperacionalrecife.json")
malha_cicloviaria <- as.data.frame(malha_cicloviaria)

## Exemplo de extracao de XML (WSU cursos)

WSU_xml <- xmlToDataFrame("http://aiweb.cs.washington.edu/research/projects/xmltk/xmldata/data/courses/wsu.xml")


## Leitura ##

## Exportando o banco de dados nas versoes RDS e CSV 
saveRDS(sinistrosRecifetotal, "bases_tratadas/sinistrosRecife.rds")
write.csv2(sinistrosRecifetotal, "bases_tratadas/sinistrosRecife.csv")

## Carregando as bases de dados

## Exportando o banco de dados nas versoes RDS e CSV 
saveRDS(sinistrosRecifetotal, "bases_tratadas/sinistrosRecife.rds")
write.csv2(sinistrosRecifetotal, "bases_tratadas/sinistrosRecife.csv")

## Carregando as bases de dados
sinistrosRecife <- readRDS('bases_tratadas/sinistrosRecife.rds')
sinistrosRecife <- read.csv2('bases_tratadas/sinistrosRecife.csv', sep = ';')

## Comparando processos
microbenchmark(a <- saveRDS(sinistrosRecifetotal, "bases_tratadas/sinistrosRecife.rds"),
               b <- write.csv2(sinistrosRecifetotal, "bases_tratadas/sinistrosRecife.csv"),
               times = 10L)

microbenchmark(a <- readRDS('bases_tratadas/sinistrosRecife.rds'),
               b <- read.csv2('bases_tratadas/sinistrosRecife.csv', sep = ';'),
               times = 10L)
