## ranking espèce

source("loadtree.R")
,

liste_data_dt <- sapply(liste_data, st_drop_geometry) 

names(liste_data_dt)

# liste de petites corrections rapides
liste_data_dt$divonne_les_bains_fr$espece[is.na(liste_data_dt$divonne_les_bains_fr$espece)] <- ""

mulhouse_libelle_es <- tolower(liste_data_dt$mulhouse$libelle_es)
rennes1_genre <- tolower(liste_data_dt$rennes1$genre)
rennes1_espece <- tolower(liste_data_dt$rennes1$espece)
rennes1_latin <- paste(rennes1_genre, rennes1_espece)
rennes2_latin <- tolower(paste(liste_data_dt$rennes2$genre, liste_data_dt$rennes2$espece))
rennes2_latin <- trimws(
    tolower(paste(liste_data_dt$rennes2$genre, liste_data_dt$rennes2$espece)))

# Capitalise la première lettre du genre
first_maj <- function(une_liste_de_nom){paste0(toupper(substr(une_liste_de_nom, 1, 1)), substr(une_liste_de_nom, 2, nchar(une_liste_de_nom)))}
# pas d'accent en latin 
pas_les_accent <- function(x){gsub(pattern = "[éêè]", replacement = "e", x)}


nb_espece <- c(liste_data_dt$agen$nom_latin,
               paste(liste_data_dt$bayonne$genre, liste_data_dt$bayonne$espece),
               liste_data_dt$bordeau$nom,
               trimws(paste(sub(pattern = " spp.",  "",  x = liste_data_dt$divonne_les_bains_fr$genre),
                            liste_data_dt$divonne_les_bains_fr$espece)),
               liste_data_dt$grand_paris_seine_ouest$genespvar,
               paste(liste_data_dt$grenoble$GENRE_BOTA , liste_data_dt$grenoble$ESPECE),
               paste(liste_data_dt$guigamp$Genre, liste_data_dt$guigamp$Espce),
               paste(liste_data_dt$lyon$genre, liste_data_dt$lyon$espece),
               liste_data_dt$montpellier$nom_latin,
               first_maj(mulhouse_libelle_es),
               liste_data_dt$nevers$espece,
               paste(liste_data_dt$orleans$genre, liste_data_dt$orleans$espece),
               paste(liste_data_dt$paris$genre, liste_data_dt$paris$espece),
               first_maj(rennes1_latin),
               first_maj(rennes2_latin),
               liste_data_dt$saint_egreve$genre,
               liste_data_dt$seine_saint_denis$essence,
               liste_data_dt$versailles$ESPECE
               )

nb_espece <- gsub(pattern = " n\\. sp\\.| autre| NA|\\?| var\\..*| sp\\.", replacement = "", nb_espece)
nb_espece <- pas_les_accent(nb_espece)
#nb_espece <- gsub(pattern = '"\\S+"', replacement = "", nb_espece)
nb_espece <- trimws(nb_espece)
nb_espece <- first_maj(tolower(nb_espece))


# explication des regex 
# " var\\..*" identifie des trucs comme "Pinus nigra var.austriaca"
# "\\?" pour "Chamaecyparis lawsoniana 'aureovariegata'??" "Cedrus deodara??"                            "Corylus ?" 

## serie de cas problèmatiques 
# Pyrus Fruit
# "non identifie NA"                 "non identifie aesculus peut-etre"
# Acer plat. emerald queen
# "Prunus Fleur" 
#  Pb d'accent : ^[a-zàâçéèêëîïôûùüÿñæœ .-] // [àâéêèìôùûç]
#  hybride
# 
# patron <- "[éêè]"
# test_regex <- unique(nb_espece[grep(pattern = patron, nb_espece)])
# test_regex
# gsub(pattern = "[éêè]", replacement = "e", x)

bob <- aggregate(data.frame(count = nb_espece), list(value = nb_espece), length)
dim(bob)

bob <- bob[order(bob$count, decreasing = T),]

openxlsx::write.xlsx(bob, "classement_open_data.xls")

#bretagne_berge nom vernaculaire
# issy trop de travail il faut utiliser un separateur "
# strsplit(liste_data_dt$issy$essence_sci, "-")
# metz il faut comprendre le codage nom_espece
# mulhouse sup des cultivar
# nevers aussi 
# nice comprendre le code
# paris sud : on a un pb de MAJ et nom trop long
# un petit bordel aussi a saint egrev
# saint quentinois : des noms à dechiffrés


      
