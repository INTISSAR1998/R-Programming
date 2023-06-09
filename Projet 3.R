# EXERCICE 1 : Scatter-plot
# R�ponse 1
library(ggplot2)
# R�ponse 2
data(iris)
head(iris)
summary(iris)
# Il contient 150 observations de 5 variables :
# Sepal.Length : longueur de la s�pale
# Sepal.Width : largeur de la s�pale
# Petal.Length : longueur du p�tale
# Petal.Width : largeur du p�tale
# Species : esp�ce de la fleur.
# R�ponse 3
ggplot(data = iris,
       aes(x=Sepal.Length, y=Sepal.Width))+ geom_point()
# R�ponse 4
ggplot(data = iris,
       aes(x=Sepal.Length, y=Sepal.Width))+ geom_point()+ aes(colour = Species)
# R�ponse 5
ggplot(data = iris,
       aes(x=Sepal.Length, y=Sepal.Width,colour = Species))+ geom_point()+facet_grid(~Species)
# R�ponse 6
ggplot(data = iris,
       aes(x=Sepal.Length, y=Sepal.Width,colour = Species))+ geom_point()+facet_grid(~Species)+theme_bw()+ggtitle("Plot of Sepal Width by Sepal Length")+xlab("Sepal Length") + ylab("Sepal Width")
# R�ponse 7
ggplot(data = iris,
       aes(x=Sepal.Length, y=Sepal.Width,colour = Species))+ geom_point()+facet_grid(~Species)+stat_smooth(method = "glm",formula=y~poly(x,2),geom = "line", color = "black") 



# EXERCICE 2 : Box-plot
# R�ponse 1
install.packages('mlbench')
library(mlbench)
data(Glass)
# R�ponse 2
install.packages("plotly", type = "source")
library(plotly)
ggplot(Glass)+geom_boxplot(data[,7], main=names(data)[7])
rep2 <- ggplot(Glass, aes(x=Type,y=Ca,fill=Type))+geom_boxplot()
ggplotly(rep2)
# R�ponse 3
rep3 <- ggplot(Glass, aes(x=Type,y=Ca,fill=Type))+geom_boxplot()+labs(title = "")+theme_dark()
ggplotly(rep3)
# R�ponse 4
Glass.reshaped <- reshape2::melt(Glass[,6:10], id.vars="Type")
head(Glass.reshaped)

rep4 <- ggplot(Glass.reshaped, aes(x=Type,y=value,fill=Type))+geom_boxplot()+facet_wrap(~variable)+labs(title = "")+theme_dark()
ggplotly(rep4)
# R�ponse 5
rep5 <- ggplot(Glass.reshaped,aes(x=Type,y=value,fill=Type))+geom_boxplot()+facet_wrap(~variable,scales = "free")+labs(title = "")+theme_dark()+scale_fill_brewer(palette = "")
ggplotly(rep5)



# EXERCICE 3 : Line plot
install.packages('gapminder')
library(gapminder)
library(dplyr)
library(ggplot2)
library(plotly)
?gapminder
str(gapminder)
head(gapminder)

data <- gapminder%>%
        filter(country %in% c('China','Tunisia','United States','Germany'))
# R�ponse 1
for (x in c('China','Tunisia','United States','Germany')) {
  plot1 <- data %>%
    filter(country==x)%>%
    ggplot(aes(x=lifeExp,y=gdpPercap,col=continent))+geom_col()
  plot(plot1)
}

# R�ponse 3
install.packages("plotly", type = "source")
library(plotly)
plot2 <- ggplot(data, aes(x=year,y=lifeExp,fill=country))+geom_point()
ggplotly(plot2)

plot3 <- ggplot(data, aes(x=year,y=pop,fill=country))+geom_point()
ggplotly(plot3)

plot4 <- ggplot(data, aes(x=year,y=gdpPercap,fill=country))+geom_point()
ggplotly(plot4)
# R�ponse 4
plot5 <- plot2+facet_wrap(~continent)
ggplotly(plot5)

plot6 <- plot3+facet_wrap(~continent)
ggplotly(plot6)

plot7 <- plot4+facet_wrap(~continent)
ggplotly(plot7)
# R�ponse 5
plot8 <- ggplot(data, aes(x=year,y=lifeExp,fill=country))+geom_point(shape=0,size=1)+facet_wrap(~continent)
ggplotly(plot8)

plot9 <- ggplot(data, aes(x=year,y=pop,fill=country))+geom_point(shape=2,size=2)+facet_wrap(~continent)
ggplotly(plot9)

plot10 <- ggplot(data, aes(x=year,y=gdpPercap,fill=country))+geom_point(shape=3,size=3)+facet_wrap(~continent)
ggplotly(plot10)
# R�ponse 6
plot11 <- ggplot(data, aes(x=year,y=lifeExp,fill=country))+geom_point(shape=0,size=1,alpha=0.5)+facet_wrap(~continent)
ggplotly(plot11)

plot12 <- ggplot(data, aes(x=year,y=pop,fill=country))+geom_point(shape=2,size=2,alpha=0.5)+facet_wrap(~continent)
ggplotly(plot12)

plot13 <- ggplot(data, aes(x=year,y=gdpPercap,fill=country))+geom_point(shape=3,size=3,alpha=0.5)+facet_wrap(~continent)
ggplotly(plot13)
# R�ponse 7
plot14 <- ggplot(data, aes(x=year,y=lifeExp,fill=country))+geom_point(shape=0,size=1,alpha=0.5)+facet_wrap(~continent)+scale_y_log10()
ggplotly(plot14)

plot15 <- ggplot(data, aes(x=year,y=pop,fill=country))+geom_point(shape=2,size=2,alpha=0.5)+facet_wrap(~continent)+scale_y_log10()
ggplotly(plot15)

plot16 <- ggplot(data, aes(x=year,y=gdpPercap,fill=country))+geom_point(shape=3,size=3,alpha=0.5)+facet_wrap(~continent)+scale_y_log10()
ggplotly(plot16)
# R�ponse 8
plot17 <- ggplot(data, aes(x=year,y=lifeExp,fill=country))+geom_point(shape=0,size=1,alpha=0.5)+facet_wrap(~continent)+scale_y_log10()+scale_fill_brewer(palette = "Dark2")
ggplotly(plot17)

plot18 <- ggplot(data, aes(x=year,y=pop,fill=country))+geom_point(shape=2,size=2,alpha=0.5)+facet_wrap(~continent)+scale_y_log10()+scale_fill_brewer(palette = "Accent")
ggplotly(plot18)

plot19 <- ggplot(data, aes(x=year,y=gdpPercap,fill=country))+geom_point(shape=3,size=3,alpha=0.5)+facet_wrap(~continent)+scale_y_log10()+scale_fill_brewer(palette = "Set3")
ggplotly(plot19)
# R�ponse 9
# D�ja fait



# EXERCICE 4 : bar plot
library("gapminder")
View(gapminder)
base1 <- gapminder %>% 
  group_by(country) %>% 
  dplyr::summarise(
    moy_lifeExp = mean(lifeExp, na.rm=TRUE),
    moy_gdpPercap = mean(gdpPercap, na.rm=TRUE),
    sd_lifeExp = sd(lifeExp),
    sd_gdpPercap = sd(gdpPercap)
  ) 
base1
ggplot(base1, x=moy_lifeExp) +
  geom_bar(stat="identity")+theme_minimal()+scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"))
barplot(height = base1$moy_gdpPercap)
barplot(height = base1$sqrt_lifeExp)
barplot(height = base1$sqrt_gdpPercap)



# EXERCICE 5 : 
# R�ponse 1
library("gapminder")
data(economics)
?economics
# R�ponse 2
ggplot(data = economics, aes(x = date, y = pce)) +
  geom_line()
# R�ponse 3
p_1 <- ggplot(data = economics, aes(x = date, y = pce)) +
  geom_line(colour = "dodger blue", size = 0.3, alpha=0.5)
# R�ponse 4
p_1 <-
  p_1 +
  xlab("") + ylab("") +
  ggtitle("Personal Consumption Expenditures (billions dollars)")
# R�ponse 5
library(scales)
p_1 +
  scale_x_date(breaks = date_breaks("4 year"),
               labels = date_format("%Y"))



# EXERCICE 6 : 
# R�ponse 1
library(WDI)
table1 <- WDI(country = c("FR", "GB", "DE"),
          indicator = c("NY.GDP.PCAP.PP.KD", "SL.UEM.TOTL.ZS"),
          start = 1990, end = 2015)
head(table1)
# R�ponse 2
library(dplyr)
library(tidyverse)
table1 <-
  table1 %>%
  select(-iso2c) %>%
  gather(variable, valeur, NY.GDP.PCAP.PP.KD, SL.UEM.TOTL.ZS) %>%
  mutate(variable = factor(variable,levels = c("NY.GDP.PCAP.PP.KD", "SL.UEM.TOTL.ZS"),labels = c("GDP", "Unemployment")))
# R�ponse 3
ggplot(data = table1 , aes(x = year, y = valeur, colour = country)) +
  geom_line() +
  facet_wrap(~variable) +
  ylab("") + xlab("")
# R�ponse 4
ggplot(data = table1 , aes(x = year, y = valeur, colour = country)) +
  geom_line() +
  facet_wrap(~variable, scales = "free_y") +
  ylab("") + xlab("")
# R�ponse 5
ggplot(data = table1, aes(x = year, y = valeur, colour = country)) +
  geom_line(aes(linetype = country), size = 0.8) +
  scale_linetype_manual("country",
                        values = c("France" = "dotted",
                                   "Germany" = "dashed",
                                   "United Kingdom" = "longdash")) +
  facet_wrap(~variable, scales = "free_y") +
  ylab("") + xlab("")
# R�ponse 6
ggplot(data = table1, aes(x = year, y = valeur, colour = country)) +
  geom_line(aes(linetype = country), size = 0.8) +
  scale_linetype_manual("country",
                        values = c("France" = "dotted",
                                   "Germany" = "dashed",
                                   "United Kingdom" = "longdash")) +
  facet_wrap(~variable, scales = "free_y", dir = "v") +
  ylab("") + xlab("")
# R�ponse 7
ggplot(data = table1, aes(x = year, y = valeur)) +
  geom_line() +
  facet_wrap(country~variable, scales = "free_y") +
  ylab("") + xlab("")
# R�ponse 8
ggplot(data = table1, aes(x = year, y = valeur)) +
  geom_line() +
  facet_grid(country~variable, scales = "free") +
  ylab("") + xlab("")
# R�ponse 9
ggplot(data = table1, aes(x = year, y = valeur)) +
  geom_line() +
  facet_grid(variable~country, scales = "free") +
  ylab("") + xlab("")
