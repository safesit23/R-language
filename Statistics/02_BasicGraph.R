#Box plot
boxplot(hotelData$RateperNight, horizontal = TRUE, 
        main="Boxplot  of Hotels",
        xlab = "Rate per Night",         #xlab = x-label
        ylab = "City",
        col = "seagreen1" #col = color
)

#Histogram plot
hist(data$RateperNight,
     main="Histogram of Hotels room rate",
     xlab = "Rate per Night",         #xlab = x-label
     ylab = "City",
     col = "lightsalmon1" #col = color
)

#Scatter plot
scatter.smooth(data$RateperNight,
               main="Scatter of Hotels room rate",
               xlab = "Rate per Night",
               ylab = "City",
               col = "indianred1", #col = color
               pch = 8 #Point symbol
)

#install package
install.packages("MASS")
library(MASS)   #load library
View(painters)  #View Data

#Freq
school = painters$School
school.freq = table(school)
school.freq

cbind(school.freq)

#Colors
colors = c("orangered","orchid","palegreen","paleturquoise",
           "palevioletred1","peachpuff","salmon","royalblue1")

#Barplot
barplot(school.freq, main="Barplot",
        xlab="school",
        ylab="Frequency",
        col=colors)

#Piechart
pie(school.freq,main="Pie chart",col=colors)