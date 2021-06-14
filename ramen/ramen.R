library(tidyr)
library(dplyr)
library(ggplot2)

ramen <- read.csv("ramen-ratings.csv")
colnames(ramen)
head(ramen)

top_ramen<- ramen %>% 
  filter(Stars==5) %>% 
  arrange(desc(Stars))


ggplot(data = top_ramen)+
  geom_bar(mapping = aes(x=Country,fill=Country))+
  theme(axis.text.x = element_text(angle = 70, hjust = 1))


top_ramen <- subset(top_ramen, Top.Ten != "")
ggplot(data = top_ramen)+
  geom_bar(mapping = aes(x=Country,fill=Country))+
  theme(axis.text.x = element_text(angle = 70, hjust = 1))

top_ramen_japan <- ramen %>% 
  filter(Stars==5) %>% 
  filter(Country=="Japan") %>% 
  arrange(desc(Stars))

super_top_ramen <- subset(top_ramen_japan, Top.Ten != "")
head(top_ramen)

ggplot(data = super_top_ramen)+
  geom_bar(mapping = aes(x=Country,fill=Country))+
  theme(axis.text.x = element_text(angle = 70, hjust = 1))

elite_ramen_jap <- ramen %>% 
  filter(Country=="Japan") %>% 
  filter(Stars==5)
elite_ramen_jap <- subset(elite_ramen_jap, Top.Ten != "")

elite_ramen_singa <- ramen %>% 
  filter(Country=="Singapore") %>% 
  filter(Stars==5)
elite_ramen_singa <- subset(elite_ramen_singa, Top.Ten != "")


elite_ramen_kore <- ramen %>% 
  filter(Country=="South Korea") %>% 
  filter(Stars==5)
elite_ramen_kore <- subset(elite_ramen_kore, Top.Ten != "")


elite_ramen <- rbind(elite_ramen_singa,elite_ramen_kore)

ggplot(data = elite_ramen)+
  geom_bar(mapping = aes(x=Country,fill=Country))