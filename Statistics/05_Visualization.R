#Chapter 5: Visualization
#Installation Package
library('ggplot2')
install.packages("hexbin")

# Prepare Data
dat <- iris
View(faithful)
View(dat)

# Histogram ------------------------------------------------------
hist(dat$Sepal.Length,
     main = "Histogram of Sepal Length",xlab = "length")
levels(dat$Species)
#add abline โดยเส้นอยู่ที่ mean, col คือ color
abline(v=mean(dat$Sepal.Length),lwd=2,col=2)
legend("topright",legend = "Mean",col="red",lwd=2)

# Histogram ------------------------------------------------------
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

#
View(iris)
head(iris)
#Histogram
hist()
#Line
abline()

#Graph 01: Histogram of Sepal Length
dat <- iris
hist(dat$Sepal.Length,main = "Histogram of Sepal Length",xlab = "Length of sepal (mm)")
#?????????????????????????????? Species
levels(dat$Species)
#add abline
abline(v=mean(dat$Sepal.Length),lwd=2,col=2)
legend("topright",legend = "Mean",col="red",lwd=2)

#Graph 02: Relationship
plot(dat$Petal.Length,dat$Petal.Width,main="Plot between petal length and petal width",
     xlab = "Petal Length (mm)",
     ylab = "Petal Width (mm)",pch=6,col = 1:3)
legend("topleft",legend = levels(dat$Species),col = 1:3, pch = 6,title = "Species")


#Graph03: GGPlot (Petal)
ggplot(iris, aes(x=Petal.Length,y=Petal.Width,colour=Species))+
  geom_point()+
  ggtitle('Iris Species by Petal Length and Width')

#Graph04: GGPlot (Sapal)
ggplot(iris, aes(x=Sepal.Length,y=Sepal.Width,colour=Species))+
  geom_point()+
  ggtitle('Iris Species by Sepal Length and Width')


#Graph05: 
ggplot(data=iris, aes(x=Petal.Length,y=Petal.Width))+
  xlab("Petal Length")+
  ylab("Petal Width")+
  geom_point(aes(color=Species,shape=Species))+
  geom_smooth(method='lm')+
  ggtitle('Petal Length xs Width')

#Graph06: Histogram (Length)
ggplot(iris,aes(x=Petal.Length))+
  geom_histogram(color="black",aes(fill=Species))+
  xlab("Petal Length (cm)")+
  ylab("Frequency")+
  ggtitle("Frequency analysis with the Histogram of Petal Length")

#Graph07: Histogram (Width)
ggplot(iris,aes(x=Petal.Width))+
  geom_histogram(color="black",aes(fill=Species))+
  xlab("Petal Length (cm)")+
  ylab("Frequency")+
  ggtitle("Frequency analysis with the Histogram of Petal Width")


#Density plot
#Graph08:
ggplot(iris,aes(x=Petal.Length, colour=Species, fill=Species))+
  geom_density(alpha=.5)+
  xlab("Petal Length (cm)")+
  ylab("Density")+
  ggtitle("Density plot of Petal Length")

#Graph09:
ggplot(iris,aes(x=Petal.Width, colour=Species, fill=Species))+
  geom_density(alpha=.2)+
  xlab("Petal Width (cm)")+
  ylab("Density")+
  ggtitle("Density plot of Petal Width")


#Boxplot
#Graph10
ggplot(iris,aes(Species, Petal.Length, fill=Species))+
  geom_boxplot()+
  labs(title="Iris Petal Length Box Plot", x="Species", y="Petal Length(cm)")

#Violin Plot
#Graph11
ggplot(iris,aes(Species, Petal.Length, fill=Species))+
  geom_violin(aes(color=Species))+
  ggtitle("Iris Petal Length Violin Plot")+
  geom_boxplot(width=0.2)

#Hexagonal binning
?stat_bin

#Graph12
ggplot(iris,(aes(x=Petal.Length, y=Petal.Width)))+
  stat_bin_hex(color="white")+
  scale_fill_gradient(low="yellow",high="red")+
  labs(x="Petal Length (cm)",y="Petal Width(cm)")+
  ggtitle("Hexagonal binning of Petal Length and Width")

#Contour Plot
#Graph13 Petal
ggplot(iris,aes(Petal.Length,Petal.Width,color=Species))+
  geom_point()+
  geom_density_2d(color="black")+
  labs(x="Petal Length (cm)",y="Petal Width (cm)",title = "Contour Plot of Petal Length and Width")

#Graph14 Sepal
ggplot(iris,aes(Sepal.Length,Sepal.Width,color=Species))+
  geom_point()+
  geom_density_2d(color="black")+
  labs(x="Sepal Length (cm)",y="Sepal Width (cm)",title = "Contour Plot of Sepal Length and Width")



