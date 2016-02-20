powerdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na = "?",colClasses = c("character","character",rep("numeric",7)))        
#We will only be using data from the dates 2007-02-01 and 2007-02-02.
datefilter <- (powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007")
plotdata <- powerdata[datefilter,]


# Set graphics device to png with height and width equal to 480
png("plot1.png", height = 480, width = 480)

# plot histogram of global active power with x label and main title
hist(plotdata$Global_active_power, xlab = "Global Active power (kilowatts)", col = "red", main = "Global Active Power")

# close the graphics device
dev.off()
