# Manipulation des données: autres formes de la fonction summarise()

library(tidyverse)
library(dplyr)

# Charger les données
library(hflights)
data(hflights)

# requête: on cherche à calculer les valeurs suivantes:
# Moyenne, Ecart_type, Minimum, maximum pour la varibale Distance
# en utilisant summarise()

hflights %>% 
  summarise(Moyenne=mean(Distance),
            Ecart_type=sd(Distance),
            Minimum=min(Distance),
            Maximum=max(Distance))
# refaire le calcul pour plusieurs variables DepDelay, ArrDelay et ArrTime
hflights %>% 
  drop_na(DepDelay) %>% 
  summarise(Moyenne=mean(DepDelay,na.rm=T),
            Ecart_type=sd(DepDelay,na.rm=T),
            Minimum=min(DepDelay,na.rm=T),
            Maximum=max(DepDelay,na.rm=T))

hflights %>% 
  drop_na(DepDelay,ArrDelay) %>% 
  summarise(Moyenne_DepDelay=mean(DepDelay,na.rm=T),
            Moyenne_ArrDelay=mean(ArrDelay),
            Ecart_type=sd(DepDelay,na.rm=T),
            Minimum=min(DepDelay,na.rm=T),
            Maximum=max(DepDelay,na.rm=T))
# summarise_at

hflights %>% 
  drop_na(DepDelay,ArrDelay,ArrTime) %>% 
  summarise_at(vars(DepDelay,ArrDelay,ArrTime),funs(mean,sd))

# summarise_all
hflights %>% 
    summarise_all(funs(mean,sd))

# summartise_if
hflights %>% 
  summarise_if(is.numeric,funs(mean,sd))



