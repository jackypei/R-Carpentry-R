library(dplyr)
library(tidyr)

interviews <- read_csv("data/SAFI_clean.csv",na="NULL")

select(interviews, village, no_membrs, years_liv)

filter(interviews, village == "God")     ##pulls out only the data from the village God 
filter(interviews, village == "God", no_membrs>6)     ##from God, and at least 7 members 



##clunky way:
select_cols <- select(interviews, village, no_membrs, years_liv)
god_data <- filter(select_cols, village == "God", no_membrs>6)


##better way, using pipes: %>%
#put a line break after every pipe symbol

interviews %>%                                     ##start with everything
  select(village, no_membrs, years_liv) %>%        ##pipe down to 
  filter(village == "God", no_membrs > 6)


##exercise 
interviews %>%                                       ##start with everything
  filter(memb_assoc == "yes") %>%                    ##we must filter first, not select, as IF you had the filter in the last line, memb_assoc is not part of (affect_conflicts, liv_count, no_meals) 
  select(affect_conflicts, liv_count, no_meals)       ##take the output from the people who said YES to memb_assoc, and bring out the 3 columns we're interested in 


##session after lunch 

#mutate: piping into mutate function (mutate lives new columns)

interviews_ppl_room <- interviews %>%               ## added "interviews_ppl_room <-" afterwards
  filter(memb_assoc == "yes") %>%
  mutate(people_per_room = no_membrs / rooms)

view(interviews_ppl_room)


##exercise  
interviews %>%
  mutate(total_meals = no_membrs*no_meals) %>% 
  filter(total_meals > 20) %>%
  select(village, total_meals) 

#now can make all of this turn into the new variable "interviews_total_meals" 
interviews_total_meals <- interviews %>%
  mutate(total_meals = no_membrs*no_meals) %>% 
  filter(total_meals > 20) %>%
  select(village, total_meals) 

#new table to tell you the number of members per household, by village 
interviews %>%
  group_by(village) %>%            ##treat each village as the same group
  summarize(mean_no_membrs = mean(no_membrs))  ##create a new variable, let R know how to compute your data for that variable

#adding other variables to group by 
interviews %>%
  filter(!is.na(memb_assoc)) %>%               ##added this filter at the end because we decided we didn't want the NAs to be shown 
  group_by(village, memb_assoc) %>%            
  summarize(mean_no_membrs = mean(no_membrs),
            min_membrs = min(no_membrs)) %>%      ##added a new variable  (new column in table)
  arrange(desc(min_membrs))            #sort the data from smallest to largest based on the new min variable
  #if you want largest to smallest order, then put "desc" in for descending 


#to find number of something, we used to use "table". but dplyr can use count()

interviews %>%           
  count(village)        #sorted by default in alphabetical order 

#can sort this by most common first 
interviews %>%
  count(village, sort=TRUE)   


##EXERCISES

#Q2
interviews %>% 
  group_by(village) %>%
  summarise(
    mean_no_membrs = mean(no_membrs),
    min_no_membrs = min(no_membrs),
    max_no_membrs = max(no_membrs),
    n = n()                            ##you don't put anything in the brackets because it's counting the number in each village, not in the column "no_membrs"
  )



#reshaping with gather and spread 

#spread 

#when you want a TRUE/FALSE output for each observation (row) .
#one wall type per response 
interviews_spread <- interviews %>%
  mutate(wall_type_logical = TRUE) %>%
  spread(key = respondent_wall_type, value = wall_type_logical, fill = FALSE)   ##all the ones with not the correct wall type- we dont want it to be missing data - so see those columns without it 
#the key column variable whose values will become new column names.
#the value column variable whose values will fill the new column variables.

view(interviews_spread)    #notice how the 4 columns at the end all say True or False now! 


#gather 
#notice "key" and "value" 

interviews_gather <- interviews_spread %>%
  gather(key = respondent_wall_type, value = "wall_type_logical",
         burntbricks:sunbricks)     #tell it which columns to gather together: the 4 columns from burnbricks to sunbricks 

view(interviews_gather)     #now it's put the 4 columns back to 1 column 

#now it's stacked 4 rows on top of each other. 524 rows!! so we should clean it using filter. (just look at the TRUE ones)
## 524 = 131 * 4

interviews_gather <- interviews_spread %>%                            #first 3 rows are cnped 
  gather(key = respondent_wall_type, value = "wall_type_logical",     #first 3 rows are cnped 
         burntbricks:sunbricks)  %>%                                  #first 3 rows are cnped 
  filter(wall_type_logical)   %>%          ##adding in our filters to delete the 3 extraneous FALSE rows, only keep the ones that said TRUE 
  select(-wall_type_logical)               #since we let wall_type_logical=TRUE, - means false

view(interviews_gather)   #now we have got it down to 131 rows again. cleaner- got rid of the excess rows. 













