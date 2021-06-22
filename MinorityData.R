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

register_google(key = "")

## Variety Lists ----
set.seed(111)


EnglishVariety=c("Chesire","Cumbrian","Tyneside","Hartlepool","Lancashire","Sunderland","Mancunian","Northumbrian","County Durham","Merseyside","Teesside","Yorkshire","Lincolnshire","Black Country","Birmingham","Staffordshire","Coventry","Norfolk","Suffolk","London","Essex","Hampshire","Porstmouth","Kent","Sussex","Cornwall","Bristol","Plymouth","Dorset")



VarietyLocation=c("Chesire","Cumbria","Newcastle upon Tyne","Hartlepool","Lancashire","Sunderland","Manchester","Northumbrian","County Durham","Merseyside","Teesside","Yorkshire","Lincolnshire","Black Country","Birmingham","Staffordshire","Coventry","Norfolk","Suffolk","London","Essex","Hampshire","Porstmouth","Kent","Sussex","Cornwall","Bristol","Plymouth","Dorset")

Data=data.frame(EnglishVariety,VarietyLocation)

#dataset
Data=pilotData[sample(1:nrow(pilotData), 10), ]
print(Data)

Data$pilotCorpus=c("No","No","Yes","No","No","No","No","Yes","No","No")

Data$NearestUniversity=c("University of Lincoln","Falmouth University","University of Suffolk", "University of East Anglia", "University of Birmingham", "University of Kent","University of Central Lancashire", "Newcastle University", "Northumbria University", "Staffordshire University")

Data$AreaIncome=c(30.4,24.5,37.9,34.9,25.9,42.9,43,35.9,27.3,27)

library(plyr)
paperData=read.csv("studyData.csv")
table(paperData$Reason/nrow(paperData$Reason))
paperData=subset(paperData, Removed=="No")
write.csv(paperData, "plotData.csv")

FreqPapers=count(paperData, vars="Variety")
FreqPapers[nrow(FreqPapers)+1,]=c("Hartlepool",0)
FreqPapers[nrow(FreqPapers)+1,]=c("Mancunian",0)
FreqPapers[nrow(FreqPapers)+1,]=c("Teeside",0)
FreqPapers[nrow(FreqPapers)+1,]=c("Dorset",0)
Data$FreqPapers=FreqPapers

#map1=mapdist("University of Lincoln","Lincolnshire")
#map2=mapdist("Falmouth University","Cornwall")
#map3=mapdist("University of Suffolk","Suffolk")
#map4=mapdist("University of East Anglia","Norfolk")
#map5=mapdist("University of Birmingham","Black Country")
#map6=mapdist("University of Kent","Kent")
#map7=mapdist("University of Central Lancashire","Lancashire")
#map8=mapdist("Newcastle University","Newcastle upon Tyne")
#map9=mapdist("Northumbria University","Northumberland")
#map10=mapdist("Staffordshire University","Staffordshire")
#pilotData$ProximityToUniversity=rbind(map1,map2,map3,map4,map5,map6,map7,map8,map9,map10)


head(Data,10)



write.csv(Data, "ModelData.csv")


  


