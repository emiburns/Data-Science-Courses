library(lubridate)

#loading zip file
if(!file.exists("./Data")) {dir.create("./Data")}
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "./Data/EPData.zip", method = "curl")
unzip("./Data/EPData.zip", list = TRUE)

#reading in & cleaning data
df <- read.table("./Data/household_power_consumption.txt", sep=";", header = TRUE)
clean_df <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]
clean_df$Date_time <- dmy_hms(apply(clean_df[,1:2], 1, paste, collapse=" "))

#plotting histogram
png("plot1.png", width = 480, height = 480)
hist(as.numeric(clean_df$Global_active_power), 
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()
