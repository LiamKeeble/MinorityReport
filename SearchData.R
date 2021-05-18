

library(bibliometrix)
library(psych)
library(plyr)


#Data sets from searches

bibData1=convert2df("TynesideEnglish.bib",dbsource="wos", format="bibtex")
data1=data.frame(bibData1$AU,bibData1$TI,bibData1$SO,bibData1$PY)
data1=rename(data1, c("bibData1.AU"="AU","bibData1.TI"="TI","bibData1.SO"="SO","bibData1.PY"="PY"))
describe(data1)

bibData2=convert2df("BirminghamEnglish.bib",dbsource="wos",format="bibtex")
data2=data.frame(bibData2$AU,bibData2$TI,bibData2$SO,bibData2$PY)
data2=rename(data2, c("bibData2.AU"="AU","bibData2.TI"="TI","bibData2.SO"="SO","bibData2.PY"="PY"))
describe(data2)

bibData3=convert2df("CumbrianEnglish.bib",dbsource="wos",format="bibtex")
data3=data.frame(bibData3$AU,bibData3$TI,bibData3$SO,bibData3$PY)
data3=rename(data3, c("bibData3.AU"="AU","bibData3.TI"="TI","bibData3.SO"="SO","bibData3.PY"="PY"))
describe(data3)

bibData=rbind(data1,data2,data3)

describe(bibData)

#Delete duplicates from datasets

library(tidyverse)

data=as_tibble(bibData)

data[!duplicated(data$TI), ]


#Sample and export pilot data
set.seed(123)
pilotData=data[sample(1:nrow(data),30), ]
describe(pilotData)
write.csv(pilotData, "pilotData.csv")

#Export datasets for assessment for inclusion

write.csv(data, "bibData.csv")





