#TP 5

#EXERCICE 1

  #1

setwd("L:/BUT/SD/Promo 2023/targoud/Semestre 2/R2.04  progra statistiques/NBA")
getwd()

  #2
                   
fichiers = list.files(path = getwd(),  #permet de lister tout les dossiers du fichier
                      pattern = ".csv$", #si on a un fichier text, il faut mettre ".txt$"
                      full.names = TRUE)

  #3

library(tools)    #permet de tester sur le premier fichier de la liste afin de retrouver son nom 
print(fichiers[1])
nom_fichier = basename(path = fichiers [1])
nom_fichier_sans_extansion = file_path_sans_ext(x = nom_fichier)
print(nom_fichier_sans_extansion)

  #4

assign(x = nom_fichier_sans_extansion,  #Lire le fichier CSV et l'affecter à une variable avec le nom du fichier
       value = read.csv(fichiers[1],
       sep = ",",
       dec = "."))

  #5

#boucle qui va lire tout les fichiers CSV
for(fichier in fichiers){
  nom_objet = file_path_sans_ext(basename(fichier))
  
#lis le fichier CSV et l'affecter à une variable avec le nom du fichier
  start_time = Sys.time () #sys time permet de donner l'heure exact de l'execution
  assign(nom_objet, read.csv(fichier, 
                             sep = ",",
                             dec = "."))
  end_time <- Sys.time()
  # Calcul du temps écoulé
  execution_time <- end_time - start_time
  cat("Importation : ",nom_objet, "=" , execution_time , "\n")
}


#EXERCICE 2

  #1

 # combien de match se sont dérouler à los angeles depuis la création de la NBA 

df_x = subset(team, city == "Los Angeles", select = c("id", "city"))
df_y = subset(game, select = c("game_id", "team_id_home"))
dfJoin = merge(x = df_x, y = df_y, 
               by.x = "id", 
               by.y = "team_id_home", 
               all.x = TRUE)
nrow(dfJoin)
View(dfJoin)

  #2

#afflucance moyenne de spectateurs durant ces match joués à Los Angeles

df_x = dfJoin
df_y = subset(game_info, select = c("game_id", "attendance"))
dfJoin = merge(x = df_x, y = df_y, 
               by = "game_id",
               all.x = TRUE)
mean(dfJoin$attendance, na.rm = TRUE)
View(dfJoin)

  #3

#combien d'arbitres différents ont oficiés durant la saison 2020

df_x = subset(game_summary, season == 2020,
              select = c("game_id", "season"))
dfJoin = merge(x = df_x, y = officials, 
               by = "game_id",
               all.x = TRUE)
length(unique(dfJoin$official_id))
View(dfJoin)

  #4

#nombre de match que a arbitrer Dick bavetta chaque année

df_x = subset(game_summary,
              select = c("game_id", "season"))
df_y = subset(officials, first_name == "Dick" & last_name == "Bavetta")
dfJoin = merge(x = df_x, y = df_y, 
               by = "game_id",
               all.y = TRUE)
View(dfJoin)
table(dfJoin$season)


