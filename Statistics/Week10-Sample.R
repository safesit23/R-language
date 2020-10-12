library(MASS)
#Sample Size
zstar = qnorm(0.975);zstar
sigma = 9.48
E =1.2
zstar^2 * sigma^2/E^2

gender.response = na.omit(survey$Sex)
n = length(gender.response)
k = sum(gender.response == "Female")
pbar = k/n; pbar

SE = sqrt(pbar*(1-pbar)/n); SE

E = qnorm(0.975)*SE; E

pbar + c(-E,E)


prop.test(k,n)
