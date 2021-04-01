###########missing value####################
#Q1
library(dplyr)
mpg<-as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212),"hwy"]<-NA;mpg
table(is.na(mpg$drv));table(is.na(mpg$hwy))
#Q2
warn<-mpg %>% filter(!is.na(hwy));warn
summary_hwy<-mpg %>% group_by(drv)%>% summarise(mean_hwy=mean(hwy,na.rm=T));summary_hwy

############# Outlier##################
#Q1
library(dplyr)
install.packages("ggplot2")
library(ggplot2)
mpg<-as.data.frame(ggplot2:::mpg)
mpg[c(10,14,58,203),"drv"]<-"k"
mpg[c(29,43,129,203),"cty"]<-c(3,4,29,42)
table(mpg$drv)
mpg$drv<-ifelse(mpg$drv=="k",NA,mpg$drv);mpg
mpg %>% filter(!is.na(drv))
table(mpg$drv)
#Q2
boxplot(mpg$cty)$stats
mpg$cty<-ifelse(mpg$cty<9|mpg$cty>26,NA,mpg$cty)
table(is.na(mpg$cty))
mpg %>% filter(!is.na(cty))
boxplot(mpg$cty)
#Q3
mpg %>% 
  group_by(drv) %>% 
  summarise(mean_cty=mean(cty, na.rm=T))
