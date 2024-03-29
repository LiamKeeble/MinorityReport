library(inauguration)
library(brms)


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

pilotData$AreaIncome=(pilotData$AreaIncome-mean(pilotData$AreaIncome))/sd(pilotData$AreaIncome)

#Pilot models
pilotCorp=brm(FreqPapers.freq~pilotCorpus, data=pilotData, family=poisson,
	prior=set_prior("normal(0,1)"))
summary(pilotCorp, waic=TRUE)
plot(pilotCorp)

pilotIncome=brm(FreqPapers.freq~AreaIncome, data=pilotData, family=poisson,
	prior=set_prior("normal(0,1)"))
summary(pilotIncome, waic=TRUE)
plot(pilotIncome)

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



data=read.csv("distances-data.csv")
count=read.csv("studyData.csv")
count=subset(count, Removed=="N")
head(count)

count=data.frame(table(count$Variety))
write.csv(count, "counts.csv")

FreqPapers=c(1,1,2,0,1,0,1,0,2,0,0,2,0,0,0,1,0,0,0,3,1,0,14,1)
Corpus=c(1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0)
AreaIncome=c(16932,16932,16932,16861,18984,15809,16885,16861,16932,22568,22568,16861,16932,16861,16932,15809,18984,18984,16885,16932,15809,22568,15809,16119)
Metropolitan=c(1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,1,1,0,0,1,0,1,0)


data=data.frame(data,FreqPapers,Corpus,AreaIncome,Metropolitan)
head(data)


#Are English varieties that are typically geographically distant from linguistics university departments understudied? --------


data$miles=data$miles/max(data$miles)

GeoMod1=brm(FreqPapers~miles, data=data, family=poisson,
	prior=set_prior("normal(0,3)"))
summary(GeoMod1, waic=TRUE)
plot(GeoMod1)


#Do corpus' facilitate variation research?------
CorpMod1=brm(FreqPapers~Corpus, data=data, family=poisson,
	prior=set_prior("normal(0,3)"))
summary(CorpMod1,waic=TRUE)
plot(CorpMod1)


#Are English varieties associated with higher social/income status lacking in research articles?-------


data$AreaIncome=data$AreaIncome/max(data$AreaIncome)

StatusMod2=brm(FreqPapers~AreaIncome, data=data, family=poisson,
	prior=set_prior("normal(0,3)"))
summary(StatusMod2, waic=TRUE)
plot(StatusMod2)





#Is most research conducted on varieties of English typically associated with suburban, as opposed to metropolitan or rural, areas?------

UrbanMod1=brm(FreqPapers~Metropolitan, data=data, family=poisson,
	prior=set_prior("normal(0,3)"))
summary(UrbanMod1, waic=TRUE)
plot(UrbanMod1)





#Full model

full=brm(FreqPapers~Corpus+AreaIncome+Metropolitan*miles, data=data, family=poisson, prior=set_prior("normal(0,3)"))
summary(full, waic=TRUE)


jpeg("new.jpg")
stanplot(full,pars=c("Corpus","AreaIncome","Metropolitan","miles","Metropolitan:miles")) + theme(text=element_text(size=30))
dev.off()





