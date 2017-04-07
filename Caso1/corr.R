setwd("C:/Users/Naira/Documents/GitHub/Programacion_Actuarial_III//Caso1/specdata")


corr <- function(directorio,horizonte=0){
    
    vector<-c()
    for(i in 1:332){
        if(i>=1 && i<10){NombreArchivo<-paste("00", i, ".csv", sep="")} 
        else { if(i>=10 && i<100){NombreArchivo<-paste("0", i, ".csv", sep="")}
            else {if(i>=100 && i<=332){NombreArchivo<-paste( i, ".csv", sep="")}} }
        
        LeerArchivo <- read.csv(NombreArchivo) 
        
        columnas<-LeerArchivo[,2:3]#extraemos las columnas 2 y 3
        y<-complete.cases(columnas) #vectorlogico con los casos completos
        comp<-columnas[y,] #extrae de las dos columas los datos completos
        
        filas<-nrow(comp) #cuenta el numero de monitores completos
        
        
        #vamos a compar con el horizonte
        if(filas > horizonte){
            x<-c(comp[,1]) #vectore con los valores de la colum sulfate
            y<-c(comp[,2]) #vector con las colm de nitrate
        
            correlacion<-cor(x,y)
            vector<-c(vector,correlacion) 
            } 
           
    }
    vector
}

#Probamos la funcion con estos valores
corr("specdata",400)