
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

## cleaning dates and time
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
wkdays <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sm1 <- as.numeric(data$Sub_metering_1)
sm2 <- as.numeric(data$Sub_metering_2)
sm3 <- as.numeric(data$Sub_metering_3)
globalActive <- as.numeric(data$Global_active_power)
globalReactive <- as.numeric(data$Global_reactive_power)
volts <- as.numeric(data$Voltage)


## plotting
png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))

plot(wkdays, globalActive, xlab="", ylab="Global Active Power", type="l")

plot(wkdays, volts, xlab="datetime", ylab="Voltage", type="l")

plot(wkdays, sm1, xlab="", ylab="Energy sub metering", type="l")
lines(wkdays, sm2, col="red", type="l")
lines(wkdays, sm3, col="blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"), bty="n")

plot(wkdays, globalReactive, xlab="datetime", ylab="Global_reactive_power", type="l")

dev.off()