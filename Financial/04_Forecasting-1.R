# Forecasting Part1

## AR (Autoregression) ------------------------------------
#1 Detrend by Differencing
sh = read.csv("shampoo.csv")
plot(sh$Sales, type = "l", col="red")
val = sh$Sales
diff=c(NA,val[2:length(val)]- val[1:(length(val)-1)])
head(diff)
#[1]     NA -120.1   37.2  -63.8   61.0  -11.8 #the 1st instance become void.
new = data.frame(sh$Month[2:length(diff)],diff[2:length(diff)])
str(new) ; str(sh) # compare the size of the new and old dataframe.
colnames(new) = c('Month', 'Sales')
plot(sh$Sales, type = "l", col="red", ylim=c(-200,700))
lines(new$Sales)

#2 Detrend by Subtracting Trend Lines
ind = 1:length(sh$Sales) # to construct time stamps
Sale=sh$Sales
t1 = lm(Sale ~ ind)
forcast = predict(t1)
detrend = Sale - forcast
plot(sh$Sales, type = "l", col="red", ylim=c(-200,700))
lines(detrend, type='l')

## MA (Moving Average) ------------------------------------
#1
library(fpp2) #https://otexts.com/fpp2/
str(elecsales)
autoplot(elecsales) + xlab("Year") + ylab("GWh") + ggtitle("Annual electricity sales: South Australia")
S=elecsales #
a = ma(S, 5) #For m=5, k=2, e.g. S(t=3) = (sum(S[1:5])/5) = 2381.53 which is the moving average for S3
-------
#Manual calculation
a=c(NA,NA,rep(0,16), NA,NA)
for (i in 1:(length(S)-4)) {a[i+2]=sum(S[i:(i+4)])/5}
#------
b=ts(a,start=1989, end=2008)
ts.plot(S,b, col = c('black', 'red'))
