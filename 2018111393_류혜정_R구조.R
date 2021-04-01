getwd();setwd("G:/R")

#1혼자서 해보기
install.packages("ggplot2")
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
class(mpg$drv)
mpg$drv
mpg$drv<-as.factor(mpg$drv)
levels(mpg$drv)
mpg$drv
mpg;View(mpg)

#2혼자서 해보기
df_midtrm<-data.frame(fruit=c("사과","딸기","수박"),
  price=c(1800,1500,3000),volume=c(24,38,13))
df_midtrm
mean(df_midtrm$price)
mean(df_midtrm$volume)

#3외부 데이터 가져와 데이터 프레임 만들
install.packages("readxl")
library(readxl)
df_exam<-read_excel("excel_exam.xlsx")
df_exam
mean(df_exam$english)
mean(df_exam$science)
df_exam_novar<-read_excel("excel_exam_novar.xlsx",col_names=F)
df_exam_novar
df_exam_sheet<-read_excel("excel_exam_novar.xlsx",sheet=3)
df_exam
df_csv_exam<-read.csv("csv_exam.csv");df_csv_exam
df<-data.frame(name=c("Min","Suki","Soon"),
  gender=c("Male","Female","Female"),
  age=c(20,20,30),
  stringsAsFactors = F)
df
class(df$name)
str(df)
df$gender<-as.factor(df$gender)
class(df$gender)
