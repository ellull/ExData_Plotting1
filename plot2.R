# Get only the header and data from 2007-02-01 to 2007-02-02
pipe <- pipe("egrep '^(Date|[12]/2/2007)' ./data/household_power_consumption.txt")
dt <- read.table(pipe, header=TRUE, sep=";", na.strings="?")

# Convert the Date and Time variables to a datetime
dt <- transform(dt, DateTime=strptime(paste(as.character(Date), as.character(Time)), "%d/%m/%Y %H:%M:%S"))

# Create the plot
png("plot2.png", width=480, height=480)
plot(dt$DateTime, dt$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="n")
lines(dt$DateTime, dt$Global_active_power)
dev.off()
