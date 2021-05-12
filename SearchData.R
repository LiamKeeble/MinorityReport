

library(bibliometrix)
library(tidyverse)


#Data sets from searches

bibData=convert2df("", dbsource="scopus", format="bibtex")


#Delete duplicates from datasets

data=as_tibble(bibData)

data[!duplicated(data$title), ]


#Export datasets for assessment for inclusion

write.csv(data, "bibData.csv")





