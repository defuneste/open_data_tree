## Argenteuil 2021
# explo rapide
# cf loadtree.R

summary(lubridate::dmy(argenteuil$DATE_VISIT))

hist(lubridate::year(argenteuil$CREATIONDA))

min(argenteuil$CREATIONDA) 
