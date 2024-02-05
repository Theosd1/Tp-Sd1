# Exercice 1 : objets et vecteurs
  # 1

a = 10
b = 5
  
  #2

resultat = a*b
print (resultat)

  #3

A = 7.2
B= 10.1
# le lanagage R est sensible a la casse ( majuscule/ minuscule) ici nous avons 4 objets qui sont a,b,A,B

  #4

resultat = A*B
print(resultat)
#La précédente valeur de l'object resultat a été supprimée et remplacée par la somme de A et B.")

  #5

rm(a,b,A,B,resultat) # on a tout supprimer avec la fonction rm

  #Exercice 2 fonction usuelle
  
  #1

vecteur = c(1,2,3,4,5)
class(vecteur)
vecteur[3]

  #1

v1 = 1:5

  #2

v2 = v1 + 3

  #3

v3 = 1:6

  #4

v4 = v3^2

  #5

v5 = v4/2

  #6

jour = c("Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi","Dimanche")
jour[2]
jour[7]

  #7

bolléene = c(TRUE,FALSE)
class(bolléene)

  #8

numérique = c(1,2,3,4)
class(numérique)
numérique[-3] # ceci prend tout les elements de la liste sauf le chiffre 3
# autre moyen de prendre toutes les valeurs sauf 3 : numérique(c(1,2,4))

  #9

mois = c("Janvier","Fevrier","Mars","Avril","Mai","Juin","Juillet","Aout","Septembre","Octobre","Novembre","Decembre")
class(mois)
mois = [c(1,2,3)] # ceci affiche les 3 premiers mois de la liste

  #10

négatif = c(-1,-2,-3,-4,-5)  # creation de liste de nombre négatif
class(négatif)
négatif [c(5,1)]  # ceci affiche la derniere valeur ( en position 5) et la premiere valeur de la liste ( position 1)

  #11

fruits = c("Banane","Fraise","Mangue","Ananas")
class(fruits)
fruits[-c(1,2)] #ceci prend tout les elements de la liste sauf les 2 premiers

  #12

manquante =c(1,2,NA) # creation d'une liste et NA signifie des valeurs non renseigné
class(manquante)

# les fonctions c(),seq(),lenght()

  #1

séquence = seq(from = 1 ,to = 10)
length(séquence)

  #2

séquence2 = seq(2,20, by =2)  # ceci créer une liste de nombre de 2 à 20 avec un pas de 2 (le by)
length(séquence2)

  #3

décroissante = seq(from = 0, to =-5) #ceci creer une liste de 0 à -5
length(décroissante)

  #4

séquence = seq(5,50, by=5)
length(séquence)

  #5

déc = seq(from =10, to =1, by = -1) # créer une liste de nombre de 10 à 1 en ordre decroissant
length(déc)

  #6

séq = seq(from =0, to =1, by=0.1) 
length(séq)

  #7
voir correction

  #8

séq = seq(from=1, to = 10, by =2)  #Générer une séquence de 1 à 10 avec seulement les nombres impairs puis calculer la longueur du vecteur.

# les fonctions c(), rep()

  #1
vecteur = rep(3, times = 5) # repete le nombre 3 cinq fois et le stocke dans un vecteur
length(vecteur)

  #2
vecteur =  rep(c("A","B","C", times = 3)) # ceci repete les lettres A,B et C 3 fois chacune

  #3

vecteur = rep(1:3, times = 3) # ceci affiche les vecteurs de 1 à 3, 3 fois chacun

  #4

vecteur = rep(c(TRUE,FALSE, times = 4))

  #5

rm(vecteur)

#EXERCICE 3

  #1

vecteur =runif(5,min =0, max =1)
vecteur
mean(vecteur)
median(vecteur) #moyenne, medianne, max et min de notre vecteur
min(vecteur)
max(vecteur)

  #2

vecteur = runif(10,min= -5, max =5)
vecteur
mean(vecteur)
median(vecteur)
min(vecteur)
max(vecteur)

  #3 
correction

  #4
correction

# les fonctions rnom, 
echantillon <- rnorm(n = 200, mean = -2, sd = 3)
moyenne <- mean(echantillon)
ecart_type <- sd(echantillon)
print(paste("Moyenne : ", moyenne))
print(paste("Écart-type : ", ecart_type))
hist(echantillon)