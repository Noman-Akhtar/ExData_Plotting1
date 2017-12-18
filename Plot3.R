
## Download and unzip the dataset:
filename <- "zipped_dataset.zip"

if (!file.exists(filename)){
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileUrl, filename, method="libcurl")
}  
if (!file.exists("household_power_consumption.txt")) { 
        unzip(filename) 
}


## reading data file
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)


## Cleaning date and time
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
wkdays <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sm1 <- as.numeric(data$Sub_metering_1)
sm2 <- as.numeric(data$Sub_metering_2)
sm3 <- as.numeric(data$Sub_metering_3)

## plotting
png("plot3.png", width=480, height=480)
plot(wkdays, sm1, xlab="", ylab="Energy sub metering", type="l")
        lines(wkdays, sm2, col="red", type="l")
        lines(wkdays, sm3, col="blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))
dev.off()