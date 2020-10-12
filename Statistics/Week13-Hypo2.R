#####Type II
#q1
n = 30
sigma = 120
sem = sigma/sqrt(n);sem    #SE

alpha=0.05
mu0 = 10000
q= qnorm(alpha,mean=mu0,sd=sem); q

mu = 9950
pnorm(q,mean = mu,sd=sem,lower.tail = FALSE)
#Ans 26.2 %

#q2 Upper Tail Test of Population Mean with Unknown Variance
n=30
s=125 #sd
mu0=10000
alpha=0.05
SE = s/sqrt(n)
q = mu0 +qt(alpha,df=n-1) * SE;q
mu = 9950
pt((q-mu)/SE,df=n-1,lower.tail=FALSE) #

##Population Mean Between Two Matched Sample
#q1
library(MASS)

t.test(immer$Y1,immer$Y2, paired = TRUE)
#ก่อนและหลัง


#q2
View(mtcars)
head(mtcars)
t.test(mpg~am,data = mtcars)

#q3 proportion
head(quine)
tableQ = table(quine$Eth,quine$Sex)
prop.test(tableQ,correct = FALSE)




