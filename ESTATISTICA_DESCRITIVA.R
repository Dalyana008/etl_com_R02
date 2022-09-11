# estatística descritiva

View(USArrests)

## Tabela de frequência absoluta da variável Rape no USArests
table(USArrests$Rape)

## Tabela de frequência relativa da variável  Rape no USArests
prop.table(table(USArrests$Rape))

## Média da variável 
mean(USArrests$Rape)

## Mediana da variável 
median(USArrests$Rape)

## Separatrizes da variável Murder
quantile(USArrests$Murder, probs=0.75)
quantile(USArrests$Murder, probs=0.10)
quantile(USArrests$Murder, probs=0.95)
boxplot(USArrests$Murder) # boxplot - gráfico que resume as sepatrizes

## Desvio-padrão da variável 
sd(USArrests$Murder)
plot(USArrests$Murder)

## Sumário descritivo básico das variáveis
summary(USArrests)

## Sumário descritivo completo das variáveis usando o pacote fBasics
pacman::p_load(fBasics)
basicStats(USArrests[ , c(1:4)])
hist(USArrests$Murde) # histograma - gráfico que permite conhecer a curva dos dados
