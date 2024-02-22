# TP 2

#Exercice 1

  #1

setwd("L:/BUT/SD/Promo 2023/targoud/Semestre 2/R2.04  progra statistiques")
df = read.csv("fao.csv", header = TRUE, dec = ",", sep =";")
View(df)

  #2

nrow(df) #fonction qui permet de compter le nombre de pays dans le data set

  #3

summary(df)

#Exercice 2

  #1

mean(df$Dispo_alim)   #disponibilité alimentaire moyenne 

  #2

sum(df$Population,na.rm = TRUE)  # le na.rm permet d'exclure les valeurs NA
                                 # calcul du nombre d'habitant

  #3

sd(df$Import_viande,na.rm = TRUE) # calcul l'ecart type du volume des exportations et importations de viande
sd(df$Export_viande,na.rm = TRUE)

  #4

median(df$Prod_viande, na.rm = TRUE)  # calcul de la mediane du volume de production de viande

  #5

quantile(df$Dispo_alim, probs = c(0.25,0.5,0.75)) #calcul des quartiles de disponibilite alimentaire 

  #6

quantile(df$Import_viande, probs = seq(0,1,0.01)) #calcul des centiles d'importation de viande

#EXERCICE 3

  #1


pop = order(df$Population)
head(df[order(df$Population),] ,n=5)
head(df[order(df$Population,decreasing =FALSE),], n=5 ) # on affiche les pays les moins peuplés 


  #2

pop = order(df$Population)
head(df[order(df$Population),] ,n=5)
head(df[order(df$Population, decreasing =TRUE),], n=5 ) # on affiche les 5 pays les plus peuplés

  #3

viande = order(df$Prod_viande)
head(df[order(df$Prod_viande),], n=5)
head(df[order(df$Prod_viande ,decreasing = TRUE),], n =5)  #on affiche les 5 pays qui produisent le plus de viandes
                                                            #il faut bien mettre une virgule avant le decreasing et apres le TRUE

  #4

viande = order(df$Import_viande)
head(df[order(df$Import_viande),], n=5)
head(df[order(df$Import_viande ,decreasing = TRUE),], n =5) # extrait les 5 pays qui importent le plus de viande


  #5

nrow(subset(df,df$Dispo_alim>2300)) # compte le nombre de pays qui ont une disponibilité superieur ou egale a 2300 kcal
                                    #il y a 163 pays

  #6

nrow(subset(df,df$Dispo_alim>3500 & df$Prod_viande>1000))  # compte le nombre de pays qui ont une dispo alimentaire superieur a 3500 kcal
                                                            # et importe un volume de viande superieur ou egale a 1 000 000 de tonnes

  #7

subset(df,df$Nom %in% c("France","Belgique"))  # on extrait les lignes que pour la France et la Belgique


#Exercice 4

  #1

df$part_export = df$Export_viande/df$Prod_viande   #on ajoute une colonne part export qui correpond a la part 
View(df)

  #2

df$dispo_alim_pays = df$Dispo_alim*df$Population    #on ajoute une colonne dispo alim pays qui correspond a la disponibilite total
View(df)

  #3

write.table(df, file = "Export.tp2.csv", sep =";",row.names = FALSE)  #on exporte le nouveau datafram dans un fichier nomm export.tp2.csv

  #4

dispo_mondial = sum(df$dispo_alim_pays,na.rm = TRUE)  #on calcul la somme de la disponibilité mondiale
print(dispo_mondial)


  #5

nb_person = dispo_mondial/2300     #calcul le nombre d'humain que on pourrait nourrir avec la dispo alimentaire dispo
print(nb_person)      #car en moyenne, un adulte consomme 2300 kgcal par jour

