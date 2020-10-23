library(quantmod)
#Apple Inc. (AAPL) 

# Prepare Data ----------------
getSymbols("AAPL")
tail(AAPL)
#AAPL.Open AAPL.High AAPL.Low AAPL.Close AAPL.Volume AAPL.Adjusted
#2020-10-15    118.72    121.20   118.15     120.71   112559200        120.71

str(AAPL)
#Data: num [1:3477, 1:6] # has 3477 days

#------------
#Step1: set data into array format without date
A=coredata(AAPL[,"AAPL.Adjusted"]) ##used AAPL.Adjusted and not has time series, it use only index instead time
#Explain: linear model to use index 1,2,3 is simple more than using time

#Step2: Select first 100 Data of AAPL
A_start = 1
A_end = 100
hist = c(A_start:A_end) # or c(1:100)
A.hist = A[hist]
str(A.hist) #structure is num [1:100] 2.59 2.64 2.62 2.64 2.86 ...

#Step3: Fitting Linear Models
y=lm(A.hist ~ hist) #Fitting Linear Models
summary(y) #p-value: < 2.2e-16 means it is accepted

#Step 4: Predict
hist=c(1:105) #Predict 101 to 105
p=predict(y, newdata = data.frame(hist)) #get 105 data
#Time-Series Objects (ts)
p.ts = ts(p,start = 1)
A.ts = ts(A.hist,start = 1)
ts.plot(A.ts, p.ts, lty=c(1,2), col=c('black','red'))

#Step 5: Detrend by using difference
dd=diff(A.ts)
plot(dd)

#Step 6: Autoregression
library(fpp2)
fo=ar(dd)
pr=forecast(fo,h=8) #forecast 8 period, it will return object
bb=pr$mean #get mean after forecast
bb1=c(A.ts[length(A.ts)],bb)

for (x in 2:length(bb1)) {
  bb1[x] = bb1[x]+bb1[x-1]
}

bb1=ts(bb1, start = 100)
ts.plot(A.ts,bb1, col=c('black','red'))
