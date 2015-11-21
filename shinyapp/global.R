############################
## Load Packages and Data ##
############################

library(dplyr)
library(ggmap)
library(timeDate)
library(shiny)
library(shinythemes)
library(shinydashboard)
library(data.table)

grossrating = read.csv('data/grossrating.csv', stringsAsFactors = FALSE)
movies = read.csv('data/movies.csv', stringsAsFactors = FALSE)
moviegroups = read.csv('data/moviegroups.csv', stringsAsFactors = FALSE)
moviegroupstotals = read.csv('data/moviegroupstotals.csv', stringsAsFactors = FALSE)

####################
## Create Summary ##
####################

summary <- group_by(grossrating, Sequel) %>%
  summarise(.,rating = mean(Rating),gross = mean(Lifetime.Gross))

##################
## Correct Name ##
##################

movies <- movies %>% mutate(Title = ifelse(Title == "The Lord of the Rings: Return of the King", 
                                           "The Lord of the Rings: The Return of the King", Title))