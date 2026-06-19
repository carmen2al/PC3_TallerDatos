# PC3_TallerDatos
## Descripción del Proyecto
En este repositorio se desarrolla el código y el flujo de trabajo completo del "Informe sobre el acceso al programa social Cuna Más (servicio de cuidado diurno) y la participación en el mercado laboral de las usuarias" elaborado para el curso de Taller de Procesamiento de Datos 2026-1 de la PUCP.
Se utilizan datos de la Encuesta Nacional de Hogares (ENAHO) 2025 trabajados íntegramente en R.

El análisis explora la relación entre el acceso al programa social Cuna Más (servicio de cuidado diurno) y las siguientes dimensiones:

**Demográficas**: grupos de edad, sexo y parentesco con el jefe de hogar, 
ubicación geográfica (dominio, estrato, UBIGEO)

**Laborales**: categoría ocupacional, rama de actividad económica, 

**Acceso a programas sociales**: acceso del hogar al servicio de cuidado 
diurno de Cuna Más

## Programas y librerías utilizadas
El proyecto está desarrollado utilizando la versión 4.5.1 de **R**, con las siguientes librerías:
* `tidyverse`: para el procesamiento y gráficos
* `arrow`: para la exportación de la base de datos procesada en formato parquet
* `janitor`: para limpieza de nommbres de la ENAHO
  
La versión de todas las librerías se controla usando 'renv' 

## Estructura de directorio
El directorio se organiza a través de la siguiente estructura de carpetas:
```text
├── CreacionCarpetas_180626.R          # Script principal: configuración del entorno y creación de carpetas
├── datos/
│   ├── crudos/                        # Módulos originales de la ENAHO en formato .csv
│   └── procesados/                    # Bases maestras procesadas (output de los scripts)
├── docs/                              # Documentación del proyecto
├── outputs/                           # Resultados finales: tablas y gráficos
├── scripts/
│   └── 01_Carga_union_modulos.R       # Carga y unión (merge) de los módulos sobre acceso al programa social Cuna Más (servicio de cuidado diurno), características de los miembros del hogar y empleo e ingresos
├── .gitignore
├── .Rprofile
├── PC3_TallerDatos.Rproj
├── README.md
└── renv.lock                          # Registro exacto de las versiones de las librerías
```
