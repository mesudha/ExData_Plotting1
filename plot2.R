powerdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na = "?",colClasses = c("character","character",rep("numeric",7)))        
#We will only be using data from the dates 2007-02-01 and 2007-02-02.
datefilter <- (powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007")
plotdata <- powerdata[datefilter,]
# Create a variable to store date time data for time series plot
dateTime <- strptime(paste(plotdata$Date,plotdata$Time), "%d/%m/%Y %H:%M:%S")


# Set graphics device to png with height and width equal to 480
png(file="plot2.png", height = 480, width = 480)


#Plot the data 
plot(dateTime, plotdata$Global_active_power, type= "l", xlab="", ylab="Global Active Power (kilowatts)")

# close the graphics device
dev.off()
