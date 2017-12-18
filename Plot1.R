
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


## subsettind data for the month of Feb
globalActive <- as.numeric(data$Global_active_power[data$Date %in% c("1/2/2007","2/2/2007")])


## opening device, plotting, and closing.
png("plot1.png", width=480, height=480)
hist(globalActive, xlab="Global Active Power (kilowatts)", main = "Global Active Power", col="red")
dev.off()