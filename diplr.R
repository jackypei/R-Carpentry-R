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











