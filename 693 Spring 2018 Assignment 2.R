## load libraries
library(tidyverse)
library(nycflights13)

## dataset for assignment
flights = flights

### Part 3 ###

cancel.delay = flights %>% 
  group_by(month,day) %>% 
  summarize(cancel.prop = sum(is.na(air_time))/length(air_time), avg.delay = mean(dep_delay,na.rm=TRUE))

anova(lm(avg.delay~cancel.prop,data=cancel.delay))

### Part 4 ###

worst.carrier = flights %>% 
  group_by(carrier) %>% 
  summarize(avg.delay = mean(dep_delay,na.rm=TRUE)) %>% 
  arrange(desc(avg.delay))

#challenge
carrier.airport = flights %>% 
  group_by(carrier,origin) %>% 
  summarize(avg.delay = mean(dep_delay,na.rm=TRUE)) %>% 
  arrange(desc(avg.delay))

anova(lm(avg.delay~carrier+origin,data=carrier.airport))

### Part 5 ###

### Part 6 ###

worst.plane = flights %>% 
  group_by(tailnum) %>% 
  summarize(avg.delay = mean(dep_delay,na.rm=TRUE)) %>% 
  arrange(desc(avg.delay))

### Part 7 ###

best.time = flights %>% 
  group_by(hour) %>% 
  summarize(avg.delay = mean(dep_delay,na.rm=TRUE)) %>%
  arrange(avg.delay)

### Part 8 ###

dest.delay = flights %>% 
  group_by(dest) %>% 
  mutate(total.delay = sum(dep_delay,na.rm=T)) %>% 
  mutate(prop.delay = dep_delay/total.delay) %>% 
  select(month,day,origin,dest,carrier,prop.delay,total.delay) %>% 
  arrange(desc(prop.delay))

### Part 9 ###

fast.flights = flights %>% 
  group_by(dest) %>% 
  mutate(ave.time = sum(air_time,na.rm=T)/length(air_time)) %>% 
  mutate(prop.ave = air_time/ave.time) %>% 
  select(month,day,origin,dest,carrier,air_time,ave.time,prop.ave) %>% 
  arrange(prop.ave)

slow.flights = fast.flights %>% 
  arrange(desc(prop.ave))
