

library(rstan)
library(rethinking)



#Dummy data

df=data.frame(
	geog=rnorm(200,0,1),
	corp=rbinom(200,1,0.8),
	papFreq=rnorm(200,0,1),
	income=rnorm(200,0,1),
	metro=rbinom(200,1,0.8)

)


head(df,20)


#Data

#Standardise data


#Are english varieties that are geographically distant from centres of linguitic research more likely to be understudied?

lm<-ulam(
	alist(
	papFreq~normal(v,1),
	v<-intercept + b*geog,
	b~normal(0,1),
	intercept~normal(0,1)
	
	), data=df, chains=4, iter=10000, warmup=500

)

summary(lm)



#Does the presence of a locally focused corpus increase research output on a particular variety?

lm<-ulam(
	alist(
	papFreq~normal(v,1),
	v<-intercept + b*corp,
	b~normal(0,1),
	intercept~normal(0,1)
	), data=df, chains=4, iter=10000, warmup=500

)

summary(lm)


#Are english varieties associated with higher income areas lacking in research efforts?


lm<-ulam(
	alist(
	papFreq~normal(v,1),
	v<-intercept + b*income,
	b~normal(0,1),
	intercept~normal(0,1)
	), data=df, chains=4, iter=10000, warmup=500

)

summary(lm)


#Is more research conducted on varieties of English associated with suburban, metropolitan or rural areas?

lm<-ulam(
	alist(
	paprFreq~normal(v,1),
	v<-intercept + b*metro,
	b~normal(0,1),
	intercept~normal(0,1)
	), data=df, chains=4, iter=10000, warmup=500

)

summary(lm)





