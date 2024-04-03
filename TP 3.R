#TP 3
#Exercice 1
#1
setwd("L:/BUT/SD/Promo 2023/kcostisor/TP 3")
#2
df = read.csv(file = "quiz.csv", sep = "\t", dec = ",")
#3
nrow(df)
#4
ncol(df)
#5
summary(df)
#6
df$Identifiant <- as.factor(df$Identifiant)
df$TD <- as.factor(df$TD)
df$TP <- as.factor(df$TP)
class(df$Identifiant)
class(df$TD)
class(df$TP)
#7
mean(df$Quiz1, na.rm = TRUE)
mean(df$Quiz2, na.rm = TRUE)
mean(df$Quiz3, na.rm = TRUE)
#meilleur moyenne sur le quiz1
#8
max(df$Quiz3, na.rm = TRUE)
#9
median(df$Quiz2, na.rm = TRUE)
#50% ont plus de 11.05/20
#10
quantile(df$Quiz3, probs = seq(from = 0.1,
                               to = 0.9, 
                               by =0.1), 
         na.rm = TRUE)
#40% ont eu 11 ou plus.
#11
sd(df$Quiz1, na.rm = TRUE)
sd(df$Quiz2, na.rm = TRUE)
sd(df$Quiz3, na.rm = TRUE)
#notes plus homogènes sur le quiz1 et le plus hétérogènes sur le quiz2
#12
table(df$TP)
#le groupe de TP 22
#13
round(prop.table(table(df$TP)), digits = 2)
#14
resultat = subset(df, Quiz3 > 10)
resultat = resultat[ , c("Identifiant","Quiz3")]
nrow(resultat)
View(resultat)
#15
resultat = subset(df, TD == 1)
resultat = resultat[ , c("Identifiant","TD")]
nrow(resultat)
View(resultat)
#16
resultat = subset(df, TP != 21)
resultat = resultat[ , c("Identifiant","TP")]
nrow(resultat)
View(resultat)
#17
resultat = subset(df, Quiz3 >= 5 & Quiz3 <= 10)
resultat = resultat[ , c("Identifiant","Quiz3")]
nrow(resultat)
View(resultat)*
#18
  resultat = subset(df, Identifiant %in% c(92655100,
                                           85947666,
                                           75752354,
                                           172596215,
                                           111505723,
                                           42690322,
                                           20972010,
                                           43177455))
nrow(resultat)
#19
resultat = subset(df, !Identifiant %in% c(92655100,
                                          85947666,
                                          75752354,
                                          172596215,
                                          111505723,
                                          42690322,
                                          20972010,
                                          43177455))
nrow(resultat)
#20
resultat = subset(df, Quiz1 >= 15 | Quiz2 >= 15 | Quiz3 >= 15)
resultat = resultat[ , c("Identifiant","Quiz1","Quiz2","Quiz3")]
nrow(resultat)
View(resultat)
#21
resultat = subset(df, is.na(Quiz1))
resultat = resultat[ , c("Identifiant","Quiz1")]
nrow(resultat)
View(resultat)
#22
resultat = subset(df, !is.na(Quiz1) & !is.na(Quiz2) & !is.na(Quiz3))
resultat = resultat[ , c("Identifiant","Quiz1","Quiz2","Quiz3")]
nrow(resultat)
View(resultat)
#23
df$Moyenne = round((df$Quiz1 + df$Quiz2 + df$Quiz3) / 3, digits = 1)
head(df)
#24
rang = order(df$Moyenne, decreasing = FALSE)
resultat = df[ rang, c("Identifiant","Moyenne")]
head(resultat, n = 3)
#25
rang = order(df$Moyenne, decreasing = TRUE)
resultat = df[ rang, c("Identifiant","Moyenne")]
head(resultat, n = 3)
#26
rang = order(df$TP, df$Moyenne, decreasing = c(FALSE,TRUE))
resultat = df[ rang, c("Identifiant","TP", "Moyenne")]
head(resultat, n = 5)
#27
aggregate(Moyenne ~ TP,
          data = df, 
          FUN = function(x) c(moy = mean(x) ) )
#28
resultat = aggregate(Moyenne ~ TD + TP,
                     data = df, 
                     FUN = function(x) c(min = min(x),
                                         moy = mean(x),
                                         max = max(x),
                                         eff = length(x) ) )
#29
df$Quiz1 = ifelse(test = is.na(df$Quiz1), 
                  yes = mean(df$Quiz1, na.rm = TRUE),
                  no = df$Quiz1)

df$Quiz2 = ifelse(test = is.na(df$Quiz2), 
                  yes = mean(df$Quiz2, na.rm = TRUE),
                  no = df$Quiz2)

df$Quiz3 = ifelse(test = is.na(df$Quiz3), 
                  yes = mean(df$Quiz3, na.rm = TRUE),
                  no = df$Quiz3)

df$Moyenne = round((df$Quiz1 + df$Quiz2 + df$Quiz3) / 3, digits = 1)
#30
df$Moyenne_Classe = cut(df$Moyenne,
                        breaks = quantile(df$Moyenne),
                        include.lowest = TRUE)
summary(df$Moyenne_Classe)
#31
write.table(x = df, file = "exam_export.csv", sep = ";", dec = ",", row.names = FALSE)