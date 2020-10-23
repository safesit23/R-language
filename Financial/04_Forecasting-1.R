# Forecasting:AR (Autoregression) ------------------------------------

# Prepare data
sh = read.csv("https://raw.githubusercontent.com/safesit23/R-language/master/SampleData/shampoo.csv")
head(sh)

# Decompose
sh.decompose = decompose(ts(sh$Sales,frequency = 12)) #freq season in 1 year
plot(sh.decompose)
# Conclusion: it has trends

#1 Detrend by Differencing ----------------
sh.diff = diff(sh$Sales)
plot(sh$Sales,type = "l", col="red", ylim = c(-200,700)) #original data
lines(sh.diff) #add black line of sh.diff

#2 Detrend by subtracting prediction ----------------
ind = 1:length(sh$Sales) #make array start 1 to length of sh$Sales
Sale = sh$Sales
t1 = lm(Sale ~ ind) #linear regression
predic = predict(t1)
plot(predic)
detrend = Sale - predic # Original - Predict
#Explain: when we subtract with trending, new data will no trends
plot(Sale,type = "l", col="red", ylim = c(-200,700))
lines(detrend, type='l')


# MA (Moving Average) ------------------------------------
#Prepare Data: Electronic Sales
library(fpp2) #https://otexts.com/fpp2/
S=elecsales
str(S) # Data is Time-Series
periodicity(S) # Yearly periodicity from 1989-01-01 to 2008-01-01 

#Plot all data
autoplot(elecsales) + xlab("Year") + ylab("GWh") + ggtitle("Annual electricity sales: South Australia")

#Plot with MA
a = ma(S, 5) #For m=5, k=2, e.g. S(t=3) = (sum(S[1:5])/5) = 2381.53 which is the moving average for S3
#or using Manual calculation
#a=c(NA,NA,rep(0,16), NA,NA)
#for (i in 1:(length(S)-4)) {a[i+2]=sum(S[i:(i+4)])/5}
b=ts(a,start=1989, end=2008)
ts.plot(S,b, col = c('black', 'red'))

par(mfrow=c(2,2))
for (m in c(3,5,7,9)) {
  a = ma(S,m)
  b = ts(a,start=1989,end=2008)
  ts.plot(S,b,col=c('black', 'red'),
          main=paste("MA of ",m,"period averaging"))
}


