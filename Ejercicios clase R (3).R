#clase 17 de marzo de 2017
#FUNCIONES
#Evaluacion perecezosa (hacer todas las instrucciones hasta que encuentre un error)

#ejemplo
f <- function(a,b){
    a^2
}

#ejemplo 2
f <- function(a,b){
    print(a)
    print(b)
}


#ARGUMENTOS
myplot <- function(x,y,type="l",...){
  plot(x,y,type=type,..)
}


#ejemplo
x <- (-30:30)/10 #secuencia de -30 a 30 incrementado de .1 en .1
y <- x^2 + 5
plot(x,y)

#ejemplo3: (... sirve para poner varios arguementos)
miplot <- function(x,y,ana="l",...){
  plot(x,y,type=ana,...)
}

miplot(x,y)

miplot(x,y,main="parabola")

miplot(x,y,main="parabola",sub="y=x^2+5")

miplot(x,y,main="parabola",sub="y=x^2+5",
       xlab="Horizontal",ylab="Vertical",
       col="turquoise4")

#NOTA: Cualquier cosa que se ponga de los 3 pts suspensivos debe tener nombre



############################################33
#SCOPING RULES

lm
lm <- function(x){x*x}
lm
rm(lm)
lm

search() #los ambitos donde puede buscar R

#Para modificar el orden de busqueda
library(ggplot2)
search()

#AMBITO LEXICOLOGICO
#ejemplo1:
f <- function(x,y){
  x^2 + y/z  #la z es una variable libre por que no esta decla en la func
}

#Ejemplo2:
hacer.potencia <- function(n){
    potencia <- function(x){
      x^n
    }
    potencia
}

hacer.potencia(2)
potencia(3)

#podemos crear mas funciones a partir de funciones
cubica <- hacer.potencia(3)
cuadrada <- hacer.potencia(2)

################################################
#clase 21 de Marzo 2017 
    #ejemplos de tabulacion y sanfrias
    
#date  and times
x<- as.Date("1970-01-01")
x
unclass(x) #las fechas la ve como numero 
unclass(as.Date("1970-01-02"))

x <- as.Date("1997-06-01")
unclass(x)
y <- as.Date("1995-05-14")
unclass(y)
unclass(y-x)

#Tiempos en R
#El tiempo de representa por las clases:
#posixct y posixlt

date()
#ct <- as.POSIXct.date(Sys.time())
#lt <- as.POSIXlt.date(Sys.time())

weekdays(x)

z <- as.Date("1996-05-05")
weekdays(z)

#Funciones de ciclo
#LAPPLY
lapply()

#Ejemplo
x <- list(a=1:5,b=rnorm(10000))
lapply(x,mean)

x <- list(a=1:5,b=rnorm(10),c=rnorm(10,1),d=rnorm(10,2))
lapply(x,mean)

x <- 1:4
lapply(x, runif)


x <- 1:4
lapply(x, runif, max=15, min=5)


#SAPPLAY
#Ejemplo1:
x <- list(a=1:5,b=rnorm(10),c=rnorm(10,3),d=rnorm(10,5))
sapply(x,mean)

#APPLY
#(Sirve para evaluar una funcion)

#Ejemplo1:
x <- matrix(rnorm(200),20,10)
apply(x,2,mean) #alponer el indice 2 trabaja con columnas

apply(x,1,sum) #Al poner el indice 1 trabaja con filas

#MEDIAS Y SUMAS DE FILAS/COLUMNAS

#OTRAS FORMAS PARA APPLY
x <- matrix(rnorm(200),20,10)
apply(x,1,quantile,probs=c(0.25,0.75))

?quantile


a <- array(rnorm(2*2*10),c(2,2,10)) #tiene dos filas dos columnas y 10 de dimension hacia atrás
apply(a,c(1,2),mean) #c(1,2) tomamos la primera con la segunda dimension
rowMeans(a,dims=2)

#################################################
#MAPPLY
list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))
mapply(rep,1:4,4:1)
#rep(1,4) repite el 1 4 veces


#VECTORIZAR UNA FUNCIÓN(los argm de una funcion no pueden ser vectores solo con mapply)
noise <- function(n,mean,sd){
    rnorm(n,mean,sd)
}

?tapply

#crear un objeto con 30 numeros
x <- c(rnorm(10),runif(10),rnorm(10,1))
f <- gl(3,10)
f
tapply(x,f,mean)
tapply(x,f,mean,simplify=F)# el simplify lo pone en forma de lista

#split(de una lista saca todos lo que tiene un eleemnto en comun y crea un grupo,separa por grupos)
split(x,f)

lapply(split(x,f),mean)

#Instalar Data
install.packages("datasets")
library(datasets)
airquality #savar la temperatura promedio de cada mes
x <- airquality[1:31,4]
mean(x)

#nos saco el promedio de la temperatura de cada mes de la base de datos de airq
tapply(airquality$Temp,airquality$Month,mean,simplify=T)
sapply(split(airquality$Temp,airquality$Month),mean)
#nos extra la tempreratura de todos los dias de cada mes
split(airquality$Temp,airquality$Month)

#extre todos los datos por mes
s<-split(airquality,airquality$Month)
#saca la media de las columnas 1;3 de s
lapply(s,function(x) colMeans(x[,1:3], na.rm=T))
sapply(s,function(x) colMeans(x[,1:4], na.rm=T))#los mismso que arriba pero en forma de tabla


#split a mas de un nivel
x <- rnorm(10)
f1<-gl(2,5)
f2<-gl(5,2)
f1
f2
interaction(f1,f2) #nueva lista con niveles

x
str(split(x,list(f1,f2)))#creamos dos factores en dos nivels
#la instr anterior compara el resultado de la interaction con los 10 num ale 
