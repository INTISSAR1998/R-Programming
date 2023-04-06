Séance 2 : création d'objets sous R
les vecteurs
les matrices
les listes
les data frames
les facteurs, les tableaux (array)

premier objet : les vecteurs

Taille_cm<- c(175,150,165,180,190,174)
Taille_cm
M1<-matrix(1:20)
M1<-matrix(seq(1,20));M1
is.vector(M1)
M2<-matrix(1:20,nrow=10);M2
M3<-matrix(1:20,ncol=5);M3
M5<-matrix(1:20,ncol=4,nrow=10,byrow=7);M5
?colnames

#donner un nom à chaque ligne de la matrix data2
#en utilisant un prefix commun 1D
#indication: utiliser roxnames()

Taille_m <- c(Taille_cm/100)
#mettre les vecteurs taille cm et tailles
dataa <-matrix(c(Taille_cm,Taille_m), ncol=2, byrow=7,dimnames....)
Nom_Col<-c("Tailles en cm","Taile en m ")
colnames(dataa)<-Nom_Col
dataa
dataa <- 

#Indexation par les noms des lignes et des colonnes
data2["ID1",]
data2[,"Taille en cm"]

#troisième type d'objet
#pour crée une liste utiliser la fonction list()
Nom<-c("Omar","Maram","Ali","Sabrine","Gaith","Faten")
Taille_cm<-c(175,150,165,180,190,NA)
Taille_m<-Taille_cm/100
Etat<-c(FALSE,TRUE,FALSE,TRUE,TRUE,FALSE)
dataset<-list(Nom,Taille_cm,Taille_m,Etat)
dataset
dataset[[1]][1]
dataset[[1]][2]
#Solution: utiliser un objet qui combine les avantages
#des matrices et les listes ----> dataframe
#pour créer une data frame utiliser la fonction data.frame()
data_frame1<-data.frame(Nom,Taille_cm,Taille_m,Etat)
data_frame1
#quelques fonctions sur les data frame
view(data_frame1)
data_frame1$Nom
names(data_frame1)
colnames(data_frame1)
rownames(data_frame1)
dim(data_frame1)
#exportation d'une dataframe
write.table(data_frame1,file ="DSEN.txt")
read.table("DSEN.txt",sep="")
#pour voir la liste des données sous R
data()
data(CO2)
View(CO2)
#pour avoir la liste des données sous R
data(package=.packages(all.available=TRUE))
data(acme)
library(boot)
atach(data)

-------------------

install.packages
install.packages("dplyr")
library(dplyr)
install.packages("hflights")
library(hflights)
data("hflights")
force(hflights)
str(hflights)
attach(hflights)
names(hflights)
dim(hflights)
colnames(hflights)
hflights$Month
hflights[Month == 1,]
hflights[Month == 1 | Month == 2,]
filter(hflights, Month %in% c(1,2,8))
#déterminer les vols ayant un temps de retard
#à l'arrivée (ArrDelay) et au départ (DepDelay) de plus de 2 heures
retard<-filter(hflights,ArrDelay>120 & DepDelay>120)
install.packages("DT")
library(DT)
datatable(retard)
#déterminer les vols qui n'ont pas fait de retard ni à l'arrivé
#ni au départ et dont la distance est inférieure à 100
tableau1<-filter(hflights,ArrDelay <= 0 & DepDelay <= 0 & Distance< 100)
#déterminer les vols de compagnies AA et UA
filter(hflights,UniqueCarrier == "AA" | UniqueCarrier == "UA")
# deuxième verbe: slice()
#slice() # choisir une ligne par rapport à sa position
#slice_min
#slice_max
#slice_sample
slice(hflights,5)
slice(hflights,1:n())
#donner les 10 vols ayant un temps de retard à l'arrivé de plus elevé
slice_max(hflights, ArrDelay,n=10)
slice_sample(hflights,n=500)
slice_sample(hflights,prop=0.10)
#3ème verbe: arrange() : ordonner les données : croissant décroissant
arrange(hflights,Distance)
arrange(hflights,desc(Distance))
head(arrange(hflights,desc(Distance)),n=50)

#le pipe %>% 
f(g(h(t(x))))
hflights %>% 
  filter(DepDelay<0) %>% 
  arrange(desc(DepDelay)) %>% 
  head()
head(mtcars, 2)
filter(mtcars, drat <= 4 & gear <= 3 & hp > 200)
mutate(mtcars, hp_to_wt = hp / wt)
hp_to_wt = mutate(hp_wt)
starwars %>%   group_by(gender) %>%   summarize(n())

colors <-select(starwars,contains(''color''))

select(starwars,contains(''color''))

select(starwars,hair_color,skin_color,eye_color)
colors <-select(starwars) ends_with(color)

select(starwars,starts_with('s'))

summarize(starwars,mean(mass,na.rm=TRUE))
summarize(starwars,mean(mass,na.rm=FALSE))

starwars.g <- group_by(starwars,species)%>%summarize(starwars.g,avg= mean(mass,na.rm=TRUE))
summarize(starwars,mean(height,na.rm=TRUE))

filter(mtcars, wt < 2.0 | hp < 60)

filter(mtcars,hp > 200, am==1)

my_frame %>% summarize(rates2 = mean(rates))

filter(mtcars, wt, mpg)
filter(mtcars, wt, mpg, cyl)
select(mtcars, wt, mpg, cyl)
select(wt, mpg, cyl)