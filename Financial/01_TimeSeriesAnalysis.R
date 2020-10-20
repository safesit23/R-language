# Financial Time Series
## Load data
load("tsa3.rda") #From "https://github.com/safesit23/R-language/blob/master/Financial/lib/tsa3.rda"

# johnson and johnson -------------------
## Display data of johnson and johnson
str(jj) #Time-Series [1:84] from 1960 to 1981:0.71 0.63 0.85 0.44 0.61 0.69 0.92 0.55 0.72 0.77 ...
head(jj)
tail(jj)
## Plot graph
plot(jj, type="o", ylab="Quarterly Earnings per Share")
## Analyse JJ
#Non stationary because it is trends, season, variance

# NYSE -------------------
plot(nyse, ylab="NYSE Returns")
##Analyse
# Stationary, No Trends, No season, has special event(pulse)->market crash

# White noise ---------------
w=rnorm(500,0,1)  #random number generator
plot(w, main="white noise")
plot.ts(w, main="white noise")
# statinary
