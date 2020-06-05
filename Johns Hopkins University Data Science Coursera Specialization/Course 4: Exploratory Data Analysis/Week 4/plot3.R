#######QUESTION 3###########
#Of the four types of sources indicated by the type(point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make 
#a plot answer this question.

#Initial project setup
library(dplyr)
library(RColorBrewer)
library(ggplot2)

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
pmtype <- NEI %>% filter(fips == "24510") %>%
    select(year, Emissions, type) %>%
    group_by(year, type) %>%
    summarise(Total = sum(Emissions))

#plotting total emissions by year in Baltimore City by pollutant source type
png(filename = "plot3.png")
plot <- ggplot(pmtype, aes(type, Total, group= year, color = factor(year)))
plot + geom_point(alpha = 3) +
    geom_line(size = 1) +
    labs(title = "Total PM2.5 Emissions From 1999 to 2008 in Baltimore City by Source") +
    labs(x = "Source of Pollution") +
    labs(y = "Total PM2.5 Emissions (in tons)") +
    scale_color_brewer(palette = "Set3")
dev.off()