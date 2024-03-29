# TP 4

#EXERCICE 1

  #1

#on ecrit une fonction qui passe le salaire brut en net
salaire_net_cadre = function(salaire_brut) {
  salaire_net_avant_impot = salaire_brut * 0.75
  return(salaire_net_avant_impot) }
#Test de la fonction
salaire_net_cadre(salaire_brut = 3000)

  #2

salaire_net_cadre = function(salaire_brut = 2500) {
  salaire_net_avant_impot = salaire_brut * 0.75
  return(salaire_net_avant_impot) }
#Test de la fonction
salaire_net_cadre()



  #3

salaire_net_cadre = function(salaire_brut = 2500, temps_travail = 1) {
  salaire_net_avant_impot = salaire_brut *0.75 * temps_travail
  return(salaire_net_avant_impot)
}

#test de la fonction
salaire_net_cadre(salaire_brut = 3000, 
                  temps_travail = 0.8)


  #4

salaire_net_cadre = function(salaire_brut = 2500, temps_travail = 1) {
  if(!is.numeric(salaire_brut))  {
    return("Erreur : le salaire brut doit etre une valeur numerique")
  }
  
  salaire_net_avant_impot = salaire_brut *0.75*temps_travail
  return(salaire_net_avant_impot)
}

#Test de la fonction
salaire_net_cadre(salaire_brut = "2000€")
salaire_net_cadre(salaire_brut = 2000)


  #5

salaire_net_cadre = function(salaire_brut = 2500,temps_travail = 1) {
  
  if (!is.numeric(salaire_brut)) {
    return("Erreur :  le salaire brut doit être une valeur numérique")
  }
  
  if (!is.numeric(temps_travail)) {
    return("Erreur :  le temps de travail doit doit être une valeur numérique")
  }
  
  if ( (temps_travail > 1) | (temps_travail < 0)) {
    return("Erreur :  le temps de travail doit être une valeur numérique entre 0 et 1")
  }
  
  salaire_net_avant_impot = salaire_brut * 0.75 * temps_travail
  return(salaire_net_avant_impot) 
}
#Test de la fonction
salaire_net_cadre(salaire_brut = 2000, temps_travail = "100%")
salaire_net_cadre(salaire_brut = 2000, temps_travail = 0.8)
salaire_net_cadre(salaire_brut = 2000, temps_travail = 100)

  #6

salaire_net = function(salaire_brut = 2500, temps_travail = 1, statut) {
  if (!is.numeric(salaire_brut)) {
    return("Erreur :  le salaire brut doit être une valeur numérique")
  }
  
  if (!is.numeric(temps_travail)) {
    return("Erreur :  le temps de travail doit doit être une valeur numérique")
  }
  
  if ( (temps_travail > 1) | (temps_travail < 0)) {
    return("Erreur :  le temps de travail doit être une valeur numérique entre 0 et 1")
  }
  if (!statut %in% c("cadre","non cadre")) {
    return("Erreur :  le statut doit être cadre ou non cadre")
  }
  
  if (statut == "cadre") {
    salaire_net_avant_impot = salaire_brut * temps_travail * 0.75
  } else {
    salaire_net_avant_impot = salaire_brut * temps_travail * 0.78
  }
  
  return(salaire_net_avant_impot) 
}
#Test de la fonction
salaire_net(salaire_brut = 2000, statut = "cadre")
salaire_net(salaire_brut =2000, statut = "non cadre")
salaire_net(salaire_brut = 2000, statut = "technicien")

  #7

salaire_net = function(salaire_brut = 2500,temps_travail = 1, statut) {
  
  if (!is.numeric(salaire_brut)) {
    return("Erreur :  le salaire brut doit être une valeur numérique")
  }
  
  if (!is.numeric(temps_travail)) {
    return("Erreur :  le temps de travail doit doit être une valeur numérique")
  }
  
  if ( (temps_travail > 1) | (temps_travail < 0)) {
    return("Erreur :  le temps de travail doit être une valeur numérique entre 0 et 1")
  }
  
  if (!statut %in% c("cadre","non cadre")) {
    return("Erreur :  le statut doit être cadre ou non cadre")
  }
  
  if (statut == "cadre") {
    salaire_net_avant_impot = salaire_brut * temps_travail * 0.75
  } else {
    salaire_net_avant_impot = salaire_brut * temps_travail * 0.78
  }
  
  if (salaire_net_avant_impot <= 1591) {
    salaire_net_apres_impot <- salaire_net_avant_impot
  } else if (salaire_net_avant_impot <= 2006) {
    salaire_net_apres_impot <- salaire_net_avant_impot * (1 - 0.029)
  } else if (salaire_net_avant_impot <= 3476) {
    salaire_net_apres_impot <- salaire_net_avant_impot * (1 - 0.099)
  } else if (salaire_net_avant_impot <= 8557) {
    salaire_net_apres_impot <- salaire_net_avant_impot * (1 - 0.20)
  } else {
    salaire_net_apres_impot <- salaire_net_avant_impot * (1 - 0.43)
  }
  
  return(salaire_net_apres_impot) 
}

#Exercice 2

  #1

resultat = 0 
for (element in c(1,2,3,4,5)) {
  resultat = resultat + element
  print(paste("le resultat est : ",resultat))
}

  #2

element = 1
resultat = 0
while (resultat <= 50) {
  resultat = resultat + element
  print(paste("le resultat est : ", resultat))
  print(paste("le programme s'est arrêté à la valeur : ", element))
  element = element +1
}

  #3

for (colonne in colnames(iris)) {
  type_colonne = class(iris[colonne])
  print(paste("la colonne", colonne, "est de type : ", type_colonne))
}

  #4

#initialisation de l'indice de colonne
indice_colonne = 1
# Tant qu'il reste des colonnes à parcourir dans iris
while (indice_colonne <= ncol(iris)) {
  # Récupération du nom de la colonne
  nom_colonne <- colnames(iris)[indice_colonne]
  
  # Récupération du type de données de la colonne
  
  # Affichage du résultat
  print(paste("la colonne ", nom_colonne, " est de type : ", type_colonne))
  
  # Passage à la colonne suivante
  indice_colonne <- indice_colonne + 1
}

#Exercice 3

  #1

# Boucle pour demander 5 fois un nombre à l'utilisateur
for (i in 1:5) {
  
  # Demander à l'utilisateur d'entrer un nombre
  nombre <- readline(prompt = "Entrez le nombre :")
  nombre <- as.numeric(nombre)
  
  # Calculer le carré du nombre
  carre <- nombre^2
  
  # Afficher le carré du nombre
  print(paste("Le carré de", nombre, "est", carre))
}
