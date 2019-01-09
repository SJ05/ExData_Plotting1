# Before running this file Make sure that the "household_power_consumption.txt" file is in the same directory where you will run this source code

# Read the data
dataToPlot <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

# Get the dates to be plotted
data1 <- subset(dataToPlot, Date %in% c("1/2/2007","2/2/2007"))

# Format the Date and Time
datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Initialize the graphic file device to be used
png("plot2.png", width=480, height=480)

# Create the graph please note that in order to plot make the values numeric
plot(datetime, as.numeric(data1$Global_active_power), type="l", xlab= "", ylab="Global Active Power (kilowatts)")

# CLose the file service
dev.off()