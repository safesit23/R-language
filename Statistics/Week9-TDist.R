dt(x=0,df=20)
#qt
#1.) 99th quantile() , df=20
qt(p = 0.99, df=20)

x_qt <- seq(0.1,by = 0.01)
y_qt <- qt(x_qt,df =3)
setwd("/Users/jatawatsafe/Desktop")
jpeg(file ="60130500009_qt.jpg")
plot(y_qt,type ="l",main ="Quantile Function of Student t Distribution")
dev.off()

x_dt <- seq(-10,10, by = 0.01)
y_dt <-dt(x_dt, df=3)
jpeg(file ="60130500009_dt.jpg")
plot(y_dt,type ="l",main ="Density of Student t Distibution")
dev.off()

x_pt <- seq(-10,10, by = 0.01)
y_pt <-pt(x_pt, df=3)
jpeg(file ="60130500009_pt.jpg")
plot(y_pt,type ="l",main ="Cumulative Distribution Function of Student t Distribution")
dev.off()

set.seed(91929)
N <- 10000
y_rt <- rt(N,df = 3)
y_rt
jpeg(file ="60130500009_rt.jpg")
hist(y_rt,breaks = 100)
dev.off()