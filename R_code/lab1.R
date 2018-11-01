# install packages
install.packages("devtools")

# other packages
install.packages("dplyr")
install.packages("ggplot2")
install_github("StatsWithR/statsR")

# load packages
library(statsr)
library(dplyr)
library(ggplot2)
library(shiny)

# Read file
setwd("C:/Users/varun/Desktop/New folder/Projects_kelly/stats/Statistics_Specialization")
data_set = read.csv(file = "datasets/arbuthnot.csv",sep = ',')

# dimensions 
dim(data_set)
# result   82  3

# names
names(data_set)
# "year"  "boys"  "girls"

data_set$boys
data_set$year

# visualization
ggplot(data = data_set, aes(x = year, y = girls)) +
  geom_point()

ggplot(data = data_set, aes(x = year, y = boys)) +
  geom_point()

# baptisms in 1629
data_set$boys[data_set$year==1629] + data_set$girls[data_set$year==1629]

#
data_set <- data_set %>%
  mutate(total = boys + girls)

# plot total
ggplot(data = data_set, aes(x= year, y= total)) + geom_density_2d() + geom_point()

#
ggplot(data = data_set, aes(x = year, y = total)) +
  geom_line() +
  geom_point()

#
data_set <- data_set %>% mutate(more_boys = boys > girls)

# 
ggplot(data = data_set, aes(x= more_boys)) + geom_bar()

# find max boys and girls born in the duration
max(data_set$boys)
max(data_set$girls)

# rearrange desc order of total into new dataframe
dataset2 <- data_set %>% arrange(desc(total))
dataset2

