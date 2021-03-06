# Postwork 7

# Librer�a utilizada
# install.packages("mongolite", dependencies = TRUE)

library(mongolite)

# * Alojar el fichero data.csv en una base de datos llamada match_games, nombrando 
#    al collection como match

# Lee archivo del repositorio
data.csv <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-con-R-Santander/master/Sesion-07/Postwork/data.csv")

# Inicia conexi�n y crea la base de datos match_games y la colecci�n match
dtc <- mongo(
        collection = "match",
        db = "match_games",
        url = "mongodb+srv://local"       # Aqu� se pone el acceso a su cluster
        )

# Ingresa los datos a la colecci�n
dtc$insert(data.csv)

# * Una vez hecho esto, realizar un count para conocer el n�mero de registros que se 
#    tiene en la base
dtc$count()

# * Realiza una consulta utilizando la sintaxis de Mongodb, en la base de datos para 
#   conocer el n�mero de goles que meti� el Real Madrid el 20 de diciembre de 2015 y 
#   contra qu� equipo jug�, �perdi� � fue goleada?

dtc$find('{"Date":"2015-12-20", "$or":[{"HomeTeam":"Real Madrid"}, {"AwayTeam":"Real Madrid"}]}')

# No se encuentro en la consulta la fecha especificada.


# * Agrega el dataset de mtcars a la misma BDD Por �ltimo, no olvides cerrar la conexi�n con la BDD.

dtc <- mongo(
        collection = "mtcars",
        db = "match_games",
        url = "mongodb+srv://local"
        )

dtc$insert(mtcars)
dtc$find()

# Desconecta el servicio
dtc$disconnect()
