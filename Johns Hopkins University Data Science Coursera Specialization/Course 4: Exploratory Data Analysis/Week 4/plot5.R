#######QUESTION 5###########
#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

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
pmcars <- NEI %>% filter(fips=="24510" & type=="ON-ROAD") %>%
    select(year, Emissions) %>%
    group_by(year) %>%
    summarise(Total = sum(Emissions))

#plotting total emissions from motor vehicle-related pollutant by year in Baltimore City
png(filename = "plot5.png")
plot5 <- ggplot(pmcars, aes(year, Total, fill = factor(year)))
plot5 + geom_bar(width = 3, stat="identity") +
    geom_text(aes(label = Total), vjust=-0.3, size=3) +
    labs(title = "Total PM2.5 Motor Vehicle-Related Emissions \n From 1999 to 2008 in Baltimore City") +
    labs(x = "Year") +
    labs(y = "Total PM2.5 Emissions (in tons)") +
    scale_color_brewer(palette = "Set3")
dev.off()