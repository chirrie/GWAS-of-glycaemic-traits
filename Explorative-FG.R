#####vivien This is a script to perform exploarative analysis of FG-gene datammm
### Count total samples
setwd("/Users/vivienchebii/Documents/awi-new/FG_final-Nov/")
FG<-read.csv ("/Users/vivienchebii/Documents/awi-new/FG_final-Nov/FG_phenotype-12.csv")
total_samples <- nrow(FG)  
View(total_samples)
### Summary/descriptive statistics for bmi_c_qc 
summary(FG$bmi_c_qc, na.rm=TRUE)
sd(FG$bmi_c_qc, na.rm =TRUE)
range(FG$bmi_c_qc, na.rm = TRUE)
mean(FG$bmi_c_qc, na.rm = TRUE)
median(FG$bmi_c_qc)
quantile(FG$bmi_c_qc,probs=0.5)
####Summary for age
summary(FG$age)
range(FG$age)
mean(FG$age)
median(FG$age)
sd(FG$age, na.rm =TRUE)
quantile(FG$ageprobs=0.5)

#### Summary of FG concerntrations
summary(FG$glucose_qc, na.rm=TRUE)
sd(FG$glucose_qc,na.rm=TRUE)
range(FG$glucose_qc, na.rm=TRUE)
mean(FG$glucose_qc,na.rm=TRUE)
median(FG$glucose_qc, na.rm=TRUE)

### Count the total number of females and males and convert  to percentbmi_c_qc
table(FG$sex)
(percent_gender <- table(FG$sex)/total_samples * 100)
### Create a bar plot for males and females to get an idea of the distribution
(percent_gender <- table(FG$sex)/total_samples * 100)
table(percent_gender)
barplot(percent_gender,ylim=c(0,100), ylab="Percentage of individuals",xlab="Sex(0=F,1=M)", main="Barplot of gender ")
###Plots for BMI classiFGcations
percent_bmi_cat <- table(FG$bmi_cat_c_qc)/total_samples * 100
table (percent_bmi_cat)
barplot(percent_bmi_cat,ylim=c(0,100), ylab="Percentage of individuals",xlab="BMI_c(0=under,1=normal, 2=over, 3=obese)", main="Barplot of BMI Catagory")

####Diabetic status 
percent_diabetics <- table(FG$diabetes_status_c_qc)/total_samples * 100
table(percent_diabetics)
barplot(percent_diabetics,ylim=c(0,100), ylab="Percentage of individuals",xlab="Diabetics_status(0=Non diabetics,1=Diabetics)", main="Barplot of Diabetic Status (FG trait)")

### Calcualter skeweness of contionus data 
install.packages("moments")
install.packages("ggpubr")
library(moments)
library(ggpubr)
skewness(FG$glucose_qc, na.rm = TRUE)
###Logtransform and inverse transformation and  Density plots for continous variables
##Age 
install.packages("rcompanion")  ###for inverse normalization
install.packages("GDAdata")
library(rcompanion)
par(mfrow=c(1,2))

logtransform<-log10(FG$glucose_qc)
inverse_trans<-blom(FG$glucose_qc, method="blom", alpha=3/8, complete=TRUE)
par(mfrow=c(1,3))
plot(density(FG$glucose_qc, na.rm=TRUE, bw = 1), col = "black", main = "untransformed FG", ylim = c(0,0.4), xlab="FG(uIU/ml")
plot(density(logransform, na.rm=TRUE, bw = 1), col = "black", main = "log_transformed FG", ylim = c(0,0.4), xlab="FG")
plot(density(inverse_trans, na.rm=TRUE, bw = 1), col = "black", main = "inverse_normaltransformed FG", ylim = c(0,0.4), xlab="FG")
hist(FG$glucose_qc,col= 'grey', main = 'Distribution of FG',xlab = 'FG (mmol/l)', ylab='No of individuals', breaks= c(30))
hist(logtransform,col= 'grey', main = 'logtranformed-FG',xlab = 'FG (mmol/l)', ylab='No of individuals', breaks= c(30))
hist(inverse_trans,col= 'grey', main = 'inversetransformed-FG',xlab = 'FG (mmol/l)', ylab='No of individuals', breaks= c(30))

