
#---------------------------------------------------------------------------
# Exercice 1
#---------------------------------------------------------------------------

# calcul de la valeur de cosinus de 65
cos(65)
# pour afficher le résultat avec source("Commandes.R"), il faut ajouter la fonction print()
print(cos(65))
print(cos(25))
print(cos(90))

phrase ="� un bon data analyst ne peut pas travailler sans connaitre le langage R"
# affichage 
print(phrase)

# conversion en majuscules
phraseMaj = toupper(phrase)
# affichage du résultat
print(phraseMaj)

# nbre de caract�res
nbreCarac = nchar(phrase)
# affichage du résultat
print(nbreCarac)

#---------------------------------------------------------------------------
# Exercice 2
#---------------------------------------------------------------------------

print(4850/26)

# seulement trois décimales
print(round(4850/26, 3))

# autre fonctions R : ceiling(); floor(); etc.
print(ceiling(4850/26))
print(floor(4850/26))

#---------------------------------------------------------------------------
# Exercice 3
#---------------------------------------------------------------------------

print(pi)
print(round(pi, 3))
print(round(pi, 5))

pi = pi + 12
print(pi)

pi = 9
print(pi)

#---------------------------------------------------------------------------
# Permanence des objets
#---------------------------------------------------------------------------
objects() 
ls()
#---------------------------------------------------------------------------

x=3 
rm(x) 
rm(list=ls())
#---------------------------------------------------------------------------

a <- 1 
typeof(a) 
t=is.integer(a) 
b <- as.integer(a) 
is.integer(b)
#---------------------------------------------------------------------------
c <- (1 > 2) 
c 
typeof(c)

#---------------------------------------------------------------------------
# Exercice 4
#---------------------------------------------------------------------------
#1
help("for")
#2
for (i in 1:10) print(i)
#3
somme = 0
for (i in seq(2,100,2)) {
  somme = somme + i
}
print(somme)
#---------------------------------------------------------------------------
# Exercice 5
#---------------------------------------------------------------------------
#1
help("if")
#2
x = 25
y=0
if (x > 0){
  y = x^2
}else{
  y = x^3
}
#3
for (i in -10:10){
  x = i
  y = 0
  if (x > 0){
    y = x^2
  }else{
    y = x^3
  }
  print(paste(i, y, sep=" => "))
}
#---------------------------------------------------------------------------
# Exercice 6
#---------------------------------------------------------------------------
i <- 10
res <- 1
while(i>1){
  res <- res * i
  i <- i-1
}
#---------------------------------------------------------------------------
# Exercice 7
#---------------------------------------------------------------------------
nombre_mystere <- 30
nb_tirages <- 0
while(sample(x = seq_len(100), size = 1) != nombre_mystere){
  nb_tirages <- nb_tirages + 1
}
nb_tirages
