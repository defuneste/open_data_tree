### scripts des fonctions de mises en ordres des noms de botaniques 

# Capitalise la première lettre du genre
# genere des "NA" au lieu de NA 
first_maj <- function(une_liste_de_nom){
    une_liste_de_nom[is.na(une_liste_de_nom)] <- ""
    une_liste_de_nom <- trimws(tolower(une_liste_de_nom))
    paste0(toupper(substr(une_liste_de_nom, 1, 1)), 
           substr(une_liste_de_nom, 2, nchar(une_liste_de_nom)))
    is.na(une_liste_de_nom) <- une_liste_de_nom == ""
    une_liste_de_nom
    }



# pas d'accent en latin 
no_accents <- function(x){gsub(pattern = "[éêè]", replacement = "e", x)}