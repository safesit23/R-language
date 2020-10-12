#data
x <-c(36,26,12,40,24,18,30,30,14,34)
y <-c(54,30,28,48,36,30,38,46,16,42)
#Fitting
lm(y~x)
out<-lm(y~x)
summary(out)

#Plot
plot(x,y)
abline(v=15)
abline(h=30)
abline(lm(y~x))

plot(x,y)
abline(lm(y~x),col="red")

##question2
#data
x <-c(36,34,25,20.55,27.55,24.8,22.99)
y <-c(30.32,20.58,17.8,16.38,21.96,19.66,22.16)
#Fitting
?lm
out<-lm(y~x)
summary(out)
#2.2
#y = 5.2+(0.5*35)
ans = 5.2 + (0.5*35);ans

#question3
getwd()
setwd("/Users/jatawatsafe/DEV/INT304_R")
data <- read.csv("Height.csv")
head(data)
out<- lm(data = data, Height ~momheight+dadheight)
summary(out)
# y= 18.5 + 0.30351(momheight) + 0.38786(dadheight)

#Q from excel
price <-c(2800,2800,2700,3500,3300,2000,4000,3000,2500,3000)
score <-c(62,53,44,50,54,39,66,55,34,39)
out <- lm(score~price)
summary(out)
