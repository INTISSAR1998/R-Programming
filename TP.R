1)
BD<- read.csv("C:/Users/HP/Desktop/tekup/r/DonnéeQuetelet.csv",sep=";")
2)
taille<-BD$taille
poids<-BD$poids
sexe<-BD$sexe
3)
#masculin<-which(BD$sexe=="M")
#feminin<-which(BD$sexe=="F")
genre<-split(BD,sexe)

nrow(genre$F)
nrow(genre$M)
##partie 2
5)
imc<-poids/(taille)^2
6)
length(imc)
summary(imc)
genreimc<-split(imc,sexe)
lapply(genreimc,summary)
summary(genreimc$F)
summary(genreimc$M)
7)
hist(imc)
8)

par(mfcol = c(2, 2))
hist(imc[sexe == "M"], main = "Hommes", xlab = "imc",ylab="hommes", col = grey(0.9))
hist(imc[sexe == "F"], main = "Femmes", xlab = "imc", ylab="femmes", col = grey(0.9))
plot(ecdf(imc[sexe == "M"]), main = "")
plot(ecdf(imc[sexe == "F"]), main = "")
####
par(mfcol = c(2, 1))
hist(imc[sexe == "M"], main = "Hommes", xlab = "imc",ylab="hommes", col = grey(0.9))
hist(imc[sexe == "F"], main = "Femmes", xlab = "imc", ylab="femmes", col = grey(0.9))
plot(ecdf(imc[sexe == "M"]), main = "")
plot(ecdf(imc[sexe == "F"]), main = "")
######
par(mfcol = c(1, 2))
hist(imc[sexe == "M"], main = "Hommes", xlab = "imc",ylab="hommes", col = grey(0.9))
hist(imc[sexe == "F"], main = "Femmes", xlab = "imc", ylab="femmes", col = grey(0.9))
plot(ecdf(imc[sexe == "M"]), main = "")
plot(ecdf(imc[sexe == "F"]), main = "")
9)
BD$IMC<-v
10)
fobesity<- function(x){
  fac<-c()
  for (i in 1:length(x[,1])){
  if (x[i,4]<18.5) {
    fac[i]='maigreur'
  } else
    if (x[i,4]<25)  {
      fac[i]='normal'}
    else if(x[i,4]<=29) {
      fac[i]='risque de surpoids'}
    else  {
      fac[i]='Obésité'}
  }}
obesity<-factor(fac)
return(cbind(x,obesity))}
BD=fobesity(BD)
######
}
  BD=cbind(BD,controle)
  

