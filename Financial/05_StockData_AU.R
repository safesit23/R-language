library(quantmod)
#After You (AU)

# 1.) Prepare Data ----------------
stock = getSymbols("AU.BK",auto.assign = FALSE)
stock = na.omit(stock) #not available omit for removing missing value
str(stock);periodicity(stock)

# 2.) change daily to weekly
stockWeek = to.weekly(stock)
tail(stockWeek)
price = stockWeek[,4] #select Close price
plot(price)

# 3.) Observe Pattern
price.dec = decompose(ts(price,frequency = 7)) %>% plot()
#check stationary by using ADF
library(tseries)
adf.test(price)

# 4.) Preprocess and plot the graph to ensure that trend and variance are managed
plot(log(price))
log(price) %>% adf.test()

dP = diff(price) 
dP[!is.na(dP)] %>% adf.test()
plot(diff(price))

diff(log(P)) %>% adf.test()
dlP = diff(log(P))
plot(dlP) #or use this one

# 5.) ARIMA
auto.arima(dlP)
pacf(dlP) #p=2
acf(dlP) #q=2

arima(lP,c(0,1,0))
#c(0, 1, 0))