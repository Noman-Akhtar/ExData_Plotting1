
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
globalActive <- as.numeric(data$Global_active_power)

## plotting
png("plot2.png", width=480, height=480)
plot(wkdays, globalActive, xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()
