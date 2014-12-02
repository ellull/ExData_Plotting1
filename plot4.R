# Get only the header and data from 2007-02-01 to 2007-02-02
pipe <- pipe("egrep '^(Date|[12]/2/2007)' ./data/household_power_consumption.txt")
dt <- read.table(pipe, header=TRUE, sep=";", na.strings="?")

# Convert the Date and Time variables to a datetime
dt <- transform(dt, DateTime=strptime(paste(as.character(Date), as.character(Time)), "%d/%m/%Y %H:%M:%S"))

# Create the plot
png("plot4.png", width=480, height=480)
par(mfrow=c(2, 2))

# Top left plot
plot(dt$DateTime, dt$Global_active_power, type="n", xlab="",
     ylab="Global Active Power")
lines(dt$DateTime, dt$Global_active_power)

# Top right plot
plot(dt$DateTime, dt$Voltage, type="n", xlab="datetime",
     ylab="Voltage")
lines(dt$DateTime, dt$Voltage)

# Bottom left plot
plot(dt$DateTime, dt$Sub_metering_1, type="n", xlab="",
     ylab="Energy sub metering")
lines(dt$DateTime, dt$Sub_metering_1, col="black")
lines(dt$DateTime, dt$Sub_metering_2, col="red")
lines(dt$DateTime, dt$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd=1, col=c("black", "red", "blue"), bty="n")

# Bottom right plot
plot(dt$DateTime, dt$Global_reactive_power, type="n", xlab="datetime",
     ylab="Global_reactive_power")
lines(dt$DateTime, dt$Global_reactive_power)

dev.off()
