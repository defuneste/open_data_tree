### travail sur les nom des champs

source("loadtree.R")

liste_data <- mget(ls())

bob <- sapply(liste_data, names)

# library(wordcloud)
# library(tm)
# wordcloud(unlist(bob))