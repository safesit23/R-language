library(quantmod)
#Bangkok Bank Public Company Limited (BBL.BK)
BBL=getSymbols("BBL.BK", source= 'yahoo', auto.assign = FALSE) # with no auto assign filename as the name of the stock.
str(BBL) # show structure of the dataset
head(BBL)
tail(BBL)

stock = na.omit(BBL)
price=stock[,4]
plot(price)
head(price)
price.dec = decompose(ts(price,frequency = 365))
plot(price.dec)