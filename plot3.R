## load the data into R
rawdata <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=2075259)

## convert the date and time column to one date/time class
rawdata$Date <- strptime(rawdata$Date, format="%d/%m/%Y")

rawdata$DateTime <- strptime(paste(rawdata$Date, rawdata$Time), "%Y-%m-%d %H:%M:%S")

## subset data to just feb 01 2007, feb 02, 2007
plotData <- subset(rawdata, rawdata$Date=="2007-02-01" | rawdata$Date=="2007-02-02", select=c(Sub_metering_1:DateTime))

## print the graph
png("plot3.png", width = 480, height=480)

plot(plotData$DateTime, plotData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")

lines(plotData$DateTime, plotData$Sub_metering_2, col='Red')

lines(plotData$DateTime, plotData$Sub_metering_3, col='Blue')

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
