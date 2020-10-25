# Forecasting Part3: Example ARIMA  ------------------------------------
library(quantmod)
library(fpp2)
P= AirPassengers #Data in R
P #view data
str(P)
periodicity(P)

#Plot graph----------
plot(P)
timeOfP = time(P)
reg = lm(P ~ timeOfP)
abline(reg,col='red')

#Predict----------
f = predict(reg,newdata=data.frame(
  timeOfP=c(1961.000, 1961.083, 1961.167, 1961.250, 1961.333,
        1961.417, 1967.500, 1961.583, 1961.667, 1961.750,
        1961.833, 1961.917)
  ))
f1 = ts(f,frequency = 12,start=1961)
ts.plot(P, f1, lty=c(1,3), col=c('black','red'))

# ARIMA -----------
#Step 1 change to stationary 
#1.1 Using diff
dP = diff(P)
plot(dP) #no trends + variance --> non-stationary
#1.2 Using log
lP = log(P)
plot(lP)  #trends --> non-stationary 
#1.3 Using diff and log
dlP = diff(log(P))
plot(dlP) #stationary it can use !

# Step 2 check stationary by using DFT or ADFT (Augmented Dickey-Fuller Test)
library(tseries)
#seasonal=12
adf.test(P, k=12) #test with P
adf.test(dP, k=12) #test with dP
adf.test(lP, k=12) #test with lP
adf.test(dlP, k=12) #test with dlP

# Step 3 set p,d,q by manual (Using adf, pacf)
?acf
acf(P)
acf(dP)
acf(dlP) 
pacf(P)
pacf(dlP)

# Step 4 ARIMA model
# use lp (log only) because it will diff in arima() 
#p = 0 / diff / q = 1 or 2
arima(lP,c(0,1,1)) #aic = -238.73 <--best model
arima(lP,c(0,1,2)) #aic = -240.85
#p = 1 / diff / q = 1 or 2
arima(lP,c(1,1,1)) #aic = -242.63
arima(lP,c(1,1,2)) #aic = -248.86

# Step 5 Predict and Visualization
#select 0,1,1
fit = arima(lP,c(0,1,1))
pred = predict(fit,n.ahead=10*12) #predict 10 year (120 months)
ts.plot(P,exp(pred$pred),lty=c(1,3),col=c('black','red'))
#Output is using mean to predict. 

#we need to add season and predict again
fit = arima(lP,c(0,1,1),seasonal = list(order=c(0,1,1),period=12))
pred = predict(fit,n.ahead=10*12)
ts.plot(P,exp(pred$pred),lty=c(1,3),col=c('black','red'))

# display error
tsdisplay(fit$residuals)
Box.test(fit$residuals,lag=20,type='Ljung-Box')

# Alternative Step 4-5:using AUTO ARIMA
auto.arima(lP)

