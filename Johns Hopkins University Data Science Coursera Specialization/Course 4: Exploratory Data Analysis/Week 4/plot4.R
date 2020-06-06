#######QUESTION 4###########
#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

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
merged_df <- merge(NEI, SCC, by="SCC")
coal  <- grepl("coal", merged_df$Short.Name, ignore.case=TRUE)
clean_df <- merged_df[coal, ]

pmcoal <- clean_df %>% select(year, Emissions) %>%
    group_by(year) %>%
    summarise(Total = sum(Emissions))

#plotting total emissions from coal-related pollutant by year
png(filename = "plot4.png")
plot4 <- ggplot(pmcoal, aes(year, Total, fill = factor(year)))
plot4 + geom_bar(width = 3, stat="identity") +
    geom_text(aes(label = Total), vjust=-0.3, size=3) +
    labs(title = "Total PM2.5 Coal-Related Emissions From 1999 to 2008") +
    labs(x = "Year") +
    labs(y = "Total PM2.5 Emissions (in tons)") +
    scale_color_brewer(palette = "Set3")
dev.off()