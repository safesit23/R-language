#Binom Distribution

#Type 1: Pbinom (True)

# Q1) มีโจทย์ 12 ข้อแต่ละข้อมี 5 choices ต้องการถูก 4 ข้อ [สะสม]
pbinom(4,size=12,prob=0.2)
#Ans = 92.7 %

#Type 2: Dbinom (False)

# Q2) โยนเหรียญ 5 ครั้ง
dbinom(2,size=5,prob=0.1)

# Q3)
dbinom(0,size = 200, prob = 0.02)

# No.29 Page 216) In a sample of 10 workers, what is the prob that exatly 3 workers
dbinom(3,10,0.3)

# No.34 in Book


#-----------------------------------------------------
#Poisson Distribution
#upper trail = มากกว่าเท่ากับ
#lower trail = 

# Q1) รถ 12 คัน
ppois(16,12,lower=FALSE)
# No.42 in book)
#a
ppois(0,7)
ppois(1,7)
#b
1-ppois(1,7)

#-----------------------------------------------------
#Exponential

pexp(2,rate=1/3)




#-------------Myself---------------------
#BE-Ch.5 Question 42 (Poisson)
#a
ppois(0,7,TRUE)
#b
1-ppois(1,7,TRUE)
#d
1-ppois(4,7,TRUE)

#try
ppois(5,7,FALSE)
ppois(5,7,TRUE)



