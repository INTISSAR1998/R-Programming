# Data manipulation: (suite) :package dplyr
# les fonctions:
# 1. filter(): 
# 2. slice():
# 3. arrange ():
# la fonction pipe %>% 
# 4. select():
# 5. mutate()
# 6. summarise(), summarize_at() et summarize_all()
# 7. group_by()

##################################################
# install.packages("tidyverse")
# install.packages("dplyr")
library(tidyverse)
library(tidyr)
library(dplyr)
library(DT)

# chargement des données
library(hflights)
data(hflights)
str(hflights)
glimpse(hflights)
names(hflights)
?hflights

# les fonction de dplyr relatives aux colonnes (variables)

# première fonction: la fonction select()
# exemple: créer une base à partir de hflights
# qui contient les variables Year, Month, UniqueCarrier et Depdelay

base1<-hflights %>% 
  select(Year,Month,UniqueCarrier,DepDelay)

base2<-hflights %>% 
  select(-Year,-Month,-UniqueCarrier,-DepDelay)

base3<-hflights %>% 
  select(1:6)

# une deuxième fonction: la fonction mutate()
# créer une ou plusieurs nouvelles variables au  niveau de la base
# 1. variables d'origine, 2. fonction de calcul
# exemple 1: DepDelay et ArrDelay minutes---> heures

hflights<-hflights %>% 
  mutate(DEPDELAY=round(DepDelay/60,3))

hflights<-hflights %>% 
  mutate(ARRDELAY=round(ArrDelay/60,3))

# Utiliser la fonction mutate() pour recoder une variable
# sous fonction case_when()
# exemple: céer une variable "Type_de_Retard" selon les tests suivants
# 1. retard à l'arrivée et au départ: DepDelay>0 et ArrDealy>0
# 2. retard à l'arrivé: ArrDelay>0 et DepDelay<=0
# 3. Retard au départ. ArrDelay<=0 et DepDelay>0
# 4. Pas de retard. ArrDelay<=0 et DepDelay<=0

hflights<-hflights %>% 
  mutate(Type_de_Retard=case_when(
    DepDelay>0 & ArrDelay>0~ "Retard à l'arrivée et au départ",
    ArrDelay>0 & DepDelay<=0 ~ "Retard à l'arrivée",
    ArrDelay<=0 & DepDelay>0 ~ "Retard au départ",
    ArrDelay<=0 & DepDelay<=0 ~ "Pas de reatrd"))
    
# La fonction summarise(): permet de résumer les valeurs dans une colonne
# en une seule valeur
# les valeurs:
# une moyenne: mean()
# un écart-type: sd()
# maximum: max()
# minimum: min()
# nombre d'observation: n()
# nombre d'observations distinct: n_distinct()

# exemple: résumer la variable Distance en calculant
# moyenne, ecart_trype, minimum, maximum et metter le résulat
# dans un tableau en utilisant la fonction datatable (DT)

Stat<-hflights %>% 
  drop_na(Distance) %>% 
  summarise(Moy_Dist=mean(Distance,na.rm=TRUE),
            Ecart_type_DISt=sd(Distance,na.rm=TRUE),
            Maximum_Dist=max(Distance),
            Minimum_Dist=min(Distance),
            Obser=n(),
            Obser_distinct=n_distinct())
datatable(Stat)

# refaire le même calcul mais pour deux variables à la fois
# Depdelay et ArrDelay

Stat2<-hflights %>% 
  drop_na(DepDelay) %>% 
  summarise(Moy_Depdelay=round(mean(DepDelay,na.rm=TRUE),2),
            Moy_ArrDElay=round(mean(ArrDelay,na.rm=TRUE),2),
            Ecart_type_DISt=round(sd(DepDelay,na.rm=TRUE),2),
            Maximum_Dist=max(DepDelay),
            Minimum_Dist=min(DepDelay),
            Obser=n(),
            Obser_distinct=n_distinct())
datatable(Stat2)

# summarize_at

Stat4<-hflights %>% 
  drop_na(DepDelay,ArrDelay,ArrTime) %>% 
  summarise_at(vars(DepDelay,ArrDelay,ArrTime), funs(mean,sd,min,max))
datatable(Stat4)

# summarize_all

hflights %>%
  summarise_all(funs(mean,sd))

# summarise_if
hflights %>% 
  summarise_if(is.numeric,funs(mean,sd))


# la fonction group_by() avec la foinction summarise()
# calculer la distance moyenne parcourue par chaque companie

Moyenne<-hflights %>% 
  group_by(UniqueCarrier) %>% 
  summarise(Moyenne=mean(Distance))
datatable(Moyenne)
Moyenne


Moyenne<-hflights %>% 
  group_by(Month) %>% 
  summarise(Moyenne=mean(Distance))
datatable(Moyenne)
Moyenne

Moyenne<-hflights %>% 
  group_by(UniqueCarrier,Month) %>% 
  summarise(Moyenne=mean(Distance))
datatable(Moyenne)
Moyenne
