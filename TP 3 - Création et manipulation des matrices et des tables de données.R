#---------------------------------------------------------------------------
# Exercice 1
#---------------------------------------------------------------------------
#1
a#2
A = matrix(a, ncol = 10, nrow = 10)
#3
dim(A)
ncol(A)
nrow(A)
#4
B = t(A)
#5
line1 = A[seq(2,10,2),]
col0 = B[,seq(1,10,2)]
#---------------------------------------------------------------------------
# Exercice 2
#---------------------------------------------------------------------------
#1
matrice = matrix(rnorm(n=100, mean = 0, sd = 2.32),nrow = 10, ncol=10)
#2
nbPos = length(which(matrice > 0))
idxNeg = which(matrice < 0)
nbNeg = length(idxNeg)
matrice[idxNeg] = 0
#3
apply(matrice, 1, sum)
apply(matrice, 2, sum)
#4
apply(matrice, 1, mean)
apply(matrice, 2, mean)
#5
rowSums(matrice); colSums(matrice)
rowMeans(matrice); colMeans(matrice)

#---------------------------------------------------------------------------
# Exercice 3
#---------------------------------------------------------------------------
#1
x = list(
  a = rnorm(10),
  b = rep(1, 10)
)
x[["a"]]
x$a
#2
y = as.data.frame(x)
#3
z1 = y[c(1:3) ,]
z2 = y[c(8:10),]
class(z1)
class(z2)
#4
x$chiffre = 1:26
#5
as.data.frame(x)
#---------------------------------------------------------------------------
# Exercice 4
#---------------------------------------------------------------------------
#1
data(sleep)
#2
typeof(sleep); class(sleep)
#3
table(sleep$group)
#4
length(which(sleep$extra < 0))
#5
s = rep(c("f","m","m","f","m","f","m","m","f","m"),2)
sleep2 = cbind(sleep, s)
#6
colnames(sleep2)
colnames(sleep2)[4] = "sex"
#7
table(sleep2$s, sleep2$group)
