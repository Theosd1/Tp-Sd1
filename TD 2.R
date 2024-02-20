#TD 2

# Exercice 1

  #1 #j'ai mis les fichiers dans un dossier data set sur l'ordinateur

  #2 
getwd()
  
  #3

setwd(dir = "L://BUT/SD/Promo 2023/targoud/dataset") #avec setwd on change le repertoire et on affiche avec getwd le repertoire but/SD/PROMO... en tant que principal
getwd()
  
  #4

bodies_karts = read.csv(file = "bodies_karts.csv", header = TRUE, sep = ";", dec = ",") # on importe avec le fichier csv
drivers = read.csv(file = "drivers.csv", header = TRUE, sep = ";", dec = ",")
gliders = read.csv(file = "gliders.csv", header = TRUE, sep = "|", dec = ".")
tires = read.csv(file = "tires.csv", header = TRUE, sep = "\t", dec = ",")

  #5

dim(bodies_karts) # on affiche la dimension de chaque data set
dim(drivers)
dim(gliders)
dim (tires)
  
#EXERCICE 2

  #1  

summary(bodies_karts) # on fais un resumer de chaque data set
summary(drivers)
summary(gliders)
summary(tires)
  
  #2  

plot(x = drivers$Weight, #representation graphique 
     y = drivers$Acceleration,
     main = "Drivers : Weight/Acceleration")
#Il semble que les deux variables soient corrélées négativement
#Il y a autant de points mais ils sont superposés car certains drivers ont les mêmes statistiques

  #3

cor (x= drivers$Weight,  # calcul du coefficiant de correlation
     y =drivers$Acceleration)

  #4

covXY = cov(x = drivers$Weight, # on compare avec la formule du coeff de corelation
    y = drivers$Acceleration)
sX = sd(drivers$Weight)
sY = sd(drivers$Acceleration)
print (covXY /(sx*sY))

  #5

coeffCorr = cor(x = drivers$Weight, #calcul du coefficiant de determination
        y = drivers$Acceleration)
coefDeter = coeffCorr^2
print(coefDeter)

  #6

Matricecor = cor(drivers[ , -1]) # on enleve la premiere colonne car il n'y a pas de valeurs numeriques dans la premiere colonne
Matricecor = round(Matricecor, 2) # arrondi les valeurs avec 2 décimales
View (Matricecor)   #affiche la matrice dans une vue
#toutes les variables semblent fortement corrélés entre elles

  #7

install.packages("corrplot") # on installe le package corrplot

  #8

library(corrplot) #je charge mon package pour pouvoir utiliser ses fonctionalités
corrplot(Matricecor, method = "circle") 

  #9

# Pour tires

matriceCor = round(cor(tires[ , - 1]),1)  # on creer une matrice en enlevant la 1ere colonne et on enleve la 1ere colonne
corrplot(matriceCor, method="color",  
         type="upper", order="hclust", 
         addCoef.col = "black", # Ajout du coefficient de corrélation
         tl.col="black", tl.srt=45, #Rotation des étiquettes de textes
         # Cacher les coefficients de corrélation sur la diagonale
         diag=FALSE 
)


# Pour bodies_kart 

matriceCor = round(cor(bodies_karts[ , - 1]),1)
corrplot(matriceCor, method="color",  
         type="upper", order="hclust", 
         addCoef.col = "black", # Ajout du coefficient de corrélation
         tl.col="black", tl.srt=45, #Rotation des étiquettes de textes
         # Cacher les coefficients de corrélation sur la diagonale
         diag=FALSE 
)

# pour gliders

matriceCor = round(cor(gliders[ , - 1]),1)
corrplot(matriceCor, method="color",  
         type="upper", order="hclust", 
         addCoef.col = "black", # Ajout du coefficient de corrélation
         tl.col="black", tl.srt=45, #Rotation des étiquettes de textes
         # Cacher les coefficients de corrélation sur la diagonale
         diag=FALSE 
)
  
#EXERCICE 3

  #1

resultat = drivers[ , c("Driver" , "Weight")]  #on créer un objet resultat avec le nom du driver et son pod
View(resultat)

  #2

resultat = drivers[1:10 , c("Driver" , "Acceleration")] # on creer un objet resultat avec le nom du driver et son acceleration pour les 10 premieres lignes
View(resultat)

  #3

resultat = drivers [, -c(5,7,9)]  # tqbleau sans les colonnes 5,7 et 9
View(resultat)

  #4

