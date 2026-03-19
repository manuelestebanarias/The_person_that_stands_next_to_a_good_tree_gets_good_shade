########  RD Stimation ########################
rm(list=ls())

year = c("2019","2015","2011")#"2018", "2017","2016","2015","2014","2013","2012","2011")
Estratodesde=c("1","2","3","4","5","6") 
medicion= c("PondwithIng","PondNoIng","AggregNoIng","AggregwithIng")
Estratohacia=c("1","2","3","4","5","6")
cercania=c("500","1000","1500","2000")

w<-400
h<-350
r<-400

for(i in 1:length(year)){
  #call databases 
  Datos0 = read.csv(paste0("C:/Users/Usuario/Documents/MEMOIRE/Data/icfes/Estimar/Data_",year[i],".csv"), header = TRUE, sep = ",", dec = ".",encoding="UTF-8")
  Datos01<-na.omit(Datos0)
  Datos<-as.data.frame(Datos01) 
  for(j in 1:length(Estratodesde)){
    Corte<-subset(Datos,FAMI_ESTRATOVIVIENDA==paste0("Estrato ",Estratodesde[j])) #change == for != , and set (Estratohacia[k]!=Estratodesde[j]) {next} for having results for all strata
    colour<-c(ifelse(Estratodesde[j]=="1","#CC0033",ifelse(Estratodesde[j]=="2","#FF6600",ifelse(Estratodesde[j]=="3","#FFCC00",ifelse(Estratodesde[j]=="4","#339900",ifelse(Estratodesde[j]=="5","#3399CC",ifelse(Estratodesde[j]=="6","#6600CC","#666666"))))))) 
    colourline<-c("black")
    for (l in 1:length (medicion)) {
      preY = paste("Corte$",medicion[l],sep="")
      Y<-eval(parse(text=preY))
      for (k in 1: length(Estratohacia)){
        if(Estratohacia[k]==Estratodesde[j]) {next}
        preX= paste("Corte$distance",Estratohacia[k],sep="")
        X<-eval(parse(text=preX))
        xlabel=paste("DistanceHometo",Estratohacia[k],sep="")
        
        
        
         for(m in 1:length(cercania)){
           dobleval<-if_else(cercania[m]==500,1000,if_else(cercania[m]==1000,2000,if_else(cercania[m]==1500,3000,if_else(cercania[m]==2000,4000,100000))))
           doble0<-c(dobleval)
           doble<-as.character(doble0)
          # Raw comparison of means
        formula1<-paste0("rdplot(Y, X,c=",cercania[m],", nbins = c(500,500), p = 0, col.lines ='",colourline,"', col.dots ='",colour,"' ,title='', x.label ='",xlabel,"(c=",cercania[m],"m)',y.label ='", medicion[l],"-",year[i],"')")
        png(file=paste0("C:/Users/Usuario/Documents/MEMOIRE/Data/icfes/Resultados/GraficosMedias/",year[i],"-",medicion[l],"FromHome(",Estratodesde[j],")to",Estratohacia[k],"Means.png"),width=w,height=h)
        global<-eval(parse(text=formula1))
        dev.off()
        #sink(file = NULL)

         # Local comparison of means
         formulalocal<-paste0("rdplot(Y[abs(X) <=",doble,"], X[abs(X) <= ",doble,"], c=",cercania[m],",nbins = c(500, 500), p = 2,title='', col.lines ='",colourline,"', col.dots ='",colour,"',x.label =' ",xlabel,"(c=",cercania[m],"m)', y.label = '",medicion[l],"-",year[i],"')")
         png(file=paste0("C:/Users/Usuario/Documents/MEMOIRE/Data/icfes/Resultados/GraficosMedias/Local",cercania[m],year[i],"-",medicion[l],"FromHome(",Estratodesde[j],")to",Estratohacia[k],"Means.png"),width=w,height=h)
         local<-eval(parse(text=formulalocal))
         dev.off()

        
         }
      }
    }
  }  
}
