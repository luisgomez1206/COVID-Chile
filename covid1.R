## Determinacion de datos COVID

## Primero abrimos Bibliotecas Dplyr y GGPLOT2
library(dplyr)
library(ggplot2)
library(stats)
##descargamos dataset de OWID
dato_covid <- read.csv("https://covid.ourworldindata.org/data/owid-covid-data.csv")
## filtramos solo deos paises chile y argentina
dato_covid %>% filter(location == c("Chile","Argentina")) -> dato_filtrado
## graficamos
ggplot(data = dato_filtrado, mapping = aes(x = as.Date(date),y = new_cases_smoothed_per_million, color = location)) +
  geom_line() + labs(title = "Casos nuevos COVID-19", subtitle = "Curva suavizada por Media semanal", caption = "Fuente = Our World in Data", color = "Pais", x = "Fecha", y = "Casos nuevos por Millon de Habitantes")
unique(dato_filtrado$location)
names(dato_covid)

dato_covid %>% group_by(location) %>% summarise(n = n())

ggplot(data = dato_filtrado, mapping = aes(x = as.Date(date),y = new_cases_smoothed_per_million, color = location)) +
  geom_line() + geom_line(aes(x = as.Date(date), y = new_deaths)) + labs(title = "Casos nuevos COVID-19", subtitle = "Curva suavizada por Media semanal", caption = "Fuente = Our World in Data", color = "Pais", x = "Fecha", y = "Casos nuevos por Millon de Habitantes")
dato_filtrado %>% filter(as.Date(date) > "2021-12-31") -> dato_enero
ggplot(data = dato_enero, mapping = aes(x = as.Date(date),y = new_cases_smoothed_per_million, color = location)) +
  geom_line() + geom_line(aes(x = as.Date(date), y = new_deaths)) + labs(title = "Casos nuevos COVID-19", subtitle = "Curva suavizada por Media semanal", caption = "Fuente = Our World in Data", color = "Pais", x = "Fecha", y = "Casos nuevos por Millon de Habitantes")

dato_covid %>% filter(location == c("Chile","United Kingdom")) -> dato_RU
dato_covid %>% filter(location == c("Chile", "United Kingdom") & as.Date(date) > "2021-12-01") -> dato_RU
ggplot(data = dato_RU, mapping = aes(x = as.Date(date),y = new_cases_smoothed_per_million, color = location)) +
  geom_line() + geom_line(aes(x = as.Date(date), y = new_deaths)) + labs(title = "Casos nuevos COVID-19", subtitle = "Curva suavizada por Media semanal", caption = "Fuente = Our World in Data", color = "Pais", x = "Fecha", y = "Casos nuevos por Millon de Habitantes")
