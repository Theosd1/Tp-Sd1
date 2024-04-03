#TD 1

#EXERCICE 1

#1

a <- 10
b <- 5

#2

resultat <- a * b
print(resultat)

#3

A <- 7.2
b <- 10.1
print("Le langage R est sensible à la casse (majuscule/minuscule) car nous avons 4 objets a,b,A et B")

#4

resultat <- A + B
print(resultat)
print("La précédente valeur de l'object resultat a été supprimée et remplacée par la somme de A et B.")

#5

rm(a,A,b,B,resultat)
#OU
rm(list = ls())

#EXERCICE 2

#1

vecteur <- c(1, 2, 3, 4, 5)
class(vecteur)
vecteur[3]

#2

v1 <- 1:5

#3

v2 <- v1 + 3

#4

v3 <- 1:6

#5

v5 <- v4 / 2


#6

vecteur <- c("Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche")
class(vecteur)
vecteur[c(2,7)]

#7

vecteur <- c(TRUE, FALSE, TRUE, FALSE, TRUE)
class(vecteur)

#8

vecteur <- c(1.2, 2.5, 3.8, 4.1, 5.6)
class(vecteur)
vecteur[-3]

#9

vecteur <- c("Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre")
class(vecteur)
vecteur[c(1,2,3)]

#10

vecteur <- c(-1, -2, -3, -4, -5)
class(vecteur)
vecteur[c(5,1)]

#11

vecteur <- c("Pomme", "Banane", "Orange", "Fraise", "Ananas")
class(vecteur)
vecteur[-c(1,2)]

#12

vecteur <- c(1, 2, NA, 4, 5)
class(vecteur)

#13

ma_sequence <- seq(from = 1, to = 10)
length(ma_sequence)

#14

ma_sequence <- seq(from = 2, to = 20, by = 2)
length(ma_sequence)

#15

ma_sequence <- seq(from = 0, to = -5)
length(ma_sequence)

#16

ma_sequence <- seq(from = 5, to = 50, by = 5)
length(ma_sequence)

#17

ma_sequence <- seq(from = 10, to = 1, by = -1)
length(ma_sequence)

#18

ma_sequence <- seq(from = 0, to = 1, by = 0.1)
length(ma_sequence)

#19

ma_sequence <- seq(from = 5, to = -5, by = -1)
length(ma_sequence)

#20

a_sequence <- seq(from = 1, to = 10, by = 2)
length(ma_sequence)

#21

vecteur <- rep(3, times = 5)

#22

vecteur <- rep(c('A', 'B', 'C'), times = 3)

#23

vecteur <- rep(1:3, times = 3)

#24

vecteur <- rep(c(TRUE, FALSE), times = 4)

#25

rm(vecteur)

#EXERCICE 3

#26

vecteur <- runif(n = 5, min = 0, max = 1)
vecteur
mean(vecteur)
median(vecteur)
min(vecteur)
max(vecteur)

#27

vecteur <- runif(n = 10, min = -5, max = 5)
vecteur
mean(vecteur)
median(vecteur)
min(vecteur)
max(vecteur)
