#===============================================================================
#Proyecto:  Taller de Procesamiento de datos- Práctica Calificada 3 
#Autora: Carmen Andonayre
#Script: Cargar módulos y hacer los joins
#Fecha: 18/06/26
#===============================================================================

#1. Cargar librerías------------------------------------------------------------
library(haven)
library(dplyr)
renv::snapshot()

#2. Importar datos--------------------------------------------------------------
mod700B <- read.csv("datos/crudos/ENAHO01-2025-700B.csv", fileEncoding = "Latin1", sep = ";") #Acceso a programas sociales
mod500  <- read.csv("datos/crudos/ENAHO01A-2025-500.csv", fileEncoding = "Latin1", sep = ";") #Empleo e Ingresos
mod200  <- read.csv("datos/crudos/ENAHO01-2025-200.csv", fileEncoding = "Latin1", sep = ";") #Características de los miembros del hogar
sumaria_8g <- read.csv("datos/crudos/Sumaria-2025.csv", fileEncoding = "Latin1", sep = ";")

#3. Unión de bases de datos-----------------------------------------------------
#Paso 1: Definir keys-----------------------------------------------------------
keys_hogar <- c("AÑO", "MES", "CONGLOME", "VIVIENDA", "HOGAR", 
                "UBIGEO", "DOMINIO", "ESTRATO", "NCONGLOME", "SUB_CONGLOME")

keys_persona <- c(keys_hogar, "CODPERSO")


#Paso 2: unir módulo 200 y 500 a nivel persona----------------------------------
mod200_500 <- mod200 %>%
  inner_join(mod500, by = keys_persona)

#Paso 3: crear variable dummy de acceso a Cuna Más (Cuidado Diurno) a nivel hogar ------------------------------------------
cuna_mas <- mod700B %>%
  mutate(acceso_cunamas = if_else(P712 == 1, 1, 0)) %>%
  group_by(across(all_of(keys_hogar))) %>%
  summarise(acceso_cunamas = max(acceso_cunamas, na.rm = TRUE), .groups = "drop")

#Paso 4: unir todo a nivel hogar------------------------------------------------
datos_final <- mod200_500 %>%
  left_join(cuna_mas, by = keys_hogar)

#4. Exportar base de datos------------------------------------------------------
library(arrow)
renv::snapshot
write_parquet(datos_final, "datos/procesados/datos_finales_180626")
