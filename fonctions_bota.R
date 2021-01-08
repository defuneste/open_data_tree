### scripts des fonctions de mises en ordres des noms de botaniques 

# Capitalise la première lettre du genre
first_maj <- function(une_liste_de_nom){
    une_liste_de_nom <- trimwc(tolower(une_liste_de_nom))
    paste0(toupper(substr(une_liste_de_nom, 1, 1)), 
           substr(une_liste_de_nom, 2, nchar(une_liste_de_nom)))
    }



# pas d'accent en latin 
no_accents <- function(x){gsub(pattern = "[éêè]", replacement = "e", x)}