setwd("C:/Users/Naira/Documents/GitHub/Programacion_Actuarial_III//Caso1/specdata")


mediacontaminante <- function(directorio,contaminante,id=1:332){
    
    vector<-c()
    for(i in id){
        if(i>=1 && i<10){NombreArchivo<-paste("00", i, ".csv", sep="")} 
        else { if(i>=10 && i<100){NombreArchivo<-paste("0", i, ".csv", sep="")}
            else {if(i>=100 && i<=332){NombreArchivo<-paste( i, ".csv", sep="")}} }
            
        LeerArchivo <- read.csv(NombreArchivo)  
        columna<-LeerArchivo[,contaminante]
        
        vector<- c(vector,columna)
        
        mediacolumas<-mean(vector,na.rm=T)
        
    }
mediacolumas
}

#Probamos la funcion con estos valores
mediacontaminante("specdata","sulfate",5:6)
mediacontaminante("specdata","nitrate",5:6)
