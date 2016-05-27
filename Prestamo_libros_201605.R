library(reshape2)
library(plyr)

#Lineas con errores, busca BCDI5

prLibros <- read.csv("bibliotecas_prestamos_201605.csv", header=TRUE, sep=";")

prLibros <- head(prLibros,100)
prLibros <- prLibros[prLibros$prprsu!="" & prLibros$tiauto!="",]
prLibros <- prLibros[,c('prprsu', 'tiauto')]
Autores  <- ddply(prLibros, .(prprsu, tiauto), summarize, ConAutores = sum(length(tiauto)))

#Forma 1 de coger los 10 autores más prestados a nivel de prprsu
orden <- Autores[order(Autores$ConAutores,decreasing = TRUE),]
head(orden,10)

#Forma 2 de coger los 10 autores más prestados a nivel de prprsu
#Con el rank
Autores <- Autores[Autores$ConAutores>1,]
RankAutores <- ddply(Autores, .(prprsu, tiauto), transform, rank = rank(-ConAutores, ties="random"))
res <- tmp[tmp$rank == 1,]
head(res)


            




