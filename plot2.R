## Import and process the power data. Expect the data file in the data folder which is at the same level as the R file
pData <- read.csv(file=".\\data\\household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors =FALSE, na.strings="?")
head(pData)

## Cast the fields to the correct classes
z <- subset(pData, Date == "1/2/2007" | Date == "2/2/2007")
z$Global_active_power <- as.numeric(z$Global_active_power)
z$Voltage <- as.numeric(z$Voltage)
z$Sub_metering_1 <- as.numeric(z$Sub_metering_1)
z$Sub_metering_2 <- as.numeric(z$Sub_metering_2)
z$Sub_metering_3 <- as.numeric(z$Sub_metering_3)
## create a POSIXlt date time field to use as the X axis for Plots 2, 3, 4
z$datetime <- strptime(paste (z$Date, z$Time), "%d/%m/%Y %H:%M:%S")
z$Global_reactive_power <- as.numeric(z$Global_reactive_power)

## Plot 2
png("plot2.png")
plot(z$datetime, z$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()