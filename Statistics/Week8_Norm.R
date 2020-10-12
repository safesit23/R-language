?rnorm
norm_samp <- rnorm(10)
?qqnorm
qqnorm(norm_samp)
abline(a=0,b=1,col='red')


getwd()
setwd("/Users/jatawatsafe/DEV/INT304_R")
png(file="rnorm.png")
dev.off()

#14
#a.)
qnorm(0.975,0,1,T)
#b.) to right (False)
qnorm(0.5-0.4750,0,1,F)
#c.)
qnorm(0.7291,0,1,T)
#d.) to right (set FALSE)
qnorm(0.1314,0,1,F)
#e.)
qnorm(0.67,0,1,T)
#f.)
qnorm(0.33,0,1,F)

#Problem 1: mean=12, sd=15.2, percentage of scoring 84
pnorm(84, 72, 15.2, lower.tail = FALSE)
# is 21.5%

pnorm(19,17.46,sqrt(375.67),lower.tail = FALSE)
# more than 19 is 46.83 %
pnorm(19,17.46,sqrt(375.67),lower.tail = TRUE)
# less than 19 is 53.17%

mtcars
head(mtcars)
#(x-mean)/s.d.
mean = mean(mtcars$mpg)
sd = sd(mtcars$mpg)
x1<-(mtcars$mpg-mean(mtcars$mpg))/sd(mtcars$mpg)
y1<-dnorm(mtcars$mpg,mean,sd)
plot(x1,y1)
getwd()
png(file="dnorm.png")
dev.off()
