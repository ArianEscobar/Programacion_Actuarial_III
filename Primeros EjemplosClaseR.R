#clase de 16/02/2017

print(x)
x
msg <- "Hola"

#el nombre de una variable empiza con una letra y sin espacios
x <- 1:20
x
x <- 1:50
x

a <- 1
b <- 1L

# la función clase nos dice el tipo del arguemnto
# Atributos de un obejeto se preguntan con attributes(x)

#Creación de vectores

#Con la función vector de tamaño 5
mi_vector <- vector("integer",5)

#usamos la funcion c para crear el vector ya que en el anterior el vector está vacío

#Con la función c
x1 <- c(0,5,0,6)
x2 <- c(TRUE,FALSE)
X3 <- c(T,F)
X4 <- c("a","b","c")
x5 <- 9:29
x6 <- c(2-1i, 3-5i, 3.14-1.186i)

#Coacción explícita, como el vector solo puede guardar una clase de formato busca la clase mas dominate y lo guarda como esa clase
y1 <- c(1.7, "a")
y2 <- c(TRUE, 2)
y3 <- c("a", TRUE)

n <- 0:6

#union de vectores
y <- c(0:6,0.5)

#NA 

#Numeros fraccionario los coaccionamos a enteros
f <- c(0.5, 3.6, 5.9)

#listas , pueden tener cualquier clase a diferencia del vector
x <- list(2,"a",TRUE,1+4i)
print(x)

x <- list(2,"a",TRUE,1:100)
print(x)

#MATRICES , son parecidos vectores pero tienen un atributo adicional que es la dimensión
#Dimensión de la separacion horizontal o vertical.Las clases de elemntos son iguales.
  # primero definiremos nrow
m <- matrix(nrow=2, ncol=3)
dim(m)

m2 <- 1:10
dim(m2) <- c(2,5)
dim(m2)<- c(5,2)
    
#FACTORES
#Datos categóricos. Valores cualitativos
x <- factor(c("yes","yes","no","yes","no"))

#CLASE 21 DE FEBRERO 2017
#valor faltante (NA, NAN)
x <- c(1,2,NA,10,3,NaN)
is.na(x)
is.nan(x)
#NA- VALOR FALTANTE
#NAN-VALOR NO NUMERICO


#DATA FRAMES (Almacenar datos tabulares,con diferentes clases de objetos.Generalizan a las matrices.)
x <- data.frame(foo=1:4,bar=c(T,T,F,T))
#foo y bar son etiquetas del mismo tamaño
nrow(x)
ncol(x)

x <- 1:3
#le asignamos etiquetas con un vector como abajo
names(x) <- c("henrry","yessi","elsy")
names(x)

y <- 1:6
y
dim(y) <- c(2,3)
y

#Ahora con las listas

x <- list(a=1, b=2, c=3)

#dobles corchetas me indican la posición y el signo de pesos el nombre


#Lectura de datos
  #read.table-leer archivos de internet y de excel y jalar informacion
    #header=true decimos que hay encabezados
    #sep="," la separacion de colunas
    #colClasses=c("character2,"character","integer"."character")
    #nrows=7 le decimos cuantas filas hay
    #comment.char="#"
    #skip=2
    #fill- rellena los valores faltantes con NA
    
#Escritura de datos


