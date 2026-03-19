

###Converting data in .Cxv separated by ","
####For data initially separated by "|"

setwd("C:/Users/Usuario/Documents\MEMOIRE/Data/Original/Arreglados")

files = c("SB11_20021",
          "SB11_20041",
          "SB11_20051")


for(i in 1:length(files)){
  test = read.csv(paste0(files[i],".txt"), header = TRUE, sep = "|", dec = ",")
  
  write.csv(test,paste0(files[i],".csv"), row.names = F)
}
####For data separated initially by "¬"

setwd("C:/Users/Usuario/Documents/MEMOIRE/Data/Original/Arreglados")

files = c("SB11_20061",
          "SB11_20071",
          "SB11_20081",
          "SB11_20091",
          "SB11_20092",
          "SB11_20101",
          "SB11_20121",
          "SB11_20131",
          "SB11_20132",
          "SB11_20141",
          "SB11_20142",
          "SB11_20151",
          "SB11_20152",
          "SB11_20161",
          "SB11_20162",
          "SB11_20171",
          "SB11_20172",
          "SB11_20181",
          "SB11_20182",
          "SB11_20191")


for(i in 1:length(files)){
  test = read.csv(paste0(files[i],".txt"), header = TRUE, sep = "¬", dec = ",")
  
  
  
  
  write.csv(test,paste0(files[i],".csv"), row.names = F)
}


#Delete indiviudal that did no studied in Bogotá
setwd("C:/Users/Usuario/Documents/MEMOIRE/Data/Original/Arreglados")
#########write here all the files
files = c("SB11_20131",
          "SB11_20132",
          "SB11_20141",
          "SB11_20142",
          "SB11_20151",
          "SB11_20152",
          "SB11_20161",
          "SB11_20162",
          "SB11_20171",
          "SB11_20172",
          "SB11_20181",
          "SB11_20182")

for(i in 1:length(files)){

  test = read.csv(paste0(files[i],".txt"), header = TRUE, sep = "¬", dec = ",",encording="UTF-8") 
  header<-colnames(test)
  headermayus<-toupper(header)
  colnames(test) <- headermayus
  RolosOnly<-subset(test,COLE_COD_MCPIO_UBICACIONÂ=="11001Â")

  write.csv(RolosOnly,paste0(files[i],".csv"), row.names = F)
}


###Merge anual data bases
setwd("C:/Users/Usuario/Documents/MEMOIRE/Data/Original/Arreglados")
#########call bases
preprimera = read.csv("SB11_20181.csv", header = TRUE, sep = ",", dec = ".", fill=TRUE, encoding="UTF-8")
presegunda = read.csv("SB11_20182.csv", header = TRUE, sep = ",", dec = ".", fill=TRUE, encoding="UTF-8")
#########Remove non commun rows
############# For next excersises use comand " intersect coloms (a) and colums (b)
primera<-subset( preprimera, select=-c(1, 12, 13, 14, 15, 16,87))
segunda<-subset( presegunda, select=-c(1, 79, 83))
anual<- rbind(primera, segunda[, colnames(primera)])
write.csv(anual,"anual2018.csv", row.names = F)





