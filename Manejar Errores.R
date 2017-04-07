#Clase 31 de marzo 2017
#MANEJO DE LOS ERRORES EN R
    #messege:una notificacion generica que se produce,el codigo sigue corriendo.
    #warning:algo esta mal,pero no fatal,sigue corriendo.
    
#Ejemplo:
log(-1) #valor no numeirco, pero R lo puede trabajar ya que lo toma como valor faltante
#ejemplo2: marca erro cuando x es NA
imprime<-function(x){
    if(x>0)
        print("x es mayor a cero")
    else
        print("x es menor a cero")
}

#RECOVER
options(error = recover)
read.csv("noexiste")
