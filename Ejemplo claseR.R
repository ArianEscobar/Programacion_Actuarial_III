#Clase 23/febrero/17
y <- data.frame(a=1, b="a")
 #Guardamos el resultado en el disco duro y liberamos la ram con dput
 # con dget jalamos otra vez
dput(y)
dput(y,"y.R")
dget("y.R")

rm(y)

y <- dget("y.R")
y

#getwd() sirve para ver donde esta la direccion del derictorio de trabajo

#Función dump y source
x <- "PrOgramación Actuarial III"
Y <- data.frame(a=1, b="a")
dump(c("x","y"),file="data.R")

#si borramos los datos en el enviromenr usamos source para recuperarlos
source("data.R") 
