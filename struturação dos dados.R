# etl com R
# Estruturação dos dados

library(data.table)

library(dplyr)
library(tidyverse)
library(textshape)


# Carregando base de dados ( covid - 19 no mundo) 
general_data<-fread("https://covid.ourworldindata.org/data/owid-covid-data.csv") 

South_america_countries<-c("Argentina", "Peru", "Colombia", "Brazil")

South <- general_data %>% filter(location %in% South_america_countries)

mSouth <- South %>% group_by(location) %>% mutate(row = row_number()) %>% select(location, new_cases, row)

result <- mSouth %>% group_by(location) %>% filter(row == max(row))
mSouth <- mSouth %>% filter(row<=min(result$row)) 

mSouth <- mSouth %>% pivot_wider(names_from = row, values_from = new_cases) %>% remove_rownames %>% column_to_rownames(var="location") 
