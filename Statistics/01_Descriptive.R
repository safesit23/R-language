#set directory
hotelData = read.csv("https://raw.githubusercontent.com/safesit23/R-language/master/SampleData/Hotels.csv")
View(data)

#Descriptive Statistics
#1.Mean
mean(hotelData$RateperNight) #159.05

#2.Median
median(hotelData$RateperNight) #161

#3.Quantile
quantile(hotelData$RateperNight) 

#4.IQR
IQR(hotelData$RateperNight)

#5.quantile(data$RateperNight, c(.32, .57, .98)) 
quantile(data$RateperNight,c(0.75))

#6 var
sd(data$RateperNight)

#7 var
sd(data$RateperNight)

#8 range
range(data$RateperNight)
#or using
Range = max(data$RateperNight) - min(data$RateperNight)
Range

#Mode Function
#Step 1: Create Function
getmode <- function(v){ # cannot use mode() because it will get "numeric"
  uniquev <- unique(v)
  uniquev[which.max(tabulate(match(v,uniquev)))]
}
#Step 2: Find mode
getmode(hotelData$RateperNight)