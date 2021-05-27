

#Pilot data
pilotData=read.csv("pilotModelData.csv")
head(pilotData, 10)

#Pilot models
pilotCorp=glm(FreqPapers.freq~pilotCorpus, data=pilotData, family=poisson)
summary(pilotCorp)


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





