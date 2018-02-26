##install packages
#install.packages("tidyverse")
#install.packages("nycflights13")

## load libraries
library(tidyverse)
library(nycflights13)

## dataset for assignment
flights

# Part a
flights %>% 
  filter(arr_delay >= 120)

# Part b
flights %>% 
  filter(dest %in% c('IAH','HOU'))

# Part c
flights %>% 
  filter(carrier %in% c('UA','AA','DL'))

# Part d
flights %>% 
  filter(month %in% c(7,8,9))

# Part e
flights %>% 
  filter(arr_delay >= 120 & dep_delay <= 0)

# Part f
flights %>% 
  filter(dep_delay >= 60 & arr_delay < dep_delay-30)

# Part g
flights %>% 
  filter(dep_time <= 600)

# Part h
flights %>% 
  arrange(desc(dep_delay))

flights %>% 
  arrange(dep_delay)

# Part i
flights %>% 
  arrange(desc(distance/air_time))

# Part j
flights %>% 
  arrange(desc(distance))

flights %>% 
  arrange(distance)