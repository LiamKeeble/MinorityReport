

using Turing
using MCMCChains
using Plots
using StatsPlots
using Distributions
using CSV
using DataFrames
using Random

Random.seed!(123)


#Dummy data

df=DataFrame(
	geog=rand(Normal(0,1),200),
	freqPub=rand(Poisson(30),200),
	corp=rand(BinomialLogit(1,0.8),200),
	income=rand(Normal(0,1),200)

	)





display(first(df,20))



#Data

#df=DataFrame(CSV.File(""))


#Standardise variables








#Models
#Poisson model

@model bayesA(x,y) = begin
	n=size(x)	

	intercept~Normal(0,1)
	predict~Normal(0,1)

	v=intercept .+ predict*x
	y .~ BinomialLogit.(y,v)
end;






#Proximity to nearest university as a predictor

#Sample from prior
prior=mapreduce(c->sample(bayesA(df.geog,df.freqPub), Prior(), 1000),
		 chainscat,
		 1:4
		 )
display(prior)


#Sample from posterior
chain=mapreduce(c->sample(bayesA(df.geog,df.freqPub), HMC(0.05,10), 1000),
		 chainscat,
		 1:4
		 )
display(chain)



#Proximity to nearest linguistics dept. as a predictor
#Sample from prior
prior=mapreduce(c->sample(bayesA(df.geog,df.freqPub), Prior(), 1000),
		 chainscat,
		 1:4
		 )
display(prior)

#Sample from posterior
chain=mapreduce(c->sample(bayesA(df.geog,df.freqPub), HMC(0.05,10), 1000),
		 chainscat,
		 1:4
		 )
display(chain)



#Proximity to nearest linguistics degree as a predictor
prior=mapreduce(c->sample(bayesA(df.geog,df.freqPub), Prior(),1000),
		 chainscat,
		 1:4
		 )
display(prior)

#Sample from posterior
chain=mapreduce(c->sample(bayesA(df.geog,df.freqPub), HMC(0.05,10),1000),
		 chainscat,
		 1:4
		 )
display(chain)



#Proximity to nearest research lab as predictor
#Sample from prior
prior=mapreduce(c->sample(bayesA(df.geog,df.freqPub), Prior(), 1000),
		 chainscat,
		 1:4
		 )
display(prior)

#Sample from posterior
chain=mapreduce(c->sample(bayesA(df.geog,df.freqPub), HMC(0.05,10), 1000),
		 chainscat,
		 1:4
		 )
display(chain)



#Proximity to a city as a predictor as a predictor
#Sample from prior
prior=mapreduce(c->sample(bayesA(df.geog,df.freqPub), Prior(), 1000),
		 chainscat,
		 1:4
		 )
display(prior)

#Sample from posterior
chain=mapreduce(c->sample(bayesA(df.geog,df.freqPub), HMC(0.05,10), 1000),
		 chainscat,
		 1:4
		 )
display(chain)




#Corpus existence as a predictor 
#Sample from prior
prior=mapreduce(c->sample(bayesA(df.corp,df.freqPub), Prior(), 1000),
		 chainscat,
		 1:4
		 )
display(prior)

#Sample from posterior
chain=mapreduce(c->sample(bayesA(df.corp,df.freqPub), HMC(0.05,10), 1000),
		 chainscat,
		 1:4
		 )
display(chain)



#Area income as a predictor
#Sample from prior
prior=mapreduce(c->sample(bayesA(df.income,df.freqPub), Prior(), 1000),
		 chainscat,
		 1:4
		 )
display(prior)

#Sample from posterior
chain=mapreduce(c->sample(bayesA(df.income,df.freqPub), HMC(0.05,10), 1000),
		 chainscat,
		 1:4
		 )
display(chain)








