setwd("~/Documents/Biocomp/Biocomp-Fall2018-181026-Exercise8/")
rm(list=ls())

install.packages("reshape")
install.packages("ggplot2")
library(reshape) #Need for restructuring data into two columns by team
library(ggplot2) #Need for generating good plots

Score<-read.table("UWvMSU_1-22-13.txt",header = TRUE) #Upload data frame
SumScore<-cast(Score,time~team, fun.aggregate = sum) #Restructure to have the scores by each team at each time
SumScore$cumMSU=cumsum(SumScore$MSU) #Create new column with cumulative sum; MSU
SumScore$cumUW=cumsum(SumScore$UW) #Create new column with cumulative sum; UW

PlotScore<-data.frame(Time=numeric(),MSU=numeric(),UW=numeric()) #Create blank data frame with just three columns
PlotScore[2:45,]<-SumScore[,c(1,4,5)] #Fill blank data frame with just the time and cumSums for both teams
PlotScore[1,]=0 #Make the first point in this data frame equal to time 0 when both teams have 0 points

ggplot(PlotScore)+ #Define where the data is coming from for ggplot
  geom_line(aes(x=Time, y=MSU), color="dark green")+ #Define which column to use for x and y axes and what color to make MSU's line
  geom_line(aes(x=Time, y=UW), color="red")+#Define which column to use for x and y axes and what color to make UW's line
  xlab(label="Time (min)")+ #Label x axis
  ylab(label="Score") #Label y axis






