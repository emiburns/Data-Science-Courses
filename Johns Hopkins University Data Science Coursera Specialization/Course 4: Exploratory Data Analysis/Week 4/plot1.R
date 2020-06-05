#######QUESTION 1###########
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from 
#all sources for each of the years 1999, 2002, 2005, and 2008.

#initial setup
library(dplyr)
library(RColorBrewer)

#loading zip file
if(!file.exists("./Data")) {dir.create("./Data")}
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(url, "./Data/FPMData.zip", method = "curl")
unzip("./Data/FPMData.zip", list = TRUE)

#reading in rds files
NEI <- readRDS("./Data/FPMData/summarySCC_PM25.rds") ##PM2.5 Emissions Data
SCC <- readRDS("./Data/FPMData/Source_Classification_Code.rds") ##Source Classification Code Table

#intial look at data
str(NEI)
str(SCC)

names(NEI)
names(SCC)

#subsetting data
pmtotal <- NEI %>% select(year, Emissions) %>%
    group_by(year) %>%
    summarise(Total = sum(Emissions))
head(pmtotal)

#plotting total emissions by year
png(filename = "plot1.png")
with(pmtotal, plot(year, Total),
     type = "o",
     main = "Total PM2.5 Emissions From 1999 to 2008",
     xlab = "Year",
     ylab = "Total PM2.5 Emissions (in tons)",
     col = brewer.pal(4, "Set3"),
     pch = 25,
     lwd = 5)
dev.off()







