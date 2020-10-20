## Managing Time ---------------------------
#Today
today = Sys.Date() #date
now = Sys.time() #dateandtime
#yesterday
yesterday = today-1
past = now - 3600

## Z's Ordered Observations ---------------------------

#Using dataframe to view in object-oriented
x <- data.frame('price' = c(100,99.3,100.2),'volume'=c(9.9,1.3,3.6))

#Date-time Conversion Functions
i <- as.POSIXct(c('20180101 120631', '20180223 085145', '20180501 182309'), format = "%Y%m%d %H%M%S")
i1 <- as.POSIXct(c('20180101', '20180223', '20180501'), format = "%Y%m%d")

# Finding time that has this volume by zoo func
require(zoo)
z=zoo(x, order.by = i) #or using x1=xts(x, order.by=i) **require(xts)
index(z)[which(z$volume %in% 3.6)] #search a value in an attribute and show the date.

require(xts)
dates <- seq(as.Date("2017-05-01"), length=1000, by="day") 
data  <- c(price = cumprod(1+rnorm(1000, mean = 0.001, sd = 0.01)))
x <- xts(x = data, order.by = dates) 
colnames(x) ='Price'

## XTS  ------------------------
require(xts)
tformat(x) <- "%Y/%m/%d"
periodicity(x) #check the periodicity of the data
x.ohlc <- to.period(x, period = 'quarters')
periodicity(x.ohlc) #observe the periodicity of this
