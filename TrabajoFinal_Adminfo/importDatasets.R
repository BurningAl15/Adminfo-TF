install.packages("dplyr")
library(dplyr)
#cleanedGames=read.csv("cleanedGames.csv",header = TRUE,sep = ";")
#cleanedReviews=read.csv("cleanedReviews.csv",header=TRUE,sep=";")

games=read.csv("Games.csv",header = TRUE,sep = "~")
reviews=read.csv("Reviews.csv",header=TRUE,sep="~")

#let view the names of the tables from the read csv's
names(games)
names(reviews)

filter(games,id>=0 & id<=20)
select(games,title,realCost)

hist(games$realCost)
plot(games$realCost,games$discount)

val=games %>%
  select(title,realCost)

order(val$realCost)

head(games,20) %>%
  select(title,realCost) 

tail(games,20) %>%
  select(title,realCost)

#Juegos mas caro
c=games %>%
  select(title,realCost) %>%
  filter(realCost==371.8) %>%
  arrange(desc(realCost))

c

#Juegos mas barato (Free to play)
v=games %>%
  select(title,realCost) %>%
  filter(realCost==0) %>%
  arrange(realCost)

v

#Juegos mas baratos que no son free to play
f=games %>%
  select(title,realCost) %>%
  filter(realCost>0 & realCost<=3) %>%
  arrange(realCost)

head(f,2)
