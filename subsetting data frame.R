# DATA FRAME (marco de datos)

iris_data <- iris

iris_data[1, ]
iris_data[1,1]
iris_data$Petal.Length[4]

# EXPLORACION
str(iris_data)
summary(iris_data)
class(iris_data)

2==2
iris_data[ , c(TRUE,FALSE)]
iris_logical <- iris_data[c(TRUE, FALSE), c(TRUE, TRUE,FALSE)]

# PARA SELECCIONAR FILAS QUE CUMPLAN CON UNA CONDICIÓN
iris_data[iris_data[,5]=="versicolor", ]
versicolor <- iris_data[iris_data[,5]=="versicolor", ]
versicolor <- iris_data[iris_data$Species=="versicolor", ]

# con tidyverse USANDO EL PIPE %>% 
library(tidyverse)
# ctrl + shift + m

versicolor_tidy <- iris_data %>% filter(Species == "versicolor")
uppermean_tidy <- iris_data %>% filter(Petal.Length > 4.350 )


# PARA SELECCIONAR COLUMNAS QUE CUMPLAN CON UNA CONDICIÓN

Species <- iris_data[ ,"Species"]
Species <- iris_data$Species
Species_df <- data.frame(Species)



names_iris <- colnames(iris_data)
stringr::str_detect(names_iris, "Petal")
select_col <- stringr::str_detect(names_iris, "Petal")
Species_str <- iris_data[ , select_col]

stringr::str_detect(names_iris, "Width")
select_col <- stringr::str_detect(names_iris, "Width")
Species_str <- iris_data[ , select_col]

# USANDO EL PIPE %>% 
Species <- iris_data[ ,"Species"]
iris_data$Species
species_tidy <- iris_data %>% select("Species")


# COMBINANDO TODO
# Quiero solo las columnas que tengan longitudes (Length) de la especie virginica

names_iris <- colnames(iris_data)
select_col <- stringr::str_detect(names_iris, "Length")
lenght_virginica <- iris_data[iris_data$Species=="virginica", select_col]

lenght_virginica_2 <- iris_data[iris_data$Species=="virginica", c(1,3)]

# Con pipe %>% 
lenght_virginica_tidy <- iris_data %>% filter(Petal.Length > 1.6 & Species == "setosa" ) %>% 
  select(Sepal.Length, Petal.Length, Species)


