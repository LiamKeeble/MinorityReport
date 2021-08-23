library(ggmap)
library(tidyverse)

# api key ####
api <- readLines("~/google.api")
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
locations <- c("Birmingham, UK",
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
                    "Yorkshire, UK")
locations.data <- locations %>%
  geocode() %>% 
  rename(var.lon=lon) %>% 
  rename(var.lat=lat)
tibble1 <- locations.data %>% 
  add_column(variety_name = EnglishVarieties) %>% 
  add_column(locations)
# UK Map ####
UK <- map_data(map = "world", region = "UK") %>% 
  mutate(lon=long)

UK_white <- ggplot(data = UK, aes(x = lon, y = lat)) + 
  geom_polygon(fill="white") +
  geom_point(data = tibble1, size = 1) +
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
  geom_text(data = tibble1, aes(label = variety_name),
            colour = "#000000", size=1.75
            , nudge_x = 0.5)+
  NULL
UK_white

# distance calculations ####
dudley.calc <- mapdist(from="Dudley,UK",
        to=c("University of Birmingham", "University of Wolverhampton","Birmingham City University"),
        mode="driving")

cheshire.calc <- mapdist(from="Cheshire,UK",
             to=c("University of Liverpool", "Liverpool Hope University","University of Salford","University of Manchester"),
             mode="driving")

cornwall.calc <- mapdist(from="Cornwall, Uk",
             to=c("Plymouth Marjon University","University of the West of England","University of Southampton","University of Bristol"))

codurham.calc <- mapdist(from="County Durham, Uk",
                         to=c("Newcastle University", "Teesside University"),
                         mode="driving")
coventry.calc <- mapdist(from="Coventry,UK",
                         to=c("Coventry University","University of Warwick","University of Birmingham","Birmingham City University"))
cumbria.calc <- mapdist(from="Cumbria, UK",
                        to=c("Lancaster University","Newcastle University","Teesside University"))
essex.calc <- mapdist(from="Essex, UK",
                      to=c("University of Essex","University of Hertfordshire", "Queen Mary University of London","University of Kent"))
hampshire.calc <- mapdist(from="Hampshire, UK",
                          to=c("University of Reading","Royal Holloway University of London","University of Winchester","University of Southampton","University of Surrey"))
kent.calc <- mapdist(from="Kent, UK",
                     to=c("University of Kent","Canterbury Christ Church University","Queen Mary University of London"))

lancashire.calc <- mapdist(from="Lancashire, UK",
                           to=c("Lancaster University", "University of Central Lancashire","Leeds Trinity University","University of Huddersfield","Edge Hill University, Omskirk"))
lincolnshire.calc <- mapdist(from="Lincolnshire, UK",
                             to=c("Bishop Grosseteste University, Longdales Road, Lincoln","University of Sheffield","University of Nottingham","Nottingham Trent University"))
merseyside.calc <- mapdist(from="Merseyside, UK",
                           to=c("Liverpool Hope University","University of Liverpool"))
norfolk.calc <- mapdist(from="Norfolk, UK",
                        to=c("University Centre West Anglia (College of West Anglia, CWA and UcWA)","University of Suffolk"))
northumberland.calc <- mapdist(from="Northumberland,UK",
                               to=c("Newcastle University","Edinburgh University"))
staffordshire.calc <- mapdist(from="Staffordshire, UK",
                              to=c("University of Wolverhampton","Manchester Metropolitan University","University of Salford","Birmingham City University, Curzon Building Campus","University of Birmingham"))
suffolk.calc <- mapdist(from="Suffolk,UK",
                        to=c("University of Suffolk","University of Essex Colchester Campus"))
sussex.calc <- mapdist(from="Sussex, UK",
                       to=c("University of Sussex", "University of Brighton"))
yorkshire.calc <- mapdist(from = "Yorkshire, UK",
                          to=c("University of York","York St John University"))



#Universities
uniling <- c("University of Birmingham",
             "University of Wolverhampton",
             "University of the West of England",
             "Liverpool Hope University",
             "Plymouth Marjon University",
             "Newcastle University",
             "Coventry University",
             "Lancaster University",
             "Queen Mary University of London",
             "University of Winchester",
             "University of Kent",
             "University of Central Lancashire",
             "Bishop Grosseteste University, Longdales Road, Lincoln",
             "University of Liverpool",
             "University Centre West Anglia (College of West Anglia, CWA and UcWA)",
             "Newcastle University",
             "Plymouth Marjon University",
             "University of Portsmouth",
             "University of Wolverhampton",
             "University of Suffolk, Ipswich",
             "Newcastle University",
             "University of Sussex",
             "Newcastle University",
             "York St John University")
uniling.locations <- uniling %>% 
  geocode() %>% 
  rename(uni.lon=lon) %>% 
  rename(uni.lat=lat)
mapdist.tibble <- mapdist(from=locations,to=uniling)

tibble2 <- tibble1 %>% 
  add_column(uniling) %>%
  add_column(uniling.locations) %>% 
  add_column(mapdist.tibble) %>% 
  select(var.lon,var.lat,variety_name,locations,uniling,uni.lon,uni.lat, m, km, miles, minutes, hours,mode)
  
  
  
write_csv(tibble2, file = "distances-data.csv")
