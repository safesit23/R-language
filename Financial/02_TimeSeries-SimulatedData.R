#Simulated data 
n = 5
simulate = rnorm(n,mean = 0,sd=0.1)
V = 10*cumprod(1+simulate) #simulated prices for 5 periods, basis=10
Ret = c(NA,V[2:length(V)]/V[1:(length(V)-1)]-1)
accum.ret = c(1,cumprod(1+na.omit(Ret))-1)
library(scales)
scales::percent(accum.ret) # Sample Result: "100.0%" "-7.6%"  "-6.3%"  "-17.6%" "-25.7%"
