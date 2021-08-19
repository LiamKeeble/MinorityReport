library(ggmap)
library(tidyverse)

# api key ####
api <- readLines("google.api")
register_google(key = api)

# Variety data ####
EnglishVarieties <- c("Birmingham",
                      "Black_Country",
                      "Bristol",
                      "Cheshire",
                      "Cornwall",
                      "County Durham",
                      "Coventry",
                      "Cumbrian",
                      "Essex",
                      "Hampshire",
                      "Kent",
                      "Lancashire",
                      "Lincolnshire",
                      "Merseyside",
                      "Norfolk",
                      "Northumbrian",
                      "Plymouth",
                      "Portsmouth",
                      "Staffordshire",
                      "Suffolk",
                      "Sunderland",
                      "Sussex",
                      "Tyneside",
                      "Yorkshire")
locations.data <- c("Birmingham, UK",
                      "Dudley, UK",
                      "Bristol, UK",
                      "Cheshire, UK",
                      "Cornwall, UK",
                      "County Durham, UK",
                      "Coventry, UK",
                      "Cumbria, UK",
                      "Essex, UK",
                      "Hampshire, UK",
                      "Kent, UK",
                      "Lancashire, UK",
                      "Lincolnshire, UK",
                      "Merseyside, UK",
                      "Norfolk, UK",
                      "Northumberland, UK",
                      "Plymouth, UK",
                      "Portsmouth, UK",
                      "Staffordshire, UK",
                      "Suffolk, UK",
                      "Sunderland, UK",
                      "Sussex, UK",
                      "Newcastle upon Tyne, UK",
                      "Yorkshire, UK") %>%
  geocode() %>% 
  add_column(variety_name = EnglishVarieties)

# UK Map ####
UK <- map_data(map = "world", region = "UK") %>% 
  mutate(lon=long)

UK_white <- ggplot(data = UK, aes(x = lon, y = lat)) + 
  geom_polygon(fill="white") +
  geom_point(data = locations.data, size = 1) +
  scale_y_continuous(breaks=NULL,limits=c(50,56))+
  scale_x_continuous(breaks=NULL, limits=c(-6,2))+
  coord_fixed(1.6)+
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
  )+
  geom_text(data = locations.data, aes(label = variety_name),
            colour = "#000000", size=1.75
            , nudge_x = 0.5)+
  NULL
UK_white

# distance calculations ####
Universities <- c()
LinguisticsUniversities <- c()
