# Before running this file Make sure that the "household_power_consumption.txt" file is in the same directory where you will run this source code

# Read the data
dataToPlot <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

# Get the dates to be plotted
data1 <- subset(dataToPlot, Date %in% c("1/2/2007","2/2/2007"))

# Get the Date and Time
datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Get the active power and sub metering values
globalActivePower <- as.numeric(data1$Global_active_power)
subM1 <- as.numeric(data1$Sub_metering_1)
subM2 <- as.numeric(data1$Sub_metering_2)
subM3 <- as.numeric(data1$Sub_metering_3)

# Initialize the graphic file device to be used
png("plot3.png", width=480, height=480)
plot(datetime, subM1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subM2, type="l", col="red")
lines(datetime, subM3, type="l", col="blue")

# Create the graph please note that in order to plot make the values numeric
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# CLose the file service
dev.off()