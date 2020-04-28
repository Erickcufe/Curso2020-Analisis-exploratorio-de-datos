# https://github.com/owid/covid-19-data/tree/master/public/data/


covid_1 <- read.csv("https://covid.ourworldindata.org/data/owid-covid-data.csv")
covid <- readr::read_csv("https://covid.ourworldindata.org/data/owid-covid-data.csv")

str(covid)
str(covid_1)

#Medidas de centralización y dispersión
mean(covid$total_tests) #Devuelve NA porque aun tiene NA
mean(covid$total_tests, na.rm=TRUE) #Quita los NA y nos arroja un resultado

sd(covid$total_tests)
sd(covid$total_tests,na.rm=TRUE)

summary(covid)
summary(covid_1)


# Limpieza de NAs
is.na(covid$tests_units)
limpieza1 <- covid[!is.na(covid$tests_units),]


#Convertir una condición en NA
covid$total_tests[covid$total_tests==0] <- NA

# Qué mas puedo hacer con los NA
covid$nombrequeyoquiera <- 2
covid$total_tests.prom <- ifelse(is.na(covid$total_tests), #Si esto es verdad
                           mean(covid$total_tests, na.rm=TRUE), #se ejecuta esto
                           covid$total_tests #sino pongo el ingreso original
)

summary(covid)

covid$total_tests.sample <- ifelse(is.na(covid$total_tests), #Si esto es verdad
                                 sample(covid$total_tests[!is.na(covid$total_tests)]), #se ejecuta esto
                                 covid$total_tests #sino pongo el ingreso original
)
summary(covid)

covid_USA <- covid[covid$iso_code == "USA",] 
summary(covid_USA)
is.na(covid_USA$iso_code)


# Limpiando NAs basados por condicionante 

prueba1 <- na.omit(covid_USA)

covid_USA <- covid_USA[!is.na(covid_USA$iso_code), ]

plot(x = covid_USA$total_cases, y = covid_USA$date, type = "b",
     log = "x")


plot(x = covid_USA$total_cases, y = covid_USA$date,
     type = "l", xlab = "Total cases", ylab = "Date",
     main = "USA Covid-19", col = "Blue")
par(new = TRUE)
plot(x = covid_USA$total_deaths, y = covid_USA$date,
     type = "l", col = "red")
legend("bottomright", legend=c("Total cases", "Total deaths"),
       col=c("blue", "red"), lwd=2, cex = 1)


par(mfrow = c(1,2))

plot(x = covid_USA$total_cases, y = covid_USA$date,
     type = "l", xlab = "Total cases", ylab = "Date",
     main = "USA Covid-19", col = "Blue", log = "x")

plot(x = covid_USA$total_deaths, y = covid_USA$date,
     type = "l", col = "red", xlab = "Total deaths", ylab = "Date",
     main = "USA Covid-19", log = "x")


par(mfrow = c(2,2))

plot(x = covid_USA$total_cases, y = covid_USA$date,
     type = "l", xlab = "Total cases", ylab = "Date",
     main = "USA Covid-19", col = "Blue", log = "x")

plot(x = covid_USA$total_deaths, y = covid_USA$date,
     type = "l", col = "red", xlab = "Total deaths", ylab = "Date",
     main = "USA Covid-19", log = "x")

plot(x = covid_USA$new_cases, y = covid_USA$date,
     type = "b", col = "green", xlab = "Total new cases", ylab = "Date",
     main = "USA Covid-19")

plot(x = covid_USA$total_tests, y = covid_USA$date,
     type = "l", col = "gold", xlab = "Total tests", ylab = "Date",
     main = "USA Covid-19", log = "x")


# Un analisis mas profundo

covid$location <- as.factor(covid$location)
str(covid)

# ¿Como obtener los casos totales por país?
levels(covid$location)
length(levels(covid$location))

now <- "2020-04-27"
now <- as.Date("2020-04-27")

total_today <- covid[covid$date==now, ]

library(tidyverse)
toda_tidy <- covid %>% filter(date == now)

ggplot(total_today, aes(x = location ,y = total_cases, fill = location)) +
  geom_col() 

summary(total_today)
total_today <- total_today[total_today$total_cases > 28181, ]

ggplot(total_today, aes(x = location ,y = total_cases, fill = location))+
  geom_col(color ="black") + theme_classic() + theme(axis.text.x = element_text(angle = 90)) +
  labs(fill = "Countries", x= "Countries", y = "Total Cases") + ggtitle("Coronavirus cases")



