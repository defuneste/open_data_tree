### lecture des diffŕents fichiers open data et de leur variables

library(sf)


#### première serie ===============================================
## paris
paris <- st_read("sources/les-arbres.geojson")
names(paris)
st_crs(paris)

## lyon
lyon <- st_read("sources/abr_arbres_alignement.abrarbre.shp")
st_crs(lyon)
lyon
table(lyon$surfacecad)

##  bordeau 
bordeau <- st_read("sources/bor_arbres.geojson")
st_crs(bordeau)
names(bordeau)
table(bordeau$localisation)

## nice
nice <- st_read("sources/ev-arbre-opendata-2019.geojson")
st_crs(nice)
nice
table(nice$N_ORDRE)

### grenoble
grenoble <- st_read("sources/ARBRES_TERRITOIRE_VDG_EPSG4326.json")
st_crs(grenoble)
grenoble
names(grenoble)
table(grenoble$CAUSEABATTAGE)

### montpellier
montpellier <- st_read("sources/MMM_MTP_ArbresAlign.shp")
st_crs(montpellier)
montpellier
names(montpellier)
montpellier$contrainte


#### 
grand_paris_seine_ouest <- st_read("sources/arbres-v2.json")
st_crs(grand_paris_seine_ouest)
grand_paris_seine_ouest
grand_paris_seine_ouest$particular

### agen
agen <- st_read("sources/arbres.shp")
st_crs(agen)
agen
table(agen$expertise)

#### saint_quentinois
saint_quentinois <- st_read("sources/ARBRES.shp")
st_crs(saint_quentinois)
saint_quentinois[!is.na(saint_quentinois$fk_prec_es),]
table(saint_quentinois$EditDate)

### metz
metz <- st_read("sources/vrd_esv_arb.shp")
st_crs(metz)
table(metz$prgm_dat1)

### seine_saint_denis
seine_saint_denis <- st_read("sources/fr-dpt93-1646.json")
st_crs(seine_saint_denis)
seine_saint_denis
table(seine_saint_denis$etat)
table(seine_saint_denis$gestion)

### versailles
versailles <- st_read("sources/VER_Espaces_verts.json")
versailles

### nevers
nevers <- st_read("sources/ARBRE_ALIGNEMENT.shp")
st_crs(nevers)
table(nevers$tronc_prot)

### Toulouse
Toulouse <- st_read("sources/arbres-d-alignement.shp")
st_crs(Toulouse)

### orleans
orleans <- st_read("sources/espace_publicev_arbres.shp")
st_crs(orleans)
orleans

## saint_egreve 
saint_egreve <- st_read("sources/Arbres_Saint_Egreve.shp")
st_crs(saint_egreve)
table(saint_egreve$annee_plan)

## bayonne
bayonne <- st_read("sources/ev_arbres.json")
st_crs(bayonne)
table(bayonne$annee_plan)

## issy
issy <- st_read("sources/arbres-dalignement-sur-la-voirie-departementale.shp")
st_crs(issy)
table(issy$classe_age)

## rennes
rennes1 <- st_read("sources/gev_aorn.json")
st_crs(rennes1)
table(rennes1$test)
rennes2 <- st_read("sources/gev_aali.json")
st_crs(rennes2)
rennes2
table(rennes2$etat)

## mulhouse
mulhouse <- st_read("sources/68224_arbres_alignement.json")
st_crs(mulhouse)
mulhouse

### divonne_les_bains_fr
divonne_les_bains_fr <- st_read("sources/arbre_p_r84.json")
divonne_les_bains_fr 
table(divonne_les_bains_fr$etat_entre)


### bretagne berge
bretagne_berge <- st_read("sources/patrimoine-arbore-ponctuel-des-voies-navigables-appartenant-a-la-region-bretagne.shp")
bretagne_berge

### guingamp
guigamp <- st_read("sources/result.csv")
guigamp <- st_as_sf(guigamp, coords = c("longitude", "latitude"), crs = 4326)
guigamp$Attribut
#st_write(guigamp, "guigamp.geojson")

###  paris_sud_fr
paris_sud <- st_read("sources/patrimoine-arbore.json")
table(paris_sud$cplmt_nom)

##### deuxième serie ====================================================
haut_de_seine <-st_read("sources/cadastre-vert-les-arbres.json")

nevers2 <- st_read("sources/ARBRES_ORNEMENTS.shp")
table(nevers2$diametre)

iau_ecoline <- st_read("sources/elements-fixes-ponctuels-de-la-couche-ecoline-dile-de-france.json")
table(iau_ecoline$ele_txt)
# si on filtre arbre isolé
iau_ecoline <- iau_ecoline[iau_ecoline$ele_txt == "Arbre isolé",]
table(iau_ecoline$controle)

pau <- st_read("sources/gev_AALI_WGS84.shp")

## nancy est plus compliguée

nancy <- sapply(list.files(pattern = "ARBRE_ISOLE.shp$", recursive = T), st_read)
ncol_nancy <- lapply(nancy, ncol)
# houdemont pour une raison x ou y n'a pas le meme nombre de col !
houdemont <- nancy[-6]
nancy <- do.call(rbind, nancy[-6])