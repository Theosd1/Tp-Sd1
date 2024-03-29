#TD 5

#EXERCICE 5

  #1

par(mfrow = c(1,1)) #creer une fenetre (toile) vide.
plot(NA, xlim =c(-5,5), ylim = c(0,1), xlab = "X",
ylab = "densité de probabilité",
main = "densités de probabilité \n de lois normales")

  #2

# Tracer la densité de probabilité pour chaque simulation
moyennes <- c(0, 0, 0, -2)
sigmas <- c(0.45, 1, 2.25, 0.7)
colors <- c("red", "blue", "green", "orange")
legend_labels <- c()
for (i in 1:length(moyennes)) {
  serie = rnorm(n = 1000, 
                mean = moyennes[i], 
                sd = sigmas[i])
  lines(density(serie), col = colors[i])
  legend_labels <- c(legend_labels, paste("m =", moyennes[i], ",", "s =", sigmas[i]))
}

# Ajouter une légende
legend("topright", legend=legend_labels, col=colors, lwd=2, cex=0.8)

  #3

serie = rnorm(n =10000, mean = 0, sd = 1) #cela simule une loi normale de taille 10000, de moyenne 0 et d'ecart type 1

  #4

hist(serie, main = "loi normale centree reduite", #creer un histogramme de la loi normale centree reduite
     probability = TRUE)                          # et traces les lignes de la série 
lines(density(serie))

  #5

median(serie)  #calcule la médiane de la série

  #6

quantile(serie) #calcule les quartiles de la série

  #7

quantile(serie, probs = seq(from = 0, to = 1, by = 0.01))  # calcule les centiles de la serie
quantile(serie, probs = 0.95) #le centile 0.95 donne une valeur de environ 1.64

  #8

qnorm(0.95, mean = 0, sd = 1) # en comparant avec qnorm on trouve une valeur de 1.64 egalement
pnorm(q = 1.644854, mean = 0, sd = 1) # en reprenant la valeur de qnorm (1.644854) on retrouve 0.95

  #9

qnorm(0.975, mean = 0, sd = 1) #valeur théorique pour P(X < x) = 0.975 , on trouve 1.96 en valeur

  #10

1- pnorm( q = 1.96, mean = 0, sd =1) #pour trouver P(X> 1.96) donc on trouve les 2.5% a droite de 1.96, car le 1.96 
                                                                                        #regroupe 97.5% des valeurs

#EXERCICE 2 

  #1

indices_lignes = seq(from = 0, to = 3.9, by = 0.1)

#création d'un vecteur nul pour afficher les probas au fur et a mesure
all_probas = c()
#on parcourt les indices lignes
for(i in indices_lignes) {
  proba = pnorm(q =i, mean = 0, sd = 1)
  #on ajoute la nouvelle proba au vecteur existant
  all_probas = c(all_probas, proba)
  all_probas = round(all_probas, digits = 4) #precision avec 4 décimales
}

  #2

indices_colones = seq(from = 0.00, to = 0.09, by = 0.01)
indices_lignes = seq(from = 0, to = 3.9, by = 0.1)

#On crée un objet résultat vide.
resultat = NULL
#On parcourt les indices colonnes
for (j in indices_colones) {
  #on crée un vecteur vide pour ajouter les probas au fur et à mesure
  all_probas = c()
  #On parcourt les indices lignes
  for (i in indices_lignes){
    quantile = i + j
    proba = pnorm(q = quantile, mean = 0, sd = 1)
    #on ajoute la nouvelle proba au vecteur existant
    all_probas = c(all_probas,proba)
    all_probas = round(all_probas,digits = 4)
  }
  #On ajoute une colonne au resultat
  resultat = cbind(resultat,all_probas)
}
  
  #3

class(resultat)
table = data.frame(resultat)
colnames(table) = indices_colones # modifie les colonnes des tables
rownames(table) = indices_lignes #modifie les lignes des tables
View(table)

#EXERCICE 3

  #1

moyenne_pop = 171     #produit les tailles d'une population similué de 10 000 000 de francais
sd_pop = 9            #reparti selon une loi normale N(171,9), en stockant les tailles dans un vecteur population
population = rnorm(n = 1e7,
                   mean = moyenne_pop,
                   sd = sd_pop)

  #2

mean(population) #moyenne poulation, on retrouve 171
sd(population)   #ecart-type population, on retrouve 9 (8.99)

  #3

hist(population) #oui on observe une courbe en cloche

  #4

#valeur observer 
pop190 = population[population< 190]
length(190)
length(pop190)/length(population)  #98.2% des personnes font moins de 1m90

#valeur théorique
pnorm(q =190, mean = moyenne_pop, sd= sd_pop)*1e7

  #5

#observer
pop200 = population[population > 200]
length(200)
length(pop200)/length(population) #0.06 % des personnes ont une taille supérieur à 2m

#valeur théorique
# Proba de P(X < 200cm)
proba_inf_200 = pnorm(q =200, mean = moyenne_pop, sd=sd_pop)
# Maitenant pour trouver P(X >= 200 cm)
1 - proba_inf_200


#EXERCICE 4

  #1


