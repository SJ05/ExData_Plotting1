# Before running this file Make sure that the "household_power_consumption.txt" file is in the same directory where you will run this source code

# Read the data
dataToPlot <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

# Get the dates to be plotted
data1 <- subset(dataToPlot, Date %in% c("1/2/2007","2/2/2007"))

# Format the Date
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

# Initialize the graphic file device to be used
png("plot1.png", width=480, height=480)

# Create the graph
hist(data1$Global_active_power, col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

# CLose the file service
dev.off()