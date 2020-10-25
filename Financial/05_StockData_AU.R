library(quantmod)
#After You (AU)

# Prepare Data ----------------
stock = getSymbols("AU.BK",auto.assign = FALSE)
stock = na.omit(stock) #not available omit for removing missing value
str(stock);periodicity(stock)
#change daily to weekly
stockWeek = to.weekly(stock)
tail(stockWeek)
price = stockWeek[,4] #select Close price
plot(price)

# Step 1: Observe Pattern
price.dec = decompose(ts(price,frequency = 7)) %>% plot()
library(tseries)
adf.test(price)