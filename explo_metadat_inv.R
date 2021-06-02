# Objectif: une premiere exploration des bases de données en open data des arbres
# en france
# Data :la source est un fichier tentant une première synthèse
# Date: Huin2021

# I Chargement des données et package ###########

pkgs <-  c("openxlsx","ggplot2")

inst <- lapply(pkgs, 
               library, # piste amelioration inclure une verif et si non install
               character.only = TRUE)

metada_inv <- openxlsx::read.xlsx("intermed/tentative_synthesev1.xlsx")

# correction de la date 
metada_inv$year <- substr(metada_inv$Date_publication, 
                          nchar(metada_inv$Date_publication) - 3,
                          nchar(metada_inv$Date_publication))

# si pas de date de publication, date de modification 
metada_inv$Date_publication[ is.na(metada_inv$Date_publication) ] <- metada_inv$Date_modif[ is.na(metada_inv$Date_publication) ] 

# première version d'exploration
barplot(
        table(metada_inv$year),
        las = 2,
        main = "Diagramme en baton du nombre de jeux de données / an")

# C'est pas mal mais l'axe temporel est pas top
# en base pour l'exercice
# on va generer un tableau avec toutes les années
# assigner 0
# enlever les duplicats
annee <- seq(from = min(metada_inv$year, na.rm = TRUE),
             to = max(metada_inv$year, na.rm = TRUE),
             by = 1)
compte <- rep(0, times = length(annee))
annee_vide <- data.frame(annee, compte)

inv_arbre <- as.data.frame(table(metada_inv$year))
names(inv_arbre) <- c("annee", "compte")
inv_arbre$annee <- as.numeric(as.character(inv_arbre$annee))
inv_arbre <- rbind(inv_arbre, annee_vide)

inv_arbre[!duplicated(inv_arbre$annee),]

library(ggplot2)

ggplot(inv_arbre, aes(x = annee, y = compte)) +
    geom_col() +
    theme_bw() +
    scale_x_continuous(labels = annee, breaks = annee)
