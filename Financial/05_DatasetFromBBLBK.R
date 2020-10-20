library(quantmod)
my.ds=getSymbols("BBL.BK", source= 'yahoo', auto.assign = FALSE) # with no auto assign filename as the name of the stock.
str(my.ds) # show structure of the dataset
head(my.ds)
