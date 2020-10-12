x <- 1
x
y = 2
y
class(x)
b <- "statistic"
class(b)
a <- 1+9
a
#comment

d <- c(1,2,3,4,5,6,7,8,9,10)
d
mean(d)
d <- c(1,2,3,3,4,5,6,7,8,9,10)
d
mode(d)
class(d)
9%%2
9^2
3!=2
Book = "Book"
class(Book)
book = "book"
Book > book
"Book" >= "Book"
"A" < "B"
help("hist")
?hist
length(d)

#vector
x <-c (1,2)
x
x <-c(1:10)
x
length(x)
x[1]

y <-c(5:15)
y
y[3]

arr1 <-c(1:5)
arr2 <-c(6:10)
arrSum <- arr1 + arr2
arrSum
arr1+1
arr1

#Read file
getwd()
setwd("/Users/path")
Data = read.csv("EventSpeakers.csv")
Data
View(Data)
