library(ggmap)
library(tidyverse)

# api key ####
api <- readLines("~/google.api")
register_google(key = api)

data_all <- read_csv("data_all.csv")

# themes ####
# plot theme
theme_Caitlin_present <- function() {theme_bw(base_size = 22) %+replace%
    theme(plot.background  = element_rect(fill = "transparent", colour = NA),
          panel.background = element_rect(fill="gray90", colour=NA),
          legend.background = element_rect(fill="transparent", colour=NA),
          legend.key = element_rect(fill="transparent", colour=NA),
          panel.grid.major = element_line(colour = "white", size = 0.2), 
          panel.grid.minor = element_line(colour = "grey98", size = 0.5))}


countplot=ggplot(data=data_all,(aes(x=variety_name, y=FreqPapers, fill=)))+
  geom_col()+
  labs(caption="Figure 1.Frequency of papers by variety") +
  theme_Caitlin_present()+
  theme(legend.position = "none", plot.caption = element_text(hjust = 0.5),axis.text.x = element_text(angle=45,hjust=1))+
  xlab("Variety")+
  ylab("Number of papers")+
  NULL
countplot
ggsave("countplot.png", countplot,height=10,width=12,units="in")


UK <- map_data(map = "world", region = "UK") %>% 
  mutate(lon=long)

incomeColours <- c('#feedde','#fdd0a2','#fdae6b','#fd8d3c','#f16913','#d94801','#8c2d04')
names(incomeColours) = levels(data_all$AreaIncome)
incomeFillScale <- scale_fill_manual(name = "AreaIncome",values = incomeColours)
incomeColScale <- scale_colour_manual(name = "AreaIncome",values=incomeColours)

map_income <- ggplot(data = UK, aes(x = lon, y = lat)) + 
  geom_polygon(fill="white") +
  scale_y_continuous(breaks=NULL,limits=c(50,56))+
  scale_x_continuous(breaks=NULL, limits=c(-6,2))+
  coord_fixed(1.6)+
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        panel.background = element_rect(fill = 'lightblue'),
        legend.key.height = unit(5, 'cm'), #change legend key height
        legend.key.width = unit(3, 'cm'), #change legend key width
        legend.title = element_text(size=40), #change legend title font size
        legend.text = element_text(size=40) #change legend text font size
  )+
  geom_text(data = data_all, aes(label = variety_name,x=var.lon,y=var.lat),
            colour = "#000000", size=4.5)+
  geom_point(data = data_all, aes(x=var.lon,y=var.lat,color=AreaIncome), size=data_all$FreqPapers,alpha=0.5)+
  scale_colour_continuous(type="viridis",begin=1,end=0)+
  NULL
map_income

ggsave("incomemap.png", map_income,height=15,width=15,units="in")


map_income_small <- ggplot(data = UK, aes(x = lon, y = lat)) + 
  geom_polygon(fill="white") +
  scale_y_continuous(breaks=NULL,limits=c(50,56))+
  scale_x_continuous(breaks=NULL, limits=c(-6,2))+
  coord_fixed(1.6)+
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        panel.background = element_rect(fill = 'lightblue'),
        # legend.key.height = unit(5, 'cm'), #change legend key height
        # legend.key.width = unit(3, 'cm'), #change legend key width
        # legend.title = element_text(size=40), #change legend title font size
        # legend.text = element_text(size=40) #change legend text font size
  )+
  geom_text(data = data_all, aes(label = variety_name,x=var.lon,y=var.lat),
            colour = "#000000", size=2)+
  geom_point(data = data_all, aes(x=var.lon,y=var.lat,color=AreaIncome), size=data_all$FreqPapers,alpha=0.5)+
  scale_colour_continuous(type="viridis",begin=1,end=0)+
  NULL
map_income_small

ggsave("incomemap-small.png", map_income_small,height=5,width=5,units="in")
