## load the data into R
rawdata <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=2075259)

## convert the date and time column to one date/time class
rawdata$Date <- strptime(rawdata$Date, format="%d/%m/%Y")

rawdata$DateTime <- strptime(paste(rawdata$Date, rawdata$Time), "%Y-%m-%d %H:%M:%S")

## subset data to just feb 01 2007, feb 02, 2007
plotData <- subset(rawdata, rawdata$Date=="2007-02-01" | rawdata$Date=="2007-02-02", select=c(DateTime, Global_active_power))

## print the graph
png("plot2.png", width = 480, height=480)

plot(plotData$Global_active_power, ylab="Global Active Power (kilowatts)", type="l", xlab="")

dev.off()
