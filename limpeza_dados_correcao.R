library(funModeling)

# etl com R
# limpeza dos dados

# Caregando dados ( covid- 19 mundo)

general_data <- fread("https://covid.ourworldindata.org/data/owid-covid-data.csv") 

# identificando os países 

South_america_countries <-c("Colombia", "Chile", "Brazil", "Costa Rica", "Peru", "Ecuador", "Guatemala", "Honduras", "Mexico", "Nicaragua", "Panama", "Paraguay", "Peru", "Uruguay", "Venezuela") 

south_america <- general_data %>% filter(location %in% South_america_countries) 

south_america <- south_america %>% select(location, new_cases, new_deaths)

status(south_america) 
freq(south_america) 
plot_num(south_america) 
profiling_num(south_america) 

south_america %>% filter(new_cases < 0)

south_america <- south_america %>% filter(new_cases>=0)

data_omit <- na.omit(south_america)

