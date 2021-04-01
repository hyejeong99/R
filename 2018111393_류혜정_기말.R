setwd("G:/r1")
install.packages("ggplot2")
library(ggplot2)
install.packages("dplyr")
library(dplyr)
#1######
y=2*x^2+5*x+10;x=10;y

#2-1
d<-1:100;d
#2-2
d %>% head(3)
#2-3
d[-c(10:90)]

#3
x<-c(10,20,30,40,50,100);x
mean(x);median(x);max(x);min(x)

#4-1
List<-data.frame(Items=c("Apple","Strawberry","Banana"),
                 Price=c(1000,1200,800));List
#4-2
mean(List$Price)
#4-3
List<-data.frame(Items=c("Apple","Strawberry","Banana"),
                 Price=c(1000,1200,800),
                 Sales=c(24,38,13));List
#4-4
List<-data.frame(Items=c("Apple","Strawberry","Banana"),
                 Price=c(1200,1200,800),
                 Sales=c(24,38,13));List
#4-5
List<-List %>% mutate(Grade=ifelse(List$Sales>=30,"A",
                                   ifelse(List$Sales>=20,"B","C")))
List

#5
install.packages("readxl");library(readxl)
ds<-read_excel("excel_exam.xlsx",col_names = F,sheet=3);ds

#6-1
DF<-read.csv("hflight.csv")
#6-2##
dim(DF)
#6-3
table(DF$Year);table(DF$Month)

#7-1
st<-as.data.frame(state.x77)
st
#7-2
summary(st)
#7-3####
st %>% filter(st$Area==54090)
#7-4
st %>%filter(st$Area==40975)  %>% select(Population,Income)
#7-5
filtering<-st %>% filter(Illiteracy>=2.0)
mean(filtering$Income)

#8-1
install.packages("DMwR")
algae<-as.data.frame(DMwR::algae)
aa<-data.frame(algae);aa
#8-2
table(is.na(aa$NH4))
#8-3
nomiss_NH4<-aa %>% filter(!is.na(aa$NH4))
table(is.na(nomiss_NH4$NH4))
mean(nomiss_NH4$NH4)

#9-1
vari<-DF %>% select(c( Month, DayOfWeek, DepTime, DepDelay))
vari
#9-2
vari$weekend<-ifelse(vari$DayOfWeek==6|vari$DayOfWeek==7,"weekend","weekday")
vari$weekend
#9-3
ggplot(data=vari,aes(x=vari$weekend))+geom_bar()
#9-4
#(1)
table(is.na(vari$DepTime))
nomiss<-vari %>% filter(!is.na(vari$DepTime))
table(is.na(nomiss$DepTime))
nomiss$DepTime
#(2)
nomiss$DepTime<-ifelse(nomiss$DepTime<800,"night",
                      ifelse(nomiss$DepTime>=800&nomiss$DepTime<1600,"day","evening"))
#(3)
ggplot(data=nomiss,aes(DepTime))+geom_bar()

#10
data(Cars93)
ggplot(data=Cars93,aes(x=Type,y=Price))+geom_boxplot()
