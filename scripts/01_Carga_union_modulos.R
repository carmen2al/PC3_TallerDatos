#===============================================================================
#Proyecto:  Taller de Procesamiento de datos- Práctica Calificada 3 
#Autora: Carmen Andonayre
#Script: Cargar módulos y hacer los joins
#Fecha: 18/06/26
#===============================================================================

#Cargar librerías---------------------------------------------------------------
library(haven)
library(dplyr)
renv::snapshot()

#Importar datos-----------------------------------------------------------------
mod700B <- read.csv("datos/crudos/ENAHO01-2025-700B.csv", fileEncoding = "Latin1") #Acceso a programas sociales
mod500  <- read.csv("datos/crudos/ENAHO01A-2025-500.csv", fileEncoding = "Latin1", sep = ";") #Empleo e Ingresos
mod200  <- read.csv("datos/crudos/ENAHO01-2025-200.csv", fileEncoding = "Latin1") #Características de los miembros del hogar

