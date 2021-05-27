## Load and install packages ----
## First specify the packages of interest
packages = c("ggmap")

## Now load or install&load all
package.check <- lapply(
  packages,
  FUN = function(x) {
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      library(x, character.only = TRUE)
    }
  }
)
## If a package is installed, it will be loaded. If any are not, the missing package(s) will be installed from CRAN and then loaded.

## Google API key ----

register_google(key = "AIzaSyC9Deo70nrX_aaVNc3mkxSz-8ThhypBjGU")

## Variety Lists ----
set.seed(111)


EnglishVariety=c("Chesire","Cumbrian","Tyneside","Hartlepool","Lancashire","Sunderland","Mancunian","Northumbrian","County Durham","Merseyside","Teesside","Yorkshire","Lincolnshire","East Lincolnshire","Black Country","Birmingham","North Staffordshire","Coventry","Norfolk","Suffolk","London","Essex","Hampshire","Porstmouth","Kent","Sussex","Cornwall","Bristol","Plymouth","Dorset")



VarietyLocation=c("Chesire","Cumbria","Newcastle upon Tyne","Hartlepool","Lancashire","Sunderland","Manchester","Northumbrian","County Durham","Merseyside","Teesside","Yorkshire","Lincolnshire","Lincolnshire","Black Country","Birmingham","Staffordshire","Coventry","Norfolk","Suffolk","London","Essex","Hampshire","Porstmouth","Kent","Sussex","Cornwall","Bristol","Plymouth","Dorset")

pilotData=data.frame(EnglishVariety,VarietyLocation)

#Pilot dataset
pilotData=pilotData[sample(1:nrow(pilotData), 10), ]
print(pilotData)


pilotData$pilotCorpus=c("No","No","Yes","No","No","No","No","Yes","No","No")

pilotData$NearestUniversity=c("University of Lincoln","Falmouth University","University of Suffolk", "University of East Anglia", "University of Birmingham", "University of Kent","University of Central Lancashire", "Newcastle University", "Northumbria University", "Staffordshire University")

pilotData$AreaIncome=c(30.4,24.5,37.9,34.9,25.9,42.9,43,35.9,27.3,27)

library(plyr)
paperData=read.csv("pilotData.csv")
FreqPapers=count(paperData, vars="Variety")
FreqPapers[nrow(FreqPapers)+1,]=c("BlackCountry",0)
pilotData$FreqPapers=FreqPapers

head(pilotData,10)



write.csv(pilotData, "pilotModelData.csv")


#Final dataset

NearestUniversity=c()

Corpus=c()

ActiveResearch=c()

FreqPapers=c()
  
  
Metropolitan=c()
  
  
  
AreaIncome=c()

  
NearestLingDegree=c()

NearestLab=c()

NearestDept=c()

NearestCityCentre=c()

## Map Distances ----
  
  
ProximityToUniversity=mapdist(data$VarietyLocation, data$NearestUniversity)


ProximityToDegree=mapdist(data$VarietyLocation, data$NearestLingDegree)

ProximityToVariationLab=mapdist(data$VarietyLocation, data$NearestLab)
  
  
ProximityToLingDept=mapdist(data$VarietyLocation, data$NearestDept)
  
ProximityToCityCentre=mapdist(data$VarietyLocation, data$NearestCityCentre)

## create data frame ----

data=data.frame(c())

write.csv()


