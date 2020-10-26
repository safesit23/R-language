library(magrittr)
library(quantmod)
#Amazon.com, Inc. (AMZN) 

# Prepare Data ----------------
stock = getSymbols("AMZN", from="2016-01-01",auto.assign = FALSE)
stock = na.omit(stock) #not available omit for removing missing value
tail(AMZN)

price = stock[,4] #select AMZN.Close
head(price)
plot(price)

# Step 1: Observe Pattern
price.dec = decompose(ts(price,frequency = 365)) %>% plot() #365= yearly, 7=weekly

# Step 2: Detrends
log(price) %>% plot()
log.pr = log(price)
diff(price) %>% plot()
diff(log(price),lag=1) %>% plot()
dl.pr = diff(log(price),lag=1)

#Step 3: check stationary by using ADF
library(tseries)
adf.test(price)
adf.test(log(price))
adf.test(dl.pr) #Error in adf.test(dl.pr) : NAs in x
dl.pr = dl.pr[!is.na(dl.pr)] # remove NAs
adf.test(dl.pr) # Dickey-Fuller = -11.814, Lag order = 10, p-value = 0.01

#Step 4: Correlograms of ACF and PACF
par(mfrow=c(1,2)) #Set or Query Graphical Parameters for 2 Graphical
acf(dl.pr, main="ACF for diff log") #MA -> 1,2
pacf(dl.pr, main="PACF for diff log") #AR -> 1

#Step 5: Fitting the arima and forecast
det.pr = log.pr
library(forecast)
fit=arima(det.pr,c(1,1,1))
summary(fit)
tsdisplay(fit$residuals)

# Step 6: split data for back test
nrow(det.pr) #all data
split = floor(nrow(det.pr)*(2.9/3)) #split data
sprintf("Use %d - %d = %d data for testing",nrow(det.pr),split,nrow(det.pr)-split)

time(det.pr[split]) #"2020-08-26"
realreturn = xts(0,as.Date("2020-08-26" ,"%Y-%m-%d")) #point between trends and test
f.return = data.frame(Forecasted=numeric())

for(s in split:(nrow(det.pr)-1)){
  pr_train = det.pr[1:s,] #from start 1 to split s
  pr_test = det.pr[(s+1):nrow(det.pr),] #from >1167 to last data
  
  fit = arima(pr_train, order=c(1,1,1))
  arima.f = forecast(fit,h=1) #1 period
  
  Box.test(fit$residuals, lag=1, type = 'Ljung-Box')
  
  f.return = rbind(f.return, arima.f$mean[1])
  colnames(f.return) = c("Forecasted")
  return = det.pr[s+1,]
  realreturn = c(realreturn, xts(return))
  rm(return)
}

# Step 7: Visualization
realreturn = realreturn[-1]
f.return = xts(f.return, index(realreturn))
plot(realreturn,type='l',main="Actual returns (black) vs Forecasted return(red)")
lines(f.return, lwd=2, col='red')
# or 
f.pr = exp(f.return) #expo for take log
head(f.pr)
plot(price)
lines(f.pr,col='red')

# Step 8: finding error
real_pr = price[(split+1):length(price)]
acc = (real_pr - f.pr)/real_pr*100
acc #display error in back test

report = cbind(real_pr,f.pr, acc)
colnames(report) = c("AMZN.Real","AMZN.Forecasted","Percent_Error")

library(MLmetrics)
error = MSE(f.pr, real_pr)
tot_error = sum((real_pr-f.pr)^2) #total error
mse.m = tot_error/nrow(f.pr)
mse.m

#Total percent error (accuracy)
mean(abs(report$Percent_Error))
