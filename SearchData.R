

library(bibliometrix)
library(tidyverse)




#Data sets from searches

bibData=convert2df("", dbsource="wos", format="bibtex")




#Delete duplicates from datasets

data=as_tibble(bibData)

data[!duplicated(data$title), ]





#Export datasets for PRISMA protocol


write.csv(data, "bibData.csv")





