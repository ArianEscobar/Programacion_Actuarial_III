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

############################################

#clase 24 de febrero de 2017

#conexiones
str(file)
 #descripcion- ruta del archivo
 #open - solo lectura ect.

#crear conexión
con <- url("http://www.fcfm.buap.mx/")
x <- readLines(con,7)
x

x <- c("a","b","c","c","d","e")
x
x[1] # extra el primer elemento
x[4] #extrae el cuarto elemento
x[1:3]
x[3:5]
x[6:2] 
x[1,3,5] #no sirve
x[c(1,3,5)]#si sirve para mostrar lo elementos salteados

x <- c("a","b","c","c","d","e","b")
x[x>"b"] #x>"b" mayores a b es una operacion

u <- x=="c" #nos muestra los valores donde x es exactamente igual a c
u
x[u]

u <- x=="c" | x=="d" #nos muestra las x exactamente a c o exactamente iguales a d
u
x[u]


#vamos a crear una lista
x <- list(foo=1:4,bar=0.6)
a <- x[1] # con un corchete simple el obejto q extraigo obtine un objeto con la clase original con una lista
b <- x[[1]] #con un corchete doble extraemos el primer elemento de la lista que es un vector de enteros
c <- x$foo #el $ parecido a usar el doble corchete pero este me indica la variable no la posicion si no se la posicion es mejor este
x["bar"]
x[["bar"]]
u <- "bar"
x[u]
x[[u]]
x$u # este busca la variable que se llame u y como no esta no la encuentra



#Extraer subconjuntos
x <- matrix(1:6,2,3)
x[1,2]


##################################################################3
#clase 03/marzo/2017

airquality #sondeo de distintos sensero acerca del aire (ejemplo para que trabajes con r)
complete.cases(airquality)
sum(complete.cases(airquality)) #contamos los casos completos
sum(!complete.cases(airquality)) #contamos los casos imcompletos
x <- airquality[complete.cases(airquality),] #extraemos casos completos
nrow(x) #otra froma de sumar el numero de filas de la extraccion anterior
dim(x)
dim(x)[1]

 x <- 1:4
 y <- 6:9
 z <- 2:3

 x+y
 x*y
x>2
x>=2
x+z #como z solo tiene dos elem al sumarlos con x los repite para sumar elemento a elemento
x
z
x/z

#ahora si creamos matrices
x <- matrix(1:4,2,2)
y <- matrix(rep(10,4),2,2)
x*y #solo multiplica entrada a entrada
x %*% y #hace la multiplicacion matricial correcta
y %*% x

#ESTRUCTURAS DE CONTROL (Nos permiten manejar el flujo, condicionales.)
###IF
if(TRUE){
        #instruccion
        #instruccion
        #instruccion
  
} else {
       #otras instrucciones
}   


if(TRUE){
  #instruccion
  #instruccion
  #instruccion
  
} else if{
  m #otras instrucciones
}



#ejemplo1
x<- 4
if(x>3){
    y <- 10
} else {
  y <- 0
}

#ejemplo2
z <- 4
y <- if(z>3){
  10
} else {
  0
}

###FOR

#ejemplo
for(i in 1:10){
    print(i)
}

#ejemplo1
x <- c("a","b","c","d")
for(i in 1:4){
  print(x[i])
}

#ejemplo2 (sequencia a lo largo de los valores de x)
for(i in seq_along(x)){
  print(x[i])
}

#ejemplo3
for(letra in x){
  print(letra)
}

#ejemplo4
for(i in 1:4) print(x[i])

#ejemplo5(matriz)
x <- matrix(1:6,2,3)
for(i in seq_len(nrow(x))){
  for(j in seq_len(ncol(x))){
    print(x[i,j])
  }
}

#######################################################
#clase 07 de marzo 2017
#WHILE 
 #Ejemplo
count <-0
while(count<10){
  print(count)
  count <- count + 1
}

#el while se puede ciclar para deternerlo apretamos stop en la consola
# ejemplo(no correrlo)
i<-0
while(TRUE){
  print(i)
  i <- i+1
}
#para que el ejemplo anterior no se cicle le podemos poner un criterio de para && variable <= algo
i<-0
while(TRUE && i<=100000){
  print(i)
  i <- i+1
  
}
#For
for(i in 0:9){
  print(i)
}


?rbinom
#ejemplo "variable aleatoria binomial
z <- 5
while(z>=3 && z <=10){
  print(z)
  moneda <- rbinom(1,1,0.5) #moneda tomA el valor de 1 ó 0
  if (moneda==1){
       z <- z+1
  }else{
       z <- z-1
  }
}

#ejemplo anterior con iteraciones (poner un contador)
z <- 5
contador <- 1
while((z>=3 && z <=10) && contador < 100){ # otra condicion para que pare el contador
  print(z)
  moneda <- rbinom(1,1,0.5) #moneda tomA el valor de 1 ó 0
  if (moneda==1){
    z <- z+1 #con el 0.1 en lugar del 1 tarda en salir mas el contador
  }else{
    z <- z-1
  }
  contador <- contador +1
}
print(contador)

# Tarea: cambiar en lugar de que los numeros se impriman guardarlos en un vector y imprimir el vector
z <- 5
vector <- c()
contador <- 1
while((z>=3 && z <=10) && contador < 100){ # otra condicion para que pare el contador
  vector <- c(vector,z)
  moneda <- rbinom(1,1,0.5) #moneda tomA el valor de 1 ó 0
  if (moneda==1){
    z <- z+1 #con el 0.1 en lugar del 1 tarda en salir mas el contador
  }else{
    z <- z-1
  }
  contador <- contador +1
}
vector

# Tarea2: correrlo 100 veces y obtener la longitud de los 100  vectores formados
set.seed(1)   #semilla para todos terminar con los mismos numeros generados
vector2 <- c()
for (i in 1:100){
  z <- 5
  vector <- c()
  contador <- 1
  while(z>=3 && z <=10){ # otra condicion para que pare el contador
    vector <- c(vector,z)
    moneda <- rbinom(1,1,0.5) #moneda tomA el valor de 1 ó 0
    if (moneda==1){
      z <- z+1 #con el 0.1 en lugar del 1 tarda en salir mas el contador
    }else{
      z <- z-1
    }
    contador <- contador +1
  }
  vector2 <- c(vector2, length(vector))

}
vector2
hist(vector2)
plot(vector,type="l") # type el tipo de grafico

##############################################################
#clase 14 de marzo de 2017

#ejemplo con mas variaciones
z <- 5
vector <- c()
contador <- 1
while(z>=3 && z <=10){ # otra condicion para que pare el contador
  vector <- c(vector,z)
  moneda <- rbinom(1,1,0.5) #moneda tomA el valor de 1 ó 0
  if (moneda==1){
    z <- z+0.1 #con el 0.1 en lugar del 1 tarda en salir mas el contador
  }else{
    z <- z-0.1
  }
  contador <- contador +1
}
plot(vector,type="l")


# Ejemplo graficar y=x^2 +5
x <- (-30:30)/10 #secuencia de -30 a 30 incrementado de .1 en .1
y <- x^2 + 5
plot(y, type="l")

#ejemplo con for y vector
y<-c()




#ejemplo for-next
for(i in 1:50){
  if(i<=25){
        next
  }
  print(i)
}

#ejemplo2: for-next
for(i in 1:50){
  if(i<=25){
        next #se salta los primeros 25 numeros
  }
  if (i>40){
       break #salir del ciclo 
  }
  print(i)
}

###FUNCIONES

#Ejemplo1:
suma2 <-function(x,y){
   x+y
}

suma2(1,6)

dump("suma2",file="suma2.R")

#ejemplo2
mayor10<-function(x){
  validos <- x>10
  x[validos]
}

#ejemplo3
mayor<-function(x,n=10){
  x[x>n]
}

#ejemplo4 (el promedio de las columnas)
promedioCol <- function(x,quitarNA=T){
    cols <- ncol(x)
    v <- c()
    for(i in 1:cols){
           v <- c(v,mean(x[,i],na.rm=quitarNA))
    }
    v
}

promedioCol(airquality)





