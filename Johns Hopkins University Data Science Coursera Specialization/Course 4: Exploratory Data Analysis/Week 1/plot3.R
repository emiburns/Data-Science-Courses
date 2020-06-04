library(lubridate)

#loading zip file
if(!file.exists("./Data")) {dir.create("./Data")}
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "./Data/EPData.zip", method = "curl")
unzip("./Data/EPData.zip", list = TRUE)

#reading in & cleaning data
df <- read.table("./Data/household_power_consumption.txt", sep=";", header = TRUE, na.strings="?")
clean_df <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]
clean_df$Date_time <- dmy_hms(apply(clean_df[,1:2], 1, paste, collapse=" "))

#plotting line graph
png("plot3.png", width=480, height=480)
with(clean_df, {plot(Sub_metering_1 ~ Date_time, 
                    type= "l", 
                    xlab= "", 
                    ylab= "Energy Submetering")
lines(Sub_metering_2 ~ Date_time, col = "red")
lines(Sub_metering_3 ~ Date_time, col = "blue")
})
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, lwd = 2.5)
dev.off()
