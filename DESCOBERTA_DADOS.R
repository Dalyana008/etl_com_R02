
# DESCOBERTA DOS DADOS (ANALISE EXPLORATÓRIA)

pacman::p_load(funModeling, tidyverse) 




glimpse(USArrests) # olhada nos dados
status(USArrests) # estrutura dos dados (missing etc)
freq(USArrests) # frequência das variáveis fator
plot_num(USArrests) # exploração das variáveis numéricas
profiling_num(USArrests) # estatísticas das variáveis numéricas
