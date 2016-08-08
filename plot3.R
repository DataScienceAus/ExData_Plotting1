plotGraph <- function(){
   
  # Prepare data
  housedata <- read.table('../data/household_power_consumption.txt',sep=';',na.strings="?", header=TRUE)
  newdata <- housedata[housedata$Date == "1/2/2007" | housedata$Date == "2/2/2007", ]
  
  # Combine date time columns
  newdata$datetime <- strptime(paste(newdata$Date,newdata$Time),"%d/%m/%Y %H:%M:%S")
  
  # Plot Data
  png("plot3.png")
  plot(newdata$datetime, newdata$Sub_metering_1, type="l", xaxt = "n", ylab = "Energy sub metering", xlab = "")
  lines(newdata$datetime, newdata$Sub_metering_2, col = "red")
  lines(newdata$datetime, newdata$Sub_metering_3, col = "blue")
  axis.POSIXct(1, as.POSIXct(newdata$datetime, origin="1970-01-01"))
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  dev.off()
}
 
plotGraph()