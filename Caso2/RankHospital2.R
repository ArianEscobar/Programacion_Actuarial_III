# 3.Jerarquía de hospitales por resultado en un estado.

rankhospital<-function(estado,resultado,num){
    
    setwd("~/GitHub/Programacion_Actuarial_III/Caso2/Calidad de Hospitales - data")
    outcome<-read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    #Validacion de Estado y resultado
    
    validar1<-outcome[,7]
    validar2<-validar1==estado
    sumaEstados<-sum(validar2)
    if(sumaEstados==0){
        stop(return("Estado Invalido"))
    }
    
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
    
        NumHospitales<-nrow(subset(outcome,outcome[,7]==estado&!outcome[,col]=="Not Available", select = c(2)))
        
        
        if(num=="mejor"){
            ranking<-subset(outcome,outcome[,7]==estado&!outcome[,col]=="Not Available", select = c(2,col))
            orden<-ranking[order(as.numeric(ranking[,2]),ranking[,1]),]
            orden[1,1]
            
        }else if(num=="peor"){
            ranking<-subset(outcome,outcome[,7]==estado&!outcome[,col]=="Not Available", select = c(2,col))
            orden<-ranking[order(as.numeric(ranking[,2]),ranking[,1]),]
            orden[nrow(orden),1]
            
        }else if(num<=NumHospitales){
            
            ranking<-subset(outcome,outcome[,7]==estado&!outcome[,col]=="Not Available", select = c(2,col))
            orden<-ranking[order(as.numeric(ranking[,2]),ranking[,1]),]
            orden[num,1]
        }else {
            stop(return(NA))
        }
}

        
        
    


