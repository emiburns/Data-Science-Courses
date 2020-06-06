#######QUESTION 5###########
#Compare emissions from motor vehicle sources in Baltimore City with emissions
#from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

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
pmcomp <- NEI %>% filter((fips=="24510" | fips=="06037") & type=="ON-ROAD") %>%
    select(year, fips, Emissions) %>%
    group_by(fips, year) %>%
    summarise(Total = sum(Emissions))

#plotting total emissions from motor vehicle-related pollutant by year in Baltimore City
png(filename = "plot6.png")
plot6 <- ggplot(pmcomp, aes(year, Total, group=fips, fill = factor(fips)))
plot6 + geom_bar(width = 2, stat="identity") +
    geom_text(aes(label = Total), vjust=-0.3, size=3) +
    scale_fill_discrete(name ="City", labels = c("Los Angeles", "Baltimore City")) +
    labs(title = "Comparison of Total PM2.5 Motor Vehicle-Related Emissions \n in Baltimore City vs Los Angeles") +
    labs(x = "Year") +
    labs(y = "Total PM2.5 Emissions (in tons)") +
    scale_color_brewer(palette = "Set3")
dev.off()