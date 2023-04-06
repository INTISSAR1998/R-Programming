# thème 2: manipulation des données
# package dplyr
# les fonctions:
# 1. filter(): 
# 2. slice():
# 3. arrange ():
# 4. select():
# 5. mutate()
# 6. summarise()
# 7. group_by()

#######################################################
install.packages("tidyverse")
install.packages("dplyr")
install.packages("DT")# pour l'affichage des tableaux de données
install.packages("hflights")# pour la base de données 

# 2. charger les packages
library(tidyverse)
library(dplyr)
library(DT)
library(hflights)

# 3. Charger la base de données et comprendre sa structure

data(hflights)# charger ou lire la base 
force(hflights)
View(hflights)# visionner la base dans un tableur.
str(hflights)# donne la structure de la base 
names(hflights)# les noms des variables
attach(hflights)

# la description de la base
?hflights

# opéartions de la manipulation des données
# 1. Les opérations sur les lignes
# la première fonction: filter(): selectionner des lignes de la base sous condition

# exemple1: déterminer dans un tableau les vols effectués au moi de Janvier (Month)

# première façon: indexation des matrices

hflights[Month==1 ,   ]

# deuxième façon

Janvier<-filter(hflights,Month==1)
datatable(Janvier)

# exemple2: déterminer dans un tableau les vols effectués aux moix de Janviers 
# fevrier et mars (Month)

Objet1<-filter(hflights,Month==1|Month==2| Month==3)

# on peut utiliser %in%

Objet2<-filter(hflights, Month %in% c(1,2,3,4,5,6))

# exemple3 : créer un objet qui contient les données relatives aux vols
# effectués en été (Juin, Juillet et Aout) et dont la distination est DFW et AUS

Objet3<-filter(hflights, Month %in% c(6,7,8)& Dest=="DFW" | Dest=="AUS")
Objet4<-filter(hflights, Month %in% c(6,7,8)& Dest %in% c("DFW","AUS"))
datatable(Objet3)

# Exemple4: créer un objet qui contient les vols des comapnies UA et AA
# et dont le temps de retard à l'arrivée (ArrDelay) est supérieur à 2 heures.

objet5<-filter(hflights, UniqueCarrier=="UA"| UniqueCarrier=="AA" & ArrDelay>=120)

# exemplle5: déterminer les vols qui n'ont pas eu de retard ni à l'arrivé ni au départ

objet6<-filter(hflights,ArrDelay<=0 & DepDelay<=0)

?filter()

# exemple 6: Déterminer les vols dont le temsp de vol est supérieur à la valeur moyenne
# hint: mean()

objet7<-filter(hflights, AirTime>mean(AirTime,na.rm=TRUE))

####################################################################
# deuxième fonction: slice(): lire une ou plusieurs lignes selon leur position

slice(hflights,1)
slice(hflights,2)
slice(hflights,1:100)
slice(hflights, c(5,150,20000,150000))

# slice_head, slice_tail

slice_head(hflights,n=5)
slice_tail(hflights,n=10)

# slice_min() et slice_max

datatable(slice_max(hflights,DepTime,n=10))
datatable(slice_min(hflights,DepTime,n=10))

# slice_sample

datatable(slice_sample(hflights,n=10))

?slice_sample

slice_sample(hflights,prop=0.10,replace = TRUE)

# 3ème fonction arrange(): permet d'ordoner les valeurs d'une colonne
# dans un ordree croissant soit dans un ordre décroissant

objet9<-arrange(hflights,Distance)

objet10<-arrange(hflights,desc(Distance))

# requête: sélectionner aléatoirement 100 observations, sans remise
# par la suite déterminer les 10 vols ayant le temps de retard 
# à l'arrivée le plus élevé (ArrDelay)

data<-slice_sample(hflights,n=100,replace = FALSE)

# première façon: slice_max

Max_retard<-slice_max(data,ArrDelay,n=10)

# deuxième façon: arrange()

head(arrange(data,desc(ArrDelay)),n=10)

Min_retard<-slice_min(data,ArrDelay,n=10)

taill(arrange(data,desc(ArrDelay)),n=10)# les 10 valeurs minimales de la vatiable ArrDelay

# remarque : les pipes %>% 

objet12<-hflights %>% 
  filter(Month==4) %>% 
  arrange(desc(AirTime)) %>% 
  slice(1:10)
View(objet12)

##############################################################
# les fonctions relatives aux colonnes
# select(): permet de selectionner une ou plusieurs colonnes (variables)

# exemple: créer une base de données qui contient
# seulement les varaibles Month; Uniquecarrier et DepDelay

base1<-hflights %>% 
  select(Month,UniqueCarrier,DepDelay)
View(base1)

base2<-hflights %>% 
  select(Year:ArrTime)
View(base2)

?select


base3<-hflights %>% 
  select(starts_with("Day"))
View(base3)

base4<-hflights %>% 
  select(ends_with("Week"))
View(base4)


######################################################
rm(list=ls())
library(tidyverse)
library(dplyr)
library(hflights)
library(DT)

data(hflights)
View(hflights)
names(hflights)
str(hflights)


# mutate(): permet de créer une nouvelle variable

# recodage d'une variable

# exemple: Générer une variable selon les conditions suivantes
# Nom: type_de_retard
# "retard à l'arrivée et au départ" si ArrDelay>0 et DepDelay>0
# " retard à l'arrivée" si ArrDelay>0 et DepDelay<=0
# "retard au départ"
# "Pas de retard"
# en focntion des deux variable DepDelau et ArrDelay
# hint: utiliser la fonction mutate() et la sous fonction case_when()


hflights<-hflights %>% 
  drop_na(ArrDelay,DepDelay) %>% 
  mutate(Type_de_retard=case_when(
    ArrDelay>0 & DepDelay>0 ~ "Retard à l'arrivée et au départ",
    ArrDelay>0 & DepDelay<=0 ~ "Retard à l'arrivée",
    ArrDelay<=0 & DepDelay>0 ~ "retard au départ",
    ArrDelay<=0 & DepDelay<=0 ~ "Pas de retard"))

# exemple pour mettre en evidence la notion du pipe %>% 

# créer une base de données qui contient 1000 observations
# choisies d'une amnière alétoire (slice_sample), et qui contient les variables
# UniqueCarrier, Month, DepDelay, AirTime (select)
# classer les observation dans un ordre déccroissant selon Airtime
# afficher les dix vols ayant le temsp de retard au départ le plus élévé (slice_max)

data1<-hflights %>% 
  slice_sample(n=1000,replace = FALSE) %>% 
  select(UniqueCarrier,Month,DepDelay,AirTime) %>% 
  arrange(desc(AirTime)) %>% 
  slice_max(DepDelay,n=10)
View(data1)



# une autre fonction : summarise(): résumer les valeurs d'une variable numérique
# en une seule valeur
# Résumer statistique
# Moyenne: mean()
# Ecart-type: sd()
# Minimum: min()
# Maximum: max()
# Nombre: n()

# exemple 1: déterimer, moyenne, ecart-type, minimum et maximum 
# de la variable DepDelay
# Afficher le resultat dans un tableau nommé STAT en utilisant datatable()



hflights %>% 
  summarise(Moyenne=round(mean(DepDelay),2),
            Ecart_type=round(sd(DepDelay),2),
            Minimum=min(DepDelay),
            Maximum=max(DepDelay))
# exemple: refaire le calcul par nom de companie (uniqueCarrier)


stat_companie<-hflights %>% 
  select(UniqueCarrier,DepDelay) %>% 
  drop_na(DepDelay) %>% # pour éliminer les valeurs "NA"
  group_by(UniqueCarrier) %>% 
  summarise(Moyenne=round(mean(DepDelay),2),
            Ecart_type=round(sd(DepDelay),2),
            Minimum=min(DepDelay),
            Maximum=max(DepDelay))
datatable(stat_companie)

# utiliser group_by() sur plusieurs variables

stat_companie2<-hflights %>% 
  select(UniqueCarrier,DepDelay,Month) %>% 
  drop_na(DepDelay) %>% # pour éliminer les valeurs "NA"
  group_by(UniqueCarrier,Month) %>% 
  summarise(nbr=n(),min=min(DepDelay))
datatable(stat_companie2)

Nbr_vols<-hflights %>% 
  group_by(Month,Dest) %>% 
  summarise(nb_vol=n())
datatable(Nbr_vols)



