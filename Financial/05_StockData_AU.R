library(quantmod)
library(magrittr)
library(fpp2)
#After You (AU)

# 1.) Prepare Data ----------------
stock = getSymbols("AU.BK",auto.assign = FALSE)
str(stock)
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
lP = log(price)

dP = diff(price) 
dP[!is.na(dP)] %>% adf.test()
plot(diff(price))

dlP = diff(log(price))
dlP = dlP[!is.na(dlP)] 
dlP %>% adf.test()
plot(dlP) #or use this one

# 5.) ARIMA and report the optimal model, using all data except the last 3 quarters.
auto.arima(dlP)
pacf(dlP) #p=0
acf(dlP) #q=0,1

arima(lP,c(0,1,0)) #aic = -544.95
arima(lP,c(0,1,1)) #aic = -543.51 use this one

detP = lP
library(forecast)
fit=arima(detP,c(0,1,1))
summary(fit)
tsdisplay(fit$residuals)

nrow(detP) #all data
split = nrow(detP)-30 #split data
sprintf("Use %d - %d = %d data for testing",nrow(detP),split,nrow(detP)-split)

time(detP[split])
realreturn = xts(0,as.Date("2020-03-27" ,"%Y-%m-%d")) #point between trends and test
f.return = data.frame(Forecasted=numeric())


for(s in split:(nrow(detP)-1)){
  pr_train = detP[1:s,] #from start 1 to split s
  pr_test = detP[(s+1):nrow(detP),] #from >1167 to last data
  
  fit = arima(pr_train, order=c(1,1,1))
  arima.f = forecast(fit,h=1) #1 period
  
  Box.test(fit$residuals, lag=1, type = 'Ljung-Box')
  
  f.return = rbind(f.return, arima.f$mean[1])
  colnames(f.return) = c("Forecasted")
  return = detP[s+1,]
  realreturn = c(realreturn, xts(return))
  rm(return)
}

realreturn = realreturn[-1]
f.return = xts(f.return, index(realreturn))
plot(realreturn,type='l',main="Actual returns (black) vs Forecasted return(red)")
lines(f.return, lwd=2, col='red')
f.pr = exp(f.return) #expo for take log
head(f.pr)
plot(price)
lines(f.pr,col='red')

# 6.)finding error
real_pr = price[(split+1):length(price)]
acc = (real_pr - f.pr)/real_pr*100
acc #display error in back test

report = cbind(real_pr,f.pr, acc)
colnames(report) = c("AMZN.Real","AMZN.Forecasted","Percent_Error")