

library(bibliometrix)
library(psych)
library(plyr)


#List of varieties
set.seed(111)

list=data.frame(Variety=c("Chesire","Cumbrian","Tyneside","Hartlepool","Lancashire","Sunderland","Mancunian","Northumbrian","County Durham","Merseyside","Teesside","Yorkshire","Lincolnshire","East Lincolnshire","Black Country","Birmingham","North Staffordshire","Coventry","Norfolk","Suffolk","London","Essex","Hampshire","Porstmouth","Kent","Sussex","Cornwall","Bristol","Plymouth","Dorset"))

#list=list[sample(1:nrow(list), 10), ]

#Data sets from searches

bibData1=convert2df("Lincolnshire.bib",dbsource="wos", format="bibtex")
data1=data.frame(bibData1$AU,bibData1$TI,bibData1$SO,bibData1$PY,bibData1$DI)
data1=rename(data1, c("bibData1.AU"="Author","bibData1.TI"="Title","bibData1.SO"="Source","bibData1.PY"="PubYear","bibData1.DI"="DOI"))
data1$Variety=rep("Lincolnshire", nrow(data1))


bibData2=convert2df("Cornwall.bib",dbsource="wos",format="bibtex")
data2=data.frame(bibData2$AU,bibData2$TI,bibData2$SO,bibData2$PY,bibData2$DI)
data2=rename(data2, c("bibData2.AU"="Author","bibData2.TI"="Title","bibData2.SO"="Source","bibData2.PY"="PubYear","bibData2.DI"="DOI"))
data2$Variety=rep("Cornwall", nrow(data2))


bibData3=convert2df("Suffolk.bib",dbsource="wos",format="bibtex")
data3=data.frame(bibData3$AU,bibData3$TI,bibData3$SO,bibData3$PY,bibData3$DI)
data3=rename(data3, c("bibData3.AU"="Author","bibData3.TI"="Title","bibData3.SO"="Source","bibData3.PY"="PubYear","bibData3.DI"="DOI"))
data3$Variety=rep("Suffolk", nrow(data3))


bibData4=convert2df("Norfolk.bib",dbsource="wos", format="bibtex")
data4=data.frame(bibData4$AU,bibData4$TI,bibData4$SO,bibData4$PY,bibData4$DI)
data4=rename(data4, c("bibData4.AU"="Author","bibData4.TI"="Title","bibData4.SO"="Source","bibData4.PY"="PubYear","bibData4.DI"="DOI"))
data4$Variety=rep("Norfolk", nrow(data4))



bibData5=convert2df("BlackCountry.bib",dbsource="wos", format="bibtex")
data5=data.frame(bibData5$AU,bibData5$TI,bibData5$SO,bibData5$PY,bibData5$DI)
data5=rename(data5, c("bibData5.AU"="Author","bibData5.TI"="Title","bibData5.SO"="Source","bibData5.PY"="PubYear","bibData5.DI"="DOI"))
data5$Variety=rep("BlackCountry", nrow(data5))




bibData6=convert2df("Kent.bib",dbsource="wos", format="bibtex")
data6=data.frame(bibData6$AU,bibData6$TI,bibData6$SO,bibData6$PY,bibData6$DI)
data6=rename(data6, c("bibData6.AU"="Author","bibData6.TI"="Title","bibData6.SO"="Source","bibData6.PY"="PubYear","bibData6.DI"="DOI"))
data6$Variety=rep("Kent", nrow(data6))



bibData7=convert2df("Lancashire.bib",dbsource="wos", format="bibtex")
data7=data.frame(bibData7$AU,bibData7$TI,bibData7$SO,bibData7$PY,bibData7$DI)
data7=rename(data7, c("bibData7.AU"="Author","bibData7.TI"="Title","bibData7.SO"="Source","bibData7.PY"="PubYear","bibData7.DI"="DOI"))
data7$Variety=rep("Lancashire", nrow(data7))




bibData8=convert2df("Tyneside.bib",dbsource="wos", format="bibtex")
data8=data.frame(bibData8$AU,bibData8$TI,bibData8$SO,bibData8$PY,bibData8$DI)
data8=rename(data8, c("bibData8.AU"="Author","bibData8.TI"="Title","bibData8.SO"="Source","bibData8.PY"="PubYear","bibData8.DI"="DOI"))
data8$Variety=rep("Tyneside", nrow(data8))



bibData9=convert2df("Northumbrian.bib",dbsource="wos", format="bibtex")
data9=data.frame(bibData9$AU,bibData9$TI,bibData9$SO,bibData9$PY,bibData9$DI)
data9=rename(data9, c("bibData9.AU"="Author","bibData9.TI"="Title","bibData9.SO"="Source","bibData9.PY"="PubYear","bibData9.DI"="DOI"))
data9$Variety=rep("Northumbrian", nrow(data9))



bibData10=convert2df("Staffordshire.bib",dbsource="wos", format="bibtex")
data10=data.frame(bibData10$AU,bibData10$TI,bibData10$SO,bibData10$PY,bibData10$DI)
data10=rename(data10, c("bibData10.AU"="Author","bibData10.TI"="Title","bibData10.SO"="Source","bibData10.PY"="PubYear","bibData10.DI"="DOI"))
data10$Variety=rep("Staffordshire", nrow(data10))



bibData11=convert2df("Chesire.bib",dbsource="wos", format="bibtex")
data11=data.frame(bibData11$AU,bibData11$TI,bibData11$SO,bibData11$PY,bibData11$DI)
data11=rename(data11, c("bibData11.AU"="Author","bibData11.TI"="Title","bibData11.SO"="Source","bibData11.PY"="PubYear","bibData11.DI"="DOI"))
data11$Variety=rep("Cheshire", nrow(data11))


bibData12=convert2df("Cumbrian.bib",dbsource="wos", format="bibtex")
data12=data.frame(bibData12$AU,bibData12$TI,bibData12$SO,bibData12$PY,bibData12$DI)
data12=rename(data12, c("bibData12.AU"="Author","bibData12.TI"="Title","bibData12.SO"="Source","bibData12.PY"="PubYear","bibData12.DI"="DOI"))
data12$Variety=rep("Cumbrian", nrow(data12))

bibData13=convert2df("Sunderland.bib",dbsource="wos", format="bibtex")
data13=data.frame(bibData13$AU,bibData13$TI,bibData13$SO,bibData13$PY,bibData13$DI)
data13=rename(data13, c("bibData13.AU"="Author","bibData13.TI"="Title","bibData13.SO"="Source","bibData13.PY"="PubYear","bibData13.DI"="DOI"))
data13$Variety=rep("Sunderland", nrow(data13))


bibData14=convert2df("CountyDurham.bib",dbsource="wos", format="bibtex")
data14=data.frame(bibData14$AU,bibData14$TI,bibData14$SO,bibData14$PY,bibData14$DI)
data14=rename(data14, c("bibData14.AU"="Author","bibData14.TI"="Title","bibData14.SO"="Source","bibData14.PY"="PubYear","bibData14.DI"="DOI"))
data14$Variety=rep("CountyDurham", nrow(data14))



bibData15=convert2df("Merseyside.bib",dbsource="wos", format="bibtex")
data15=data.frame(bibData15$AU,bibData15$TI,bibData15$SO,bibData15$PY,bibData15$DI)
data15=rename(data1, c("bibData15.AU"="Author","bibData15.TI"="Title","bibData15.SO"="Source","bibData15.PY"="PubYear","bibData15.DI"="DOI"))
data1$Variety=rep("Merseyside", nrow(data15))


bibData16=convert2df("Yorkshire.bib",dbsource="wos", format="bibtex")
data16=data.frame(bibData16$AU,bibData16$TI,bibData16$SO,bibData16$PY,bibData16$DI)
data16=rename(data16, c("bibData16.AU"="Author","bibData16.TI"="Title","bibData16.SO"="Source","bibData16.PY"="PubYear","bibData16.DI"="DOI"))
data16$Variety=rep("Yorkshire", nrow(data16))

bibData17=convert2df("Birmingham.bib",dbsource="wos", format="bibtex")
data17=data.frame(bibData17$AU,bibData17$TI,bibData17$SO,bibData17$PY,bibData17$DI)
data17=rename(data17, c("bibData17.AU"="Author","bibData17.TI"="Title","bibData17.SO"="Source","bibData17.PY"="PubYear","bibData17.DI"="DOI"))
data17$Variety=rep("Birmingham", nrow(data17))



bibData18=convert2df("Coventry.bib",dbsource="wos", format="bibtex")
data18=data.frame(bibData18$AU,bibData18$TI,bibData18$SO,bibData18$PY,bibData18$DI)
data18=rename(data18, c("bibData18.AU"="Author","bibData18.TI"="Title","bibData18.SO"="Source","bibData18.PY"="PubYear","bibData18.DI"="DOI"))
data18$Variety=rep("Coventry", nrow(data18))


bibData19=convert2df("London.bib",dbsource="wos", format="bibtex")
data19=data.frame(bibData19$AU,bibData19$TI,bibData19$SO,bibData19$PY,bibData19$DI)
data19=rename(data19, c("bibData19.AU"="Author","bibData19.TI"="Title","bibData19.SO"="Source","bibData19.PY"="PubYear","bibData19.DI"="DOI"))
data19$Variety=rep("Lincolnshire", nrow(data19))



bibData20=convert2df("Essex.bib",dbsource="wos", format="bibtex")
data20=data.frame(bibData20$AU,bibData20$TI,bibData20$SO,bibData20$PY,bibData20$DI)
data20=rename(data20, c("bibData20.AU"="Author","bibData20.TI"="Title","bibData20.SO"="Source","bibData20.PY"="PubYear","bibData20.DI"="DOI"))
data20$Variety=rep("Essex", nrow(data20))


bibData21=convert2df("Hampshire.bib",dbsource="wos", format="bibtex")
data21=data.frame(bibData21$AU,bibData21$TI,bibData21$SO,bibData21$PY,bibData21$DI)
data21=rename(data21, c("bibData21.AU"="Author","bibData21.TI"="Title","bibData21.SO"="Source","bibData21.PY"="PubYear","bibData21.DI"="DOI"))
data21$Variety=rep("Hampshire", nrow(data21))


bibData22=convert2df("Portsmouth.bib",dbsource="wos", format="bibtex")
data22=data.frame(bibData22$AU,bibData22$TI,bibData22$SO,bibData22$PY,bibData22$DI)
data22=rename(data22, c("bibData22.AU"="Author","bibData22.TI"="Title","bibData22.SO"="Source","bibData22.PY"="PubYear","bibData22.DI"="DOI"))
data22$Variety=rep("Portsmouth", nrow(data22))


bibData23=convert2df("Sussex.bib",dbsource="wos", format="bibtex")
data23=data.frame(bibData23$AU,bibData23$TI,bibData23$SO,bibData23$PY,bibData23$DI)
data23=rename(data23, c("bibData23.AU"="Author","bibData23.TI"="Title","bibData23.SO"="Source","bibData23.PY"="PubYear","bibData23.DI"="DOI"))
data23$Variety=rep("Sussex", nrow(data23))

bibData24=convert2df("Bristol.bib",dbsource="wos", format="bibtex")
data24=data.frame(bibData24$AU,bibData24$TI,bibData24$SO,bibData24$PY,bibData24$DI)
data24=rename(data24, c("bibData24.AU"="Author","bibData24.TI"="Title","bibData24.SO"="Source","bibData24.PY"="PubYear","bibData24.DI"="DOI"))
data24$Variety=rep("Bristol", nrow(data24))


bibData25=convert2df("Plymouth.bib",dbsource="wos", format="bibtex")
data25=data.frame(bibData25$AU,bibData25$TI,bibData25$SO,bibData25$PY,bibData25$DI)
data25=rename(data25, c("bibData25.AU"="Author","bibData25.TI"="Title","bibData25.SO"="Source","bibData25.PY"="PubYear","bibData25.DI"="DOI"))
data25$Variety=rep("Plymouth", nrow(data25))




#Combining datasets
bibData=rbind(data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21,data22,data23,data24,data25)

describe(bibData)


#Delete duplicates from datasets

library(tidyverse)

data=as_tibble(bibData)
describe(data)

data=data[!duplicated(data$Title), ]
describe(data)



#Export final dataset for assessment for inclusion

#data=data[sample(1:nrow(data), 160), ]
data$Coder=c(rep("Caitlin", nrow(data)/2),rep("Liam", (nrow(data)/2)+1))
data$Removed=NA
data$Reason=NA

head(data)
write.csv(data, "studyData.csv")





