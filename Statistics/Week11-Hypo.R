##Q1 (Lower Tail)
xbar = 9900
mu0 = 10000
sigma = 120
n = 30
alpha = 0.05
#Equation
#Step1
z = (xbar-mu0)/(sigma/sqrt(n))
z
#Step2: z
z.alpha = qnorm(1-alpha)   #หาฝั่งซ้าย lower tail
z.alpha   #Critical Value
#or use P-value
pval = pnorm(z)
pval
#Conclusion
# z < z.alpha     => -4.56 < -1.6
# p value < alpha => 2.5e-06 < 0.05
#reject H0


##Q2 (Lower Tail)
xbar = 2.1
mu0 = 2
sigma = 0.25
n = 35
alpha = 0.05
#Equation
#Step1
z = (xbar-mu0)/(sigma/sqrt(n))
z
#Step2: z
z.alpha = qnorm(1-alpha)   #หาฝั่งซ้าย lower tail
z.alpha   #Critical Value
#or use P-value
pval = pnorm(z,lower.tail = FALSE)
pval
#Conclusion
# z < z.alpha     => 2.366432 > -1.644854  reject H0


##Q3 (Upper Tail)
xbar = 2.1
mu0 = 2
sigma = 0.25
n = 35
alpha = 0.05
#Equation
#Step1
z = (xbar-mu0)/(sigma/sqrt(n))
z


##Q4 (Upper Tail)
xbar = 14.6
mu0 = 15.4
sigma = 2.5
n = 35
alpha = 0.05
#Equation
#Step1
z = (xbar-mu0)/(sigma/sqrt(n))
z
#step2
z.half.alpha = qnorm(1-alpha/2)  #2 tail
c(-z.half.alpha,z.half.alpha)
#or use p-value
pval = 2*pnorm(z)
pval


##Q5 (Unknown var)
xbar = 9900
mu0 = 10000
s= 125
n = 30
alpha = 0.05
#Equation
#Step1
t = (xbar-mu0)/(s/sqrt(n))
t
#Step2
t.alpha = qt(1-alpha,df=n-1) #df is degree of freedom
-t.alpha