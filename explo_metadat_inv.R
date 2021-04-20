# une explo rapide des metadata des inv.
# 2021

metada_inv <- openxlsx::read.xlsx("intermed/tentative_synthesev1.xlsx")

# si pas de date de publication, date de modification 
metada_inv$Date_publication[is.na(metada_inv$Date_publication)] <- metada_inv$Date_modif[is.na(metada_inv$Date_publication)] 

barplot(
        table(
            substr(metada_inv$Date_publication, 
                 nchar(metada_inv$Date_publication) - 3,
                 nchar(metada_inv$Date_publication))
            ),
        las = 2,
        main = "Diagramme en baton du nombre de jeux de données / an")

