#TD 6

  #Script 1

df = read.csv(file = "L:/BUT/SD/Promo 2023/targoud/Semestre 2/R2.04  progra statistiques/NBA2014_2015.csv", sep = ",",
               header = TRUE, dec = ".") #mauvais file et header et sep et dec
nrow(df) #mettre df
ncol(df) #mettre df
colnames(df) #ajout du s a colonnes
View(df) # j'ai creer le view
df$PERIOD = as.factor(df$PERIOD) #period en majuscule
df$PTS_TYPE = as.factor(df$PTS_TYPE) #manque le tiret dans pts-type et fleche mauvais type
df$SHOOTER = as.factor(df$SHOOTER)


  #Script2

length(levels(df$PERIOD))
length(df$PTS_TYPE)
length(df$SHOOTER) #
summary(df) #df et pas ddf
sd(df$SHOT_DIST)
sd(df$SHOT_CLOCK, na.rm = TRUE)
     
#combien de tirs manqués/réussis
table(df[ "SHOT_RESULTS" ,  ])
#les quartiles
quantile(df$SHOT_CLOCK, probs = seq(0.1,0.25), na.rm = TRUE) #rajout du seq et du na.rm = TRUE
#les déciles
quantile(df$CLOSE_DIST, probs = seq( by=0.1, from = 0.1), na.rm = TRUE)
#nombre de matches différents
liste_game = unique(df$GAME_ID)
length(listegame)
#nombre de joueurs différents
df$SHOOTER = as.factor(df$SHOOTER)
nlevels(df$SHOOTER)
#conversion de la variable SHOT_DIST en mètre pour que les européens comprennent nos chiffres
df$SHOT_DIST_METRE = df$SHOT_DIST * 0.30 #mettre des df pour shot dist et shot dist metre
#nombre de points qu'a rapporté la tentative (0,2 ou 3)  
df$PTS_MARQUES <- ifelse(df$SHOT_RESULT == "made", yes = df$PTS_TYPE, no= 0) #double egale au made
#On supprime la variable GAME_RESULT car elle n'est pas utile
df$GAME_RESULT = NULL #mettre un deuxieme N a null
       
#création d'un objet sans la première colonne GAME_ID
df2 <- df[   , -1 ] #changer le -1 de place
       
       
  #Script 3
       
#Les 100 tirs réussis ou manqués les plus loin
rang <- order(df$SHOT_DIST, decreasing = TRUE) #mettre TRUE au lieu de FALSE
df3 <- df[rang, ] #changement du rang de place
df3 <- df[ 1 : 100 , ] #mettre une virgule a la place du point virgule
       
#Les 100 tirs réussis les plus loin
df4 = subset(df3, SHOT_RESULT == "made") #double = plus ajout de "" pour made
df4 <- df[ 1 : 100 , ] #virgule a la place du point virgule
       
#Combien de tirs à 3 points a réussi Kobe Bryant ?
df_kobe = subset(df,SHOT_RESULT == "made"&  #double = et "".
                PTS_TYPE == 3 &  #double =
                SHOOTER == "kobe bryant")  #kobe bryant en minuscule et double =
       
dim(df_kobe)
       
#Le TOP5 des joueurs qui ont marqués le plus de points dans la saison
df_total = aggregate(x=PTS_MARQUES~SHOOTER,data = df, FUN = sum) #x = PTS_MARQUES
View(df_total)
rang = order(df_total$PTS_MARQUES, decreasing = TRUE) #on utilise une variable rang
df_total_tri <- df_total[rang ,] #on utilise rang dans le df
View(df_total_tri)
df_top5 <-  df_total_tri[ 1:5,  ] #on met 1:5 pour avoir le top 5
View(df_top5)

#SCRIPT 4

#Des graphiques adaptés selon le type de variable

#construction de la fonction
build_graph <- function(une_colonne, nom_colonne) {
  if (is.numeric(une_colonne)) {
    print(boxplot(une_colonne, main = nom_colonne))
  }
  else if (is.factor(une_colonne)) {  # Utilisation de is.factor() pour vérifier si une_colonne est un facteur
    tri <- table(une_colonne)
    print(barplot(tri, main = nom_colonne))
  }
}

# On déroule la fonction sur chaque colonne du data frame.
for (colonne in colnames(df)) {  # Ajout de la parenthèse manquante et correction du nom de la variable
  build_graph(une_colonne = df[[colonne]], nom_colonne = colonne)  # Utilisation de [[ ]] pour extraire la colonne et correction du nom de la variable
}
