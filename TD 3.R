#TD 3

#EXERCICE 1

  #1

install.packages("readxl") #il faut installer le package une seule fois apres il ne faut plus executer
library(readxl)
pokemon = read_excel(path = "L:/BUT/SD/Promo 2023/targoud/Semestre 2/R2.04  progra statistiques/pokemon.xlsx",sheet = "pokemon")


  #2

dim (pokemon)  #affiche le nombre de lignes et de colonnes ( 251 lignes et 10 colonnes ici)

  #3

summary(pokemon) # affiche le resumé des données

  #4

pokemon$generation = as.factor(pokemon$generation)  # modifie la variable generation et la transforme en type factor
pokemon$is_legendary = as.factor(pokemon$is_legendary) #modifie la variable is_legendary et la transforme en type factor
pokemon$type = as.factor(pokemon$type) #modifie la variable type et la transforme en type factor

  #5

summary(pokemon) #affiche le nouveau resumé des données 


#EXERCICE 2

  #1

med = median(pokemon$attack)  # on defini la mediane car on en a besoin apres
pokemon$attack_group = ifelse(pokemon$attack >= med,"Attack+", "Attack-") # on creer une variable pokemon$attack group avec les conditions du ifelse
pokemon$attack_group = as.factor(pokemon$attack_group) #on convertit en type factor
summary(pokemon$attack_group) #on fais un resumé de notre variable

  #2

pokemon$water_fire = ifelse(pokemon$type %in% c("water","fire"), "yes", "no") #pareil que precedemment avec %in% c() pour mettre 2 valeurs
pokemon$water_fire = as.factor(pokemon$water_fire)
summary (pokemon$water_fire)

  #3

q3_attack = quantile(pokemon$attack, probs = 0.75) #on creer le 3éme quartile de attack
q3_defense = quantile(pokemon$defense, probs = 0.75) #on créer le 3éme quartile de defense
q3_speed = quantile(pokemon$speed , probs = 0.75 ) #on créer le 3éme quartile de speed
pokemon$best = ifelse(pokemon$attack > q3_attack & pokemon$defense > q3_defense & pokemon$speed > q3_speed, "yes","no") #ifelse avec les quartile creer precedemment
pokemon$best = as.factor(pokemon$best)
summary(pokemon$best)

#fonction is.na

  #1

requete = subset(pokemon,is.na(weight_kg)) #filtre les données (avec la fonction subset) avec un objet requete avec les pokemons ayant des valeurs manquantes sur la colonne weight_kg.
View(requete)

  #2

med_weight_kg = median(pokemon$weight_kg, na.rm = TRUE)  #on creer la valeur de la mediane, puisque on va remplacer les NA par les valeurs de la mediane
pokemon$weight_kgNa = ifelse(is.na(pokemon$weight_kg) , 
                             med_weight_kg ,
                             pokemon$weight_kg)

med_height_m = median(pokemon$height_m, na.rm = TRUE) #on creer la valeur de la mediane, puisque on va remplacer les NA par les valeurs de la mediane
pokemon$height_mNA = ifelse(is.na(pokemon$height_m) , 
                            med_height_m ,
                            pokemon$height_m)

#fonction cut

  #1

pokemon$weight_group = cut(pokemon$weight_kg, breaks = 3, labels = c("leger","moyen","lourd")) # on creer une variable weight_group  regroupant 3 tranches 
View(pokemon$weight_group)

  #2

pokemon$height_m_group = cut(pokemon$height_m, breaks = c(0,1,2,3, max(pokemon$height_m, na.rm = TRUE)) #Créer une nouvelle variable nommée height_m_group en regroupant en 4 tranches telles que : ]0,1] / ]1,2] / ]2,3] / ]3,max]
                             
  #3
  
pokemon$defense_group = cut(pokemon$defense,breaks = quantile(pokemon$defense,na.rm = TRUE),include.lowest = TRUE)
summary(pokemon$defense_group) #creer une variable defense group qui regroupe 5 tranches avec  [min,Q1] / (Q1,Q2] / (Q2,Q3] / (Q3,max].


#EXERCICE 3

  #1

aggregate (x = attack ~ type, data = pokemon, FUN = function(x) mean(x)) #calcule la moyenne d'attack par type

  #2

aggregate(x = attack ~ generation + type,  #calcule la moyenne d'attack par generation et type
          data = pokemon, 
          FUN = function(x) median(x))

  #3

aggregate(x = pokedex_number ~ type,
          data = pokemon,
          FUN = function(x) length(x)) # calcul l'effectif par type

  #4

aggregate(speed ~ generation + type,
          data = pokemon, 
          FUN = function(x) c(moy = mean(x),
                              med = median(x),
                              eff = length(x) ) )