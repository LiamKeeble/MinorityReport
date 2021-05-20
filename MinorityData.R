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

EnglishVariety=c("Geordie", "Scouse", "Brummie")
# how are we going to handle different names here? they could also be TYneside Tyneside, Liverpool, and Birmingham English respectively

VarietyLocation=c("Newcastle", "Liverpool", "Birmingham")

NearestUniversity=c("Newcastle University", "Liverpool University", "Birmingham University")

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


