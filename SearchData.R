

library(bibliometrix)
library(tidyverse)


#Data sets from searches

bibData1=convert2df("TynesideEnglish", dbsource="wos", format="bibtex")
bibData2=convert2df("BirminghamEnglish", dbsource="wos",format="bibtex")
bibData3=convert2df("CumbrianEnglish", dbsource="wos", format="bibtex")


bibData=rbind(bibData1,bibData2,bibData3)

head(bibData)

#Delete duplicates from datasets

data=as_tibble(bibData)

data[!duplicated(data$title), ]


#Export datasets for assessment for inclusion

write.csv(data, "bibData.csv")





