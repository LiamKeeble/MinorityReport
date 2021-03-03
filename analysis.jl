

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
	     )





display(first(df,20))



#Data

#df=DataFrame(CSV.File(""))




#Models
#Poisson model

@model bayesA(x,y) = begin
	n=size(x)	

	intercept~Normal(0,1)
	predict~Normal(0,1)

	v=intercept .+ predict*x
	y .~ BinomialLogit.(y,v)
end;



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


plot(chain)
savefig("bayes.png")









