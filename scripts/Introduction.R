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

#subsetting

respondent_wall_type[2]
respondent_wall_type[c(3,2)]

more_respondent_wall_type <- respondent_wall_type[c(1,2,3,2,1,3)]

no_membrs[c(TRUE, FALSE, TRUE, TRUE)]
no_membrs[no_membrs > 5]
no_membrs[no_membrs < 3 | no_membrs > 5]
no_membrs[no_membrs >= 7 & no_membrs == 3]

possessions[possessions == "car" | possessions == 'bicycle'] # returns both car and bicycle
possessions %in% c("car","bicycle")


rooms <- c(2,1,1,NA,4)         #na = missing data
mean(rooms, NA.rm=TRUE)        #take off NAs before finding the mean 

!is.na(rooms)                   # ! means "NOT". "is.na" gets the ones that are NA 

rooms[!is.na(rooms)]              #subset the ones that aren't NA out. 

