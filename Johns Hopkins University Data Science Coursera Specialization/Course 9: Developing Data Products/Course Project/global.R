#packages for app source code
library(shiny)
library(RColorBrewer)
library(plotly)
library(tidyr)

#CSV from Our World in Data's Happiness and Life Satisfaction page (accessed 08/20/2020)
#https://ourworldindata.org/happiness-and-life-satisfaction
hap <- read.csv("happiness.csv")
wifi <- read.csv("internet.csv")
edu <- read.csv("edu.csv")
female <- read.csv("female_ratio.csv")
fertility <- read.csv("fertility.csv")

dat1 <- merge(hap, wifi)
dat2 <- merge(dat1, edu)
dat3 <- merge(dat2, female)
data <- merge(dat3, fertility)
data$Entity <- as.character(data$Entity)

#data for histogram
data_hist <- read.csv('hist.csv')