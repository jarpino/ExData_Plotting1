## load the data into R
rawdata <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=2075259)

## convert the date to date/time class
rawdata$Date <- strptime(rawdata$Date, format="%d/%m/%Y")

## subset data to just feb 01 2007, feb 02, 2007
plotData <- subset(rawdata, rawdata$Date=="2007-02-01" | rawdata$Date=="2007-02-02", select=c(Global_active_power))

## print frequency graph
png("plot1.png", width = 480, height=480)

hist(plotData$Global_active_power, col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
