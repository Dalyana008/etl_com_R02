pacman::p_load(data.table, dplyr, plotly)

# carregar dados covid19 Pernambuco
covid19PE <- fread('https://dados.seplag.pe.gov.br/apps/basegeral.csv')

covid19PEFai <- covid19PE %>% count(faixa_etaria, sort = T, name = 'casos') %>% mutate(casos2 = sqrt(casos), casosLog = log10(casos))

## outliers em variáveis
# distância interquartil

plot_ly(y = covid19PEFai$casosLog, type = "box", text = covid19PEFai$faixa_etaria, boxpoints = "all", jitter = 0.3)
boxplot.stats(covid19PEFai$casosLog)$out

