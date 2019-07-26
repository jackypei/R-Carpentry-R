library(tidyverse)

interviews <- read_csv("data/SAFI_clean.csv", na="NULL")

view(interviews)

dim(interviews)              ##gives you the dimensions of your table
nrow(interviews)             ##number of rows 
ncol(interviews)             ##number of columnns 

dim(interviews)[1] == dim(interviews)[-2] == nrow(interviews)    #first return of the dimension = number of rows 

interviews
head(as.data.frame(interviews))       ##shows you beginning of table
tail(as.data.frame(interviews))       ##shows you end of table

names(interviews)                    ##
str(interviews)                     ##
summary(interviews)                 ##

interviews[1,1]              ##what's in row 1 column 1? 
interviews[2,6]
interviews[ ,1]              ##gives you everything in column 1
interviews[1]                ##gives you everything in column 1

interviews[1:3, 7]           ##gives you first 3 entries from column 7
interviews[3, ]              ##all of row 3 (Across all columns)
interviews[1:6, ]            ##rows 1-6, all the columns 

interviews_no_id <- interviews[, -1]             ##drop the first column, keep every other column. space = all rows 

interviews_no_id

##exercise
#1
interviews_100 <- interviews[100, ]
interviews_100

#2
##my answer: is wrong because 131 isn't necessarily the last row! what if you added rows? 
nrow(interviews)
interviews[131, ]
tail(interviews)
interviews_last <- interviews[131, ]
interviews_last
##peter's better answer: 
n_rows <- nrow(interviews)
interviews_last <- interviews[n_row, ]
tail(interviews, n=1)

#3
#my answer:
interviews_middle <- interviews [66, ]
interviews_middle
#correct answer: 
middle_idx <- ceiling(n_rows/2)      ##ceiling = round up. if 65, won't do anything. If 65.5, it will do 66
interviews[middle_idx, ]             

#4
#my answer which didn't work
nrow(interviews[-7:131, ])
#correct answer
interviews_head <- interviews[-(7:n_rows), ]
interviews_head


##FACTORS: DAY 2 after morning tea

floor_type <- factor(c("earth","cement","cement","earth"))    ##this is sorted alphabetically
levels(floor_type)                                         ##what are the levels?
nlevels(floor_type)                                        ##numer of levels 

#cement automatically 1 and earth 2 because R does it alphabetically. 
#to make earth 1 and cement 2
floor_type <- factor(c("earth","cement","cement","earth"),
                     levels=c("earth","cement")) 

levels(floor_type)[2] <- brick          #only want the second level, cement. Assign cement as brick. C
                                         #changes all cement to brick



as.character(floor_type)              ##convert factors to characters

year_fct <- factor(c(1990, 1983, 1977, 1998, 1990))    
as.numeric(year_fct)        ##altho the input are numbers, you wna change it to catergories. 
                            ##tells you which entry converts to which factor level
##so we convert to character first 
as.character(year_fct)       ##gives me charactor vector of years. 
##SO WE GOTTA extract character and CHANGE TO NUMBERS
as.numeric(as.character(year_fct))

levels(year_fct)[year_fct]      ##[year_fct] pulls out each year as each entry 
##now we want them as numbers, not characters
as.numeric(levels(year_fct))[year_fct]

##if you want to count how many 1990sthere are, you can do this: 
year_nmb <- as.numeric(levels(year_fct))[year_fct]
table(year_nmb)
table(year_fct)
summary(year_fct)




affect_conflicts <- interviews$affect_conflicts
affect_conflicts <- as.factor(affect_conflicts)      ##as.factor=converts to factor 

plot(affect_conflicts)           ##frequency histogram 
##but missing data is not in the graph 
##to not lose missing data: 

affect_conflicts <- interviews$affect_conflicts
affect_conflicts[is.na(affect_conflicts)]   ##but this isn't helpful as it just gives a list of NAs

affect_conflicts[is.na(affect_conflicts)] <- "undetermined"  ##replace NAs with undetermined 

plot(affect_conflicts)


##EXERCISE 
#Q1 Rename the factor level “more_once” to “more than once”.
levels(affect_conflicts)[2] <- "more than once"
plot(affect_conflicts)

#Q2
affect_conflicts <- factor(affect_conflicts, levels=c("never","once","more than once","frequently","undertermined") ) 
##^to change the order of the levels
plot(affect_conflicts)









