#Population has 30 people
x <- c(1:30)
x
length(x)
#Sample
sample(x)
sample(x,replace = TRUE)
#Get 10 people
sample(x,10, replace = TRUE)

#Data
data = read.csv("https://raw.githubusercontent.com/safesit23/R-language/master/SampleData/EventSpeakers.csv")
View(data)

#Simple Random Sampling
sample(data$Rating)
sample(data$Rating, replace = TRUE)
sample(data$Rating, 5, replace = TRUE)

#download library
library(MASS)
View(survey)
heigh.survey = survey$Height
heigh.survey

#na.rm = กรองข้อมูลที่ missing เช่น N/A
mean(heigh.survey, na.rm = TRUE)
sd(heigh.survey, na.rm = TRUE)


