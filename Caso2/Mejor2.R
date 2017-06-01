# 2.Encontrar el mejor hospital en un estado.

mejorhospital<-function(estado,resultado){
    
    setwd("~/GitHub/Programacion_Actuarial_III/Caso2/Calidad de Hospitales - data")
    outcome<-read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    #Validación de estado y resultado
    
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
   
   
    #Busca el mejor hospital 
   
    mejor<-subset(outcome,outcome[,7]==estado&!outcome[,col]=="Not Available", select = c(2,col))
   orden<-mejor[order(as.numeric(mejor[,2]),mejor[,1]),]
   orden[1,1]
}





