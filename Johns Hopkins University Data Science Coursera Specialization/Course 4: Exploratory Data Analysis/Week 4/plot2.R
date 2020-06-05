#######QUESTION 2###########
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
#from 1999 to 2008? Use the base plotting system to make a plot answering this question.

#Initial project setup
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
pmmaryland <- NEI %>% filter(fips == "24510") %>%
    select(year, Emissions) %>%
    group_by(year) %>%
    summarise(Total = sum(Emissions))

#plotting total emissions by year in Baltimore, Maryland
png(filename = "plot2.png")
with(pmmaryland, plot(year, Total,
                   type = "b",
                   main = "Total PM2.5 Emissions From 1999 to 2008 in Baltimore, Maryland",
                   xlab = "Year",
                   ylab = "Total PM2.5 Emissions (in tons)",
                   col = brewer.pal(5, "Set3"),
                   cex = 1.5,
                   pch = 16,
                   lwd = 3))
dev.off()
