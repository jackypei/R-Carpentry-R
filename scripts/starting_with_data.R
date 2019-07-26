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
