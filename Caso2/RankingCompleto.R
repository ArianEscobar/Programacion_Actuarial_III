# 4.Ranking de hospitales en todos los estados.

rankingCompleto<-function(resultado,num="mejor"){
    
    setwd("~/GitHub/Programacion_Actuarial_III/Caso2/Calidad de Hospitales - data")
    outcome<-read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    #Validacion de resultado.
    
    if (resultado =="ataque"){
        col<-11 
    } else if (resultado=="falla"){
        col <- 17
    }else if(resultado=="neumonia"){
        col<-23
    }else {
        stop(return("Resultado Inválido"))
    }
    
    
    #Encontrar hospital dependiendo el ranking, esatdoy resultado deseado.
    
    estados<-attr(factor(outcome[,7]),"levels")
    n<-length(estados)
    
    if(num=="mejor"){
        
        vector1<-c()
        vector2<-c()
        for(i in 1:n){
            ranking<-subset(outcome,outcome[,7]==estados[i]&!outcome[,col]=="Not Available", select = c(2,col))
            orden<-ranking[order(as.numeric(ranking[,2]),ranking[,1]),]
            x<-orden[1,1]
            y<-estados[i]
            
            vector1<-c(vector1,x)
            vector2<-c(vector2,y)
        }
        data.frame(Hospital=vector1,Estado=vector2)
        
    }else if(num=="peor"){
        
        vector1<-c()
        vector2<-c()
        for(i in 1:n){
            ranking<-subset(outcome,outcome[,7]==estados[i]&!outcome[,col]=="Not Available", select = c(2,col))
            orden<-ranking[order(as.numeric(ranking[,2]),ranking[,1]),]
            x<-orden[nrow(orden),1]
            y<-estados[i]
            
            vector1<-c(vector1,x)
            vector2<-c(vector2,y)
        }
        data.frame(Hospital=vector1,Estado=vector2)
        
    }else if(is.numeric(num)==TRUE){
        
        vector1<-c()
        vector2<-c()
        for(i in 1:n){
            ranking<-subset(outcome,outcome[,7]==estados[i]&!outcome[,col]=="Not Available", select = c(2,col))
            orden<-ranking[order(as.numeric(ranking[,2]),ranking[,1]),]
            numerohospitales<-nrow(orden)
            
            if (num<=numerohospitales){
             x<-orden[num,1]
             y<-estados[i]
            }else{
                x<-NA
                y<-estados[i]  
            }
            vector1<-c(vector1,x)
            vector2<-c(vector2,y)
        }
        data.frame(Hospital=vector1,Estado=vector2)
        
    }
}



