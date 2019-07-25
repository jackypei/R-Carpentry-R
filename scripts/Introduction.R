#load required packages
#install.packages("tidyverse")


install.packages("tidyverse")

print("Hello world")

library(tidyverse)

area_hectares <- 1.0
(1.0->area_hectares)


area_hectares <- 50                     #land area in hectares
area_acres <- 2.47*area_hectares        #convert hectares to acres
area_acres                              #print



length <- 3.8
width <- 2.1 
area <- length*width
area


length <- 103
width <- 59
area <- length*width
area

a <- 64
b <- sqrt(a)
b

round(3.141592,2)

no_membrs <- c(3, 7, 10, 6)
length(no_membrs)
class(no_membrs)
str(no_membrs)

respondent_wall_type <- c("muddaub", "burntbricks", "sunbricks")
respondent_wall_type

length(respondent_wall_type)
class(respondent_wall_type)
str(respondent_wall_type)

possessions <- c("bicycle", "radio", "television")
possessions <- c(possessions, "mobile_phone")           # add to the end of the vector
possessions <- c("car", possessions)                    # add to the beginning of the vector

typeof(possessions)
