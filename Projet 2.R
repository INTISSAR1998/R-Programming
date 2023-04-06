# EXERCICE 1 :
# Partie A :
library(readxl)
Data <- read_excel("E:/TEK-UP/DSEN-2/Semestre 2/Programmation R/Mr.Haykel ZOUAOUI/Projet 2/income_state.xlsx")
View(Data)
str(Data)
library(DataExplorer)
plot_str(Data)
plot_str(Data, type = "r")
introduce(Data)
plot_intro(Data)
plot_missing(Data)
plot_bar(Data)
plot_histogram(Data)
plot_correlation(na.omit(Data), maxcat = 5L)
# Partie B :
library(dplyr)
library(DT)
# Réponse 6
library(sampling)
srswr(3,20)

sample_n(Data,20,replace = T)
# Réponse 7
srswor(3,20)

sample_n(Data,20)
# Réponse 8
sample_frac(Data,0.15)
# Réponse 9
select(Data,-starts_with('Y'))
# Réponse 10
select(Data,Index:Y2006)
# Réponse 11
Data[,3:ncol(Data)]

Data[,-1:-2]

select(Data,matches("Y_*"))
# Réponse 12
install.packages("stringr")    
library("stringr")    
filter(Data,str_detect(State ,'^A|^C|^I'))

rep12 <- Data %>%  
  select(State,Y2015) %>%
  filter(str_detect(State ,'^A|^C|^I')) %>%
  arrange(Y2015)

datatable(head(rep12))
# Réponse 13
rep13 <- Data %>% 
  select(Index,State,Y2013,Y2014,Y2015) %>% 
  group_by(Index,State,Y2013,Y2014,Y2015) %>% 
  summarise(round(Mean_345=mean(c(Y2013,Y2014,Y2015),na.rm=TRUE),2))

datatable(head(rep13))
# Réponse 14
rep14 <- Data %>% 
  select(Index,State,Y2013,Y2014,Y2015) %>% 
  group_by(State) %>% 
  summarise(Mean_345=round(mean(c(Y2013,Y2014,Y2015),na.rm=TRUE),2),
            Median_345=round(median(c(Y2013,Y2014,Y2015),na.rm=TRUE),2))

datatable(head(rep14))
# Réponse 15
rep15 <- Data %>% 
  select(Index,Y2002,Y2005,Y2015) %>% 
  group_by(Index) %>% 
  summarise(Mean_345=round(mean(c(Y2002,Y2005,Y2015),na.rm=TRUE),2),
            nb_ob=n())

datatable(head(rep15))



# EXERCICE 2 :
Notes_Etudiant<- 
  tibble(
    Nom= c("mike", "carol", "greg", "marcia", "peter", "jan", "bobby", "cindy", "alice"),
    Ecole= c("south", "south", "south", "south", "north", "north", "north", "south", "south"),
    Enseignant = c("johnson", "johnson", "johnson", "johnson",  "smith", "smith", "smith", "perry", "perry"),
    Sexe= c("male", "female", "male", "female", "male", "female", "male", "female", "female"),
    Note_Math = c(4, 3, 2, 4, 3, 4, 5, 4, 5),
    Note_Lecture = c(1, 5, 2, 4, NA, 4, 1, 5, 4),
    Note_Physique = c(3, 5, 5, 4, 1, 4, 2, NA, 4),
    Note_Sport=c(4,4,5,4,5,3,4,2,NA)
     )
# Réponse 1
str(Notes_Etudiant)
# Réponse 2
Notes_Etudiant[1:3,]
datatable(head(Notes_Etudiant,n=3))
# Réponse 3
rep3 <- Notes_Etudiant%>%
  filter(Note_Math > round(mean(Note_Math,na.rm=TRUE),2))

datatable(head(rep3))
# Réponse 4
rep4_1 <- Notes_Etudiant %>%  
  arrange(desc(Note_Physique))

datatable(head(rep4_1,n=3))

rep4_2 <- Notes_Etudiant %>%
  slice_max(Note_Physique, n = 3, with_ties = FALSE)

datatable(head(rep4_2))
# Réponse 5
rep5 <- Notes_Etudiant %>%  
  arrange(Nom)

datatable(head(rep5))
# Réponse 6
rep6_1 <- Notes_Etudiant %>%
  arrange(desc(Sexe))

datatable(head(rep6_1))

rep6_2 <- Notes_Etudiant %>%
  select(Sexe,Note_Lecture)%>%
  group_by(Sexe)%>%
  summarise(mean=mean(Note_Lecture,na.rm=TRUE))

datatable(head(rep6_2))
# Réponse 7
rep7 <- Notes_Etudiant %>%
  arrange(desc(Note_Math),desc(Note_Physique))

datatable(head(rep7))
# Réponse 8
rep8 <- Notes_Etudiant %>%
  select(Ecole,Enseignant,Note_Math,Note_Lecture)%>%
  arrange(Ecole,Enseignant,Note_Math,Note_Lecture)

datatable(head(rep8))
# Réponse 9
rep9_1 <- Notes_Etudiant %>%
  select(Nom,Ecole,Enseignant,Sexe,Note_Physique,Note_Sport)

datatable(head(rep9_1))

rep9_2 <- Notes_Etudiant[ ,!(colnames(Notes_Etudiant) %in% c("Note_Lecture","Note_Math"))]

datatable(head(rep9_2))
# Réponse 10
rep10 <- Notes_Etudiant%>%
  filter(Note_Math > round(mean(Note_Math,na.rm=TRUE),2))

datatable(head(rep10))
# Réponse 11
rep11 <- Notes_Etudiant%>%
  select(Nom,Note_Math,Note_Lecture)%>%
  filter( Note_Math <= 3 & Note_Lecture <= 3)%>%
  mutate(Resultat='control')

datatable(head(rep11))
# Réponse 12
rep12 <- Notes_Etudiant%>%
  select(Enseignant,Nom,Note_Math)%>%
  filter( Note_Math ==5)

datatable(head(rep12))
# Réponse 13
Notes_Etudiant$Note_Math<-Notes_Etudiant$Note_Math*10
Notes_Etudiant$Note_Lecture<-Notes_Etudiant$Note_Lecture*10        
# Réponse 14
rep14_1 <- Notes_Etudiant%>%
  select(Nom,Note_Math,Note_Lecture,Note_Physique,Note_Sport,)%>%
  group_by(Nom)%>%
  summarise(moyenne=round(mean(c(Note_Physique,Note_Sport,Note_Lecture,Note_Math),na.rm=TRUE),2))

datatable(head(rep14_1))

rep14_2 <- Notes_Etudiant%>%
  select(Nom,Note_Math,Note_Lecture,Note_Physique,Note_Sport,)%>%
  summarise(moyenne_class=round(mean(c(Note_Physique,Note_Sport,Note_Lecture,Note_Math),na.rm=TRUE),2)) 

datatable(head(rep14_2))
# Réponse 15
rep15 <- Notes_Etudiant%>%
  select(Nom,Note_Math,Note_Lecture,Note_Physique,Note_Sport)%>%
  group_by(Nom)%>%
  summarise(moyenne=round(mean(c(Note_Physique,Note_Sport,Note_Lecture,Note_Math),na.rm=TRUE),2))%>% 
  mutate(resultat= case_when(moyenne<3.61~"Redouble",moyenne>=3.61~"Admis"))

datatable(head(rep15))
# Réponse 16
rep16 <- Notes_Etudiant%>%
  select(Ecole,Note_Math)%>%
  group_by(Ecole)%>%
  summarise(note_minMATH=min(Note_Math))

datatable(head(rep16))
# Réponse 17
rep17 <- Notes_Etudiant %>%
  select(Sexe,Note_Lecture)%>%
  group_by(Sexe)%>%
  summarise(Mean_Note=round(mean(Note_Lecture,na.rm=TRUE),2),
            Median_Note=round(median(Note_Lecture,na.rm=TRUE),2),nb_etudiants=n())

datatable(head(rep17))
# Réponse 18
rep18 <- Notes_Etudiant %>%
  select(Nom,Note_Math)%>%
  group_by(Nom)%>%
  mutate(Math_Note_Ex=Note_Math+5)%>%
  arrange(desc(Math_Note_Ex))

datatable(head(rep18))
# Réponse 19
col <- Notes_Etudiant[, -which(names(Notes_Etudiant) == "Enseignant")] 
rep19 <- Notes_Etudiant %>%
  select(colnames(col) )%>%
  group_by(Nom)%>%
  summarise(Note_Moyenne =round(mean(c(Note_Lecture,Note_Math),na.rm=TRUE),2))%>%
  arrange(Note_Moyenne)

datatable(head(rep19))
# Réponse 20
rep20 <- Notes_Etudiant %>%
  select(Sexe,Note_Math,Enseignant)%>%
  group_by(Sexe)%>%
  filter(!Enseignant=='smith')%>%
  summarise(Mean_Note=round(mean(Note_Math,na.rm=TRUE),2))

datatable(head(rep20))
--------------------------------------------------------------------------------

library(FactoInvestigate)
library(FactoMineR)
data(decathlon)
View(decathlon)
res = PCA(decathlon, quanti.sup = 11:12, quali.sup=13, graph=FALSE)
Investigate(res)
# Load Packages
library("FactoMineR")
library("FactoInvestigate")
# Principal component analyses
data(decathlon)
res.pca <- PCA(decathlon, quanti.sup = 11:12, quali.sup = 13, graph = FALSE)
Investigate(res.pca, file = "PCA.Rmd", document = "pdf_document", 
            parallel = TRUE)
# Correpondance analysis
data(children)
res.ca = CA(children, row.sup = 15:18, col.sup = 6:8, graph = FALSE)
Investigate(res.ca, file = "CA.Rmd", document = "html_document")
# Multiple correspondance analysis
data(tea)
res.mca = MCA(tea, quanti.sup = 19,quali.sup = 20:36, graph = FALSE)
Investigate(res.mca, file = "MCA.Rmd", document = c("word_document", "pdf_document"))

library(report)

model <- lm(Sepal.Length ~ Species, data = iris)
report(model)
report(iris)
report_performance(model)
report_statistics(model)