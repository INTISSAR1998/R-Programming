# Exercice 1 : les vecteurs
x <- c(1, 2, 3, 4, 5)
mode(x)
length(x)
x[1]
x[length(x)]
a <- x[c(1,2,3)]
b<-x[c(1,3,5)]
(x+10)*2
a+b 
x+a 
a+x 
c<-2
x*c
a*b 
x
a
x*a
ind <- which(x %% 2 == 0)
(mult_2 <- x[ind])
which(x %% 2 == 0 & x %% 3 == 0)
which(x %% 2 == 0 | x %% 3 == 0)
sum(x)
x[1] <- 4
x
x[1] <- NA
sum(x)
sum(x, na.rm=TRUE)
ls()
rm(x)
rm(list=ls())
# Exercice 2 : (manipulation de listes)
TRUE + FALSE + TRUE * 4
c(1, 4, TRUE)
c(1, 4, TRUE, "bonjour")
l <- list(1, 4, TRUE)
l[[1]]
mode (l[[1]])
mode (l[[3]])
l <- c(l, "bonjour")
str(l)
l[[3]] <- NULL
unlist(l)
moi<-list(nom='Intissar',
          prenom='EL AHMER',
          annee_de_naissance=as.Date("1998/02/03"))
moi[[2]]
moi$prenom
toi<-list(nom='aaa',
          prenom='abaab',
          annee_de_naissance=as.Date("1998/02/03"))
personnes<-list(toi,moi)
personnes[[1]]
personnes[[1]]$prenom
# Exercice 3
PIB <- matrix(	c(58.2,	65.2,	70.3,	72.5,
              	48.6,	45.2,	55.3,	56.2,
              	32.6	,33.2,45.6,	49.5),
               ncol=4,
               byrow=TRUE,
               dimnames=list(c("USA","Japan","France"),
                             c(2009,2010,	2011,	2012)))
PIB<-rbind(PIB,c(23.3,22.1,19.2,12.1))
rownames(PIB)[4]<-"Italy"
PIB<-cbind(PIB,c(80.1 , NA , 52.2 ,13.6))
colnames(PIB)[5]<-2013
PIB[3,3]<-45.7
anneesdf<-data.frame(t(PIB))
# Exercice 4
base <- read_excel("E:/TEK-UP/DSEN-2/Semestre 2/R/projet1r.xlsx")
base<-rbind(base,c(018 , "Elmi" , "Fadhel" , 55 ,
                   "Homme" , "Tunis" , TRUE))
base$Date_de_creation_du_compte<-as.Date(c("01/03/2000",
                                   "15/03/2010",
                                   "23/08/2007",
                                   "02/05/2008",
                                   "02/12/2017",
                                   "22/05/2012",
                                   "22/08/2020",
                                   "15/09/2011",
                                   "27/06/2016",
                                   "12/08/2014",
                                   "21/10/2011",
                                   "05/05/2019",
                                   "12/07/2014",
                                   "30/09/2015",
                                   "16/05/2006",
                                   "26/11/2000",
                                   "22/07/2008",
                                   "22/04/2008"
),"%d/%m/%Y")
library(tidyr)
replace_na(base$Agence ,"Bizerte")
base$Aage
colnames(base)[1] <- "ID"
library()
base<-relocate(base,Date_de_creation_du_compte, .after = ID)
write.csv(base, file = "base.csv")
write.table(base, file = "base.csv")
# Exercice 5 : importation des données
download.file("http://egallic.fr/Enseignement/R/Exercices/donnees/notes.csv", 
              destfile = "./df1.csv")
df1<- read.csv("./df1.csv")
str(df1)
library(readr)
df2 <- read_csv("http://egallic.fr/Enseignement/R/Exercices/donnees/notes.csv")

df3 <- read_delim("http://egallic.fr/Enseignement/R/Exercices/donnees/notes_decim.csv", 
     
                               delim=";")

df4 <- read_csv("http://egallic.fr/Enseignement/R/Exercices/donnees/notes_h.csv",
    
                            col_names = FALSE)

df5 <- read_csv("http://egallic.fr/Enseignement/R/Exercices/donnees/notes_h_s.csv",
                skip = 1)



download.file("http://egallic.fr/Enseignement/R/Exercices/donnees/notes.xlsx",
              destfile = "./notes.xlsx",
              mode = "wb")
library(readxl)
df6 <- read_excel("notes.xlsx")

df7 <- read_excel("notes.xlsx", sheet = "notes_h_s", skip=1)
# Exercice 6
data(mtcars)
str(mtcars)

library(tidyverse)
data(mpg)
str(mpg)

data("starwars")
str(starwars)

library(carData)
data(Migration)
str(Migration)

data("Davis")
str(Davis)

data("swiss")
str(swiss)
# Exercice 7
a <- seq(1:10)
b <- replicate(10, "l")
c <- replicate(10,"k")
d <- seq(1:10)
data<-data.frame(a,b,c,d)



