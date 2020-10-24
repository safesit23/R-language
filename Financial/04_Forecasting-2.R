# Forecasting Part2: ARIMA (Auto-Regressive Integrated Moving Average) ------------------------------------
library(quantmod)
library(fpp2)

head(uschange)
str(uschange) #Time-Series [1:187, 1:5] from 1970 to 2016
periodicity(uschange) #1970 Q1 to 2016 Q3 

#Plot
autoplot(uschange[,"Consumption"]) +xlab("Year") + ylab("Quarterly percentage change")
#Conclusion: non-stationary

#ARIMA from Consumption -------------
fit <- auto.arima(uschange[,"Consumption"], seasonal=FALSE) #ARIMA(1,0,3) with non-zero mean 
summary(fit);
#or use Piping: auto.arima(uschange[,"Consumption"], seasonal=FALSE) %>% summary()

fit %>% forecast(h=10) %>% autoplot(include=80) # plot

fore=forecast(fit, h=10);summary(fore); #show forcasting 2016 Q4 to 2019 Q1

tail(residuals(fore)) #show error
