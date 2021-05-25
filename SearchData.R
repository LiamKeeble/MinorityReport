

library(bibliometrix)
library(psych)
library(plyr)


#List of varieties
set.seed(111)

list=data.frame(Variety=c("Chesire","Cumbrian","Tyneside","Hartlepool","Lancashire","Sunderland","Mancunian","Northumbrian","County Durham","Merseyside","Teesside","Yorkshire","Lincolnshire","East Lincolnshire","Black Country","Birmingham","North Staffordshire","Coventry","Norfolk","Suffolk","London","Essex","Hampshire","Porstmouth","Kent","Sussex","Cornwall","Bristol","Plymouth","Dorset"))

list=list[sample(1:nrow(list), 3), ]
print(list)

#Data sets from searches

bibData1=convert2df("Lincolnshire.bib",dbsource="wos", format="bibtex")
data1=data.frame(bibData1$AU,bibData1$TI,bibData1$SO,bibData1$PY,bibData1$DI)
data1=rename(data1, c("bibData1.AU"="Author","bibData1.TI"="Title","bibData1.SO"="Source","bibData1.PY"="PubYear","bibData1.DI"="DOI"))
data1$Variety=rep("Lincolnshire", nrow(data1))

describe(data1)

bibData2=convert2df("Cornwall.bib",dbsource="wos",format="bibtex")
data2=data.frame(bibData2$AU,bibData2$TI,bibData2$SO,bibData2$PY,bibData2$DI)
data2=rename(data2, c("bibData2.AU"="Author","bibData2.TI"="Title","bibData2.SO"="Source","bibData2.PY"="PubYear","bibData2.DI"="DOI"))
data2$Variety=rep("Cornwall", nrow(data2))

describe(data2)

bibData3=convert2df("Suffolk.bib",dbsource="wos",format="bibtex")
data3=data.frame(bibData3$AU,bibData3$TI,bibData3$SO,bibData3$PY,bibData3$DI)
data3=rename(data3, c("bibData3.AU"="Author","bibData3.TI"="Title","bibData3.SO"="Source","bibData3.PY"="PubYear","bibData3.DI"="DOI"))
data3$Variety=rep("Suffolk", nrow(data3))

describe(data3)


#Combining datasets
bibData=rbind(data1,data2,data3)

describe(bibData)


#Delete duplicates from datasets

library(tidyverse)

data=as_tibble(bibData)
describe(data)

data=data[!duplicated(data$Title), ]
describe(data)



#Export final dataset for assessment for inclusion

#Alter sample size for actual study
data=data[sample(nrow(data), 20), ]
#

data$Coder=c(rep("Caitlin", nrow(data)/2),rep("Liam", nrow(data)/2))
data$Removed=NA
data$Reason=NA

head(data)
write.csv(data, "bibData.csv")





