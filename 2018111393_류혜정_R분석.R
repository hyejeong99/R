setwd("C:/R")
###############1
#1
install.packages("ggplot2");library(ggplot2);
midwest<-as.data.frame(ggplot2::midwest)
midwest
summary(midwest)
#2
install.packages("dplyr")
library(dplyr)
midwest<-rename(midwest,total=poptotal,asian=popasian)
head(midwest)
#3
midwest$rate<-(midwest$asian/midwest$total)*100
hist(midwest$rate)
#4
mean(midwest$rate)
midwest$grade<-ifelse(midwest$rate>mean(midwest$rate),"large","small")
head(midwest$grade)
#5
table(midwest$grade)
library(ggplot2)
qplot(midwest$grade)

##############2
#1
library(mpg)
displ_4<-mpg%>% filter(displ<=4)
displ_5<-mpg %>%filter(displ>5)
mean(displ_4$hwy);mean(displ_5$hwy)
#2
vehicle_a<-mpg %>% filter(manufacturer=="audi")
vehicle_t<-mpg %>% filter(manufacturer=="toyota")
mean(vehicle_a$cty);mean(vehicle_t$cty)
#3
total<-mpg %>% filter(manufacturer=="chevrolet"|manufacturer=="ford"|manufacturer=="honda")
mean(total$hwy)