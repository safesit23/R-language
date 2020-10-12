score<-c(182,168,184,190,170,174)
range(score)
Range = max(score) - min(score)
Range

setnum <-c(1,2,2,3,4,2,1,4,5)

getmode <- function(v){
  uniquev <- unique(v)
  uniquev[which.max(tabulate(match(v,uniquev)))]
}
getmode(setnum)

mean(faithful$waiting)
View(faithful)

View(dat)
hist(dat$Sepal.Length,
     main = "Histogram of Sepal Length",xlab = "length")
levels(dat$Species)
#add abline โดยเส้นอยู่ที่ mean, col คือ color
abline(v=mean(dat$Sepal.Length),lwd=2,col=2)
legend("topright",legend = "Mean",col="red",lwd=2)


plot(dat$Petal.Length,dat$Petal.Width,main="Plot between petal length and petal width",
     xlab = "Petal Length (mm)",
     ylab = "Petal Width (mm)",pch=6,col = 1:3)
legend("topleft",legend = levels(dat$Species),col = 1:3, pch = 6,title = "Species")


View(faithful)
faithful$waiting

levels(faithful$waiting)

scatter.smooth(data$RateperNight, main="Scatter of?",
               xlab="X", ylab="Y", col="green",  pch = 8 )

dat <- iris
View(dat)
levels(dat$Species)
plot(dat$Petal.Length,dat$Petal.Width,main="Plot between petal length and petal width",
     xlab = "Petal Length (mm)",
     ylab = "Petal Width (mm)",pch=6,col = 1:3)
legend("topleft",legend = levels(dat$Species),col = 1:3, pch = 6,title = "Species")


ggplot(iris, aes(x=Petal.Length,y=Petal.Width,color=Species))+
  geom_point()+
  ggtitle('Iris Species by Petal Length and Width')

