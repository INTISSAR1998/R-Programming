# Thème 3: la visualisation des données

# forme basique

x<-rnorm(100)
plot(x)
hist(x)

library(ggplot2)
library(tidyverse)
library(ggthemes)

# premier type de graph le bar plot
# charger les données
# la base diamonds
?diamonds

data("diamonds")
view(diamonds)

# reprsenter les données relative à la variable cut
# utiliser le bar plot

# bar plot basqiue

ggplot(data=diamonds, mapping=aes(x=cut))+
  geom_bar()
# changer la largeur des barres, couleur

ggplot(data=diamonds, mapping=aes(x=cut))+
  geom_bar(width=0.6,col="red",fill="yellow",alpha=0.8)

# chaque barre a sa propre couleur

ggplot(data=diamonds, mapping=aes(x=cut))+
  geom_bar(width=0.6,
           alpha=0.5,
           aes(fill=cut))

# chosir mes propres couleurs: scale_fill_manual

ggplot(data=diamonds, mapping=aes(x=cut))+
  geom_bar(width=0.6,
           alpha=0.5,
           aes(fill=cut))+
  scale_fill_manual(values=c("#FF7F00",
                             "#FFA500", 
                             "#FFD700", 
                             "#FF7F00",
                             "#FF7F24"))

# Ajouter les titres (graphe, axes) et modifier le thème

ggplot(data=diamonds, mapping=aes(x=cut))+
  geom_bar(width=0.6,
           alpha=0.5,
           aes(fill=cut))+
  scale_fill_manual(values=c("#FF7F00",
                             "#FFA500", 
                             "#FFD700", 
                             "#FF7F00",
                             "#FF7F24"))+
  labs(title="nombre de diamonds selon la qualité de la coupure",
       subtitle = "Dataset: Diamonds",
       caption="Source: propre calcul de l'auteur",
       x="Qualité de la coupure",
       y="Nombre de diamonds")+
  theme_fivethirtyeight()+
  coord_polar()

# package esquisse

install.packages("esquisse")

library(ggplot2)

ggplot(diamonds) +
 aes(x = carat, y = price, colour = cut) +
 geom_point(shape = "circle", size = 1.5) +
 scale_color_hue(direction = 1) +
 theme_minimal()


# représenter bar plot avec deux variables qualitatives


diamonds %>% 
  ggplot(aes(x=cut,fill=color))+
  geom_bar()


diamonds %>% 
  ggplot(aes(x=cut,fill=color))+
  geom_bar(position="dodge")+
  theme_minimal()+
  coord_flip()

# mulit facets

diamonds %>% 
  ggplot(aes(x=cut,fill=color))+
  geom_bar(position="dodge")+
  theme_minimal()+
  facet_grid(~color)

# autre type de graphe: scatter plot: nuage de points
library(gapminder)
data("gapminder")

# Exemple: représenter graphiquement l'espérance de vie moyenne
# pour les pays "Tunisia", Egypt et Algeria en utilisant bar plot

gapminder %>% 
  filter(country %in% c("Tunisia", "Egypt", "Algeria","Oman", "Qatar" )) %>% 
  group_by(country) %>% 
  summarise(Moyenne=mean(lifeExp)) %>% 
  ggplot(aes(x=country,y=Moyenne,fill=country))+
  geom_col()+
  theme_bw()


# scatter plot

gapminder %>% 
  ggplot(aes(x=lifeExp,y=gdpPercap))+
  geom_point(shape=0)

install.packages("plotly")
library(plotly)# graphique interactif

graph1<-gapminder %>% 
  ggplot(aes(x=lifeExp,y=gdpPercap,col=continent))+
  geom_point(shape=0)+
  theme_clean()
ggplotly(graph1)


# line plot

# l'évolution de l'espérance pour la Tunisia
gapminder$year<-as.factor(gapminder$year)
ggplotly(gapminder %>% 
  filter(country=="Tunisia") %>% 
  ggplot(aes(x=year,y=lifeExp))+
  geom_line()+
  geom_point(shape=25))









