setwd("C:/Users/Naira/Documents/GitHub/Programacion_Actuarial_III//Caso1/specdata")


completos <- function(directorio,id=1:332){
    
    num<- c()
    num2<-c()
    for(i in id){
        if(i>=1 && i<10){NombreArchivo<-paste("00", i, ".csv", sep="")} 
        else { if(i>=10 && i<100){NombreArchivo<-paste("0", i, ".csv", sep="")}
            else {if(i>=100 && i<=332){NombreArchivo<-paste( i, ".csv", sep="")}} }
        
        LeerArchivo <- read.csv(NombreArchivo)  
        
        columnas<-LeerArchivo[,2:3]#extraemos las columnas 2 y 3
        y<-complete.cases(columnas) #vectorlogico con los casos completos
        comp<-columnas[y,] #extrae de las dos columas los datos completos
        
        filas<-nrow(comp) #cuenta el numero de monitores completos
        
        num<-c(num,i) #en este vector vamos almacenando los id´s
        num2<-c(num2,filas)#en este vector almacenamos los numero casos completos
        
    }
    
    tabla<-data.frame(id=num,nobs=num2)
    tabla
}

#probamos la funcion con 
completos("spectdata",5:8)