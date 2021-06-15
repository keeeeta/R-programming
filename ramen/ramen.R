# INSTALL NECESSARY PACKAGES
library(tidyr)
library(dplyr)
library(ggplot2)

# READING THE INPUT DATA SET
ramen <- read.csv("ramen-ratings.csv")

# STUDYING THE DATA SET
colnames(ramen)
head(ramen)

# FILTERING THE INPUT DATA FRAME TO RAMENS THAT HOLD A 5 STAR RATING
top_ramen<- ramen %>% 
  filter(Stars==5) %>% 
  arrange(desc(Stars))

# A BAR GRAPH TO VISUALIZE WHICH COUNTRY PRODUCES 5 STAR RATING RAMEN
ggplot(data = top_ramen)+
  geom_bar(mapping = aes(x=Country,fill=Country))+
  theme(axis.text.x = element_text(angle = 70, hjust = 1))

# NUMBER OF 5 STAR RATING RAMEN PRODUCED IN JAPAN
nrow(subset(top_ramen,Country == "Japan"))

# DISPLAY COLUMN NAMES IN THE INPUT DATA FRAME
colnames(ramen)

# EXTRACT RAMEN THAT HOLDS A RECORD IN TO 10 RAMEN
elite_ramen <- subset(top_ramen, Top.Ten != "")

# A BAR GRAPH TO VISUALIZE WHICH COUNTRY PRODUCES TOP 10 RECORD RATED RAMEN
ggplot(data = elite_ramen)+
  geom_bar(mapping = aes(x=Country,fill=Country))+
  theme(axis.text.x = element_text(angle = 70, hjust = 1))

# NUMBER OF TOP 10 RECORD HOLDING RAMEN PRODUCED IN SINGAPORE
nrow(subset(elite_ramen,Country == "Singapore"))