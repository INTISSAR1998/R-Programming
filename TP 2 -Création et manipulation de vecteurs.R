

#---------------------------------------------------------------------------
# Exercice 1
#---------------------------------------------------------------------------

vec1 = 1:12
vec1 = c(vec1, c(16, 17, 18))

#---------------------------------------------------------------------------
# Exercice 2
#---------------------------------------------------------------------------

vec2 = c(0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5)
vec2 = seq(0, 5, by = 0.5)

#---------------------------------------------------------------------------
# Exercice 3
#---------------------------------------------------------------------------

vec3 = seq(2, 50, by = 2)
vec4 = rep(0:10, each = 3)
vec5 = rep(LETTERS, 1:26)
print(length(vec5))

#---------------------------------------------------------------------------
# Exercice 4
#---------------------------------------------------------------------------
a<- "coucou"
b<-"comment vas-tu?"
paste(a,b)
paste(a,b,sep="+")
paste(a,b,1:2,sep="")
vec6 = paste("individu", 1:100, sep = "")
vec7 = paste("chr", c(1:22,"X","Y"), sep="")

#---------------------------------------------------------------------------
# Exercice 5
#---------------------------------------------------------------------------
a=c("lannister", "targaryen", "baratheon", "starck", "greyjoy")
length(a)
a[1:3]
b = a[c(1,4)]
a[-1]
sort(a)
b=rev(sort(a))
#---------------------------------------------------------------------------
# Exercice 6
#---------------------------------------------------------------------------
nom<-c("nom1","nom2","nom3","nom4","nom15","nom6","nom7","nom8","nom9","nom10")
age<-c(36,37,35,21,25,45,53,59,24,42) #age=sample(25:34)
names(age)<-nom
poids<-c(60,53,65,78,87,82,59,73,79,89) #poids=sample(50:100, size=10)
names(poids)<-nom
taille<-c(160,168,175,169,185,180,178,190,179,188)
names(taille)<-nom
poids.lourds<-poids[poids>80]
taille.poids.lourds<-taille[poids>80]
taille.vieux.poids.lourds<-taille[poids>80&age>30]
#---------------------------------------------------------------------------
# Exercice 7
#---------------------------------------------------------------------------
x<-c(1,2,3,4,5)
y<-c(2,4,6,8,10)
length(x)==length(y)
plot(x,y)
plot(x,y, type = "b", pch = 3) # change les symboles
plot(x,y, type = "b") # ajoute une ligne
plot(x,y, type = "b",col = "red") # change la couleur
# ajoute un titre (Paramètre main) et des légendes sur chaque axe (paramètres xlab et ylab)
plot(x,y,main="y selon x",xlab="abscisse",ylab="ordonnée",type = "b",col = "red") 
#---------------------------------------------------------------------------
# Exercice 8
#---------------------------------------------------------------------------
#Création de 2 vecteurs dans R2
u1=c(2,1)
u2=c(1,3)
#Création d'un plan et ajout d'une grille
plot(NA, xlim=c(0,5), ylim=c(0,5), xlab="x1", ylab="x2")
grid(col = "red", lty = "dotted", lwd = 1)
#Représentation des vecteurs dans le plan
segments(0,0,u1[1],u1[2],col="black")
segments (0,0,u2[1],u2[2],col="red")
segments (0,0,u1[1]+u2[1],u1[2]+u2[2],col="green")

