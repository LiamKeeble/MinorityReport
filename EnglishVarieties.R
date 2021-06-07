library(inauguration)

# plot theme
theme_Caitlin_present <- function() {theme_bw(base_size = 22) %+replace%
    theme(plot.background  = element_rect(fill = "transparent", colour = NA),
          panel.background = element_rect(fill="gray90", colour=NA),
          legend.background = element_rect(fill="transparent", colour=NA),
          legend.key = element_rect(fill="transparent", colour=NA),
          panel.grid.major = element_line(colour = "white", size = 0.2), 
          panel.grid.minor = element_line(colour = "grey98", size = 0.5))}

#Pilot data
pilotData=read.csv("pilotModelData.csv")
head(pilotData, 10)

#Pilot models
pilotCorp=glm(FreqPapers.freq~pilotCorpus, data=pilotData, family=poisson)
summary(pilotCorp)

pilotIncome=glm(FreqPapers.freq~AreaIncome, data=pilotData, family=poisson)
summary(pilotIncome)

bigModel=glm(FreqPapers.freq~AreaIncome+pilotCorpus, data=pilotData, family=poisson)
summary(bigModel)

library(ggplot2)
theme_Caitlin_present <- function() {theme_bw(base_size = 22) %+replace%
    theme(plot.background  = element_rect(fill = "transparent", colour = NA),
          panel.background = element_rect(fill="gray90", colour=NA),
          legend.background = element_rect(fill="transparent", colour=NA),
          legend.key = element_rect(fill="transparent", colour=NA),
          panel.grid.major = element_line(colour = "white", size = 0.5), 
          panel.grid.minor = element_line(colour = "grey98", size = 0.5))}
inauguration5=inauguration("inauguration_2021", 5)
plotData=read.csv("plotData.csv")
bigplot=ggplot(data=plotData,(aes(x=Variety, fill=Variety)))+
  geom_bar()+
  labs(caption="Figure 1.Frequency of papers by region (from pilot search), after pre-screening.") +
  scale_fill_manual(values = inauguration("inauguration_2021", 5))+
  theme_Caitlin_present()+
  theme(legend.position = "none", plot.caption = element_text(hjust = 0.5))+
  NULL

ggsave("posterPlot.png", bigplot, width=10)

#Data-------



data=read.csv("MinorityData.rda")



#Are English varieties that are typically geographically distant from linguistics university departments understudied? --------

GeoMod1=glm(FreqPapers~ProximityToLingDept, data=data, family=poisson)


GeoMod2=glm(FreqPapers~ProximityToUniversity, data=data, family=poisson)


GeoMod3=glm(FreqPapers~ProximityToDegree, data=data, family=poisson)


GeoMod4=glm(FreqPapers~ProximityToVariationLab, data=data, family=poisson)


#Do corpus' facilitate variation research?------
CorpMod1=glm(FreqPapers~Corpus, data=data, family=poisson)



#Are English varieties associated with higher social/income status lacking in research articles?-------

StatusMod2=glm(FreqPapers~AreaIncome, data=data, family=poisson)


#Is most research conducted on varieties of English typically associated with suburban, as opposed to metropolitan or rural, areas?------

UrbanMod1=glm(FreqPapers~Metropolitan, data=data, family=poisson)

UrbanMod2=glm(FreqPapers~ProximityToCityCentre, data=data, family=poisson)





