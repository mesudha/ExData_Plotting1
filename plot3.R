powerdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na = "?",colClasses = c("character","character",rep("numeric",7)))        
#We will only be using data from the dates 2007-02-01 and 2007-02-02.
datefilter <- (powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007")
plotdata <- powerdata[datefilter,]
# Create a variable to store date time data for time series plot
dateTime <- strptime(paste(plotdata$Date,plotdata$Time), "%d/%m/%Y %H:%M:%S")

# Set graphics device to png with height and width equal to 480
png(file="plot3.png", height = 480, width = 480)

#Plot the data Sub_metering_1 against datetime
plot(dateTime, plotdata$Sub_metering_1, type= "l", xlab="", ylab="Energy sub metering")
#Add line for Sub_metering_2 against datetime
lines(dateTime, plotdata$Sub_metering_2, col="red")
#Add line for Sub_metering_3 against datetime
lines(dateTime, plotdata$Sub_metering_3, col="blue")

#Add legend to graph
legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)

# close the graphics device
dev.off()
