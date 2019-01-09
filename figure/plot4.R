# Before running this file Make sure that the "household_power_consumption.txt" file is in the same directory where you will run this source code

# Read the data
dataToPlot <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

# Get the dates to be plotted
data1 <- subset(dataToPlot, Date %in% c("1/2/2007","2/2/2007"))

# Get the Date and Time
datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Get the active power value and convert as numeric 
g_ActivePower <- as.numeric(data1$Global_active_power)

# Get the voltage value and convert as numeric 
voltage <- as.numeric(data1$Voltage)

# Get the sub metering values and convert as numeric 
subM1 <- as.numeric(data1$Sub_metering_1)
subM2 <- as.numeric(data1$Sub_metering_2)
subM3 <- as.numeric(data1$Sub_metering_3)

# Get the reactive power value and convert as numeric 
g_ReactivePower <- as.numeric(data1$Global_reactive_power)

# Initialize the graphic file device to be used
png("plot4.png", width=480, height=480)

# Set 2 by 2 columns and rows
par(mfrow = c(2, 2)) 

# Create the graph top-left graph (1st graph)
plot(datetime, g_ActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# Create the graph top-right graph (2nd graph)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

# Create the graph bottom-left graph (3rd graph)
plot(datetime, subM1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subM2, type="l", col="red")
lines(datetime, subM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# Create the graph bottom-right graph (4th graph)
plot(datetime, g_ReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

# CLose the file service
dev.off()