plotGraph <- function(){
  
  # Prepare data
  housedata <- read.table('../data/household_power_consumption.txt',sep=';',na.strings="?", header=TRUE)
  newdata <- housedata[housedata$Date=="01/02/2007" | housedata$Date=="2/2/2007",]
  
  # Combine date time columns
  newdata$datetime <- strptime(paste(newdata$Date,newdata$Time),"%d/%m/%Y %H:%M:%S")
  
  # Plot Data
  png("plot4.png")
  par(mfrow = c(2,2))
  
  plot(newdata$datetime, newdata$Global_active_power, type="l", xaxt = "n", ylab = "Global Active Power", xlab = "")
  axis.POSIXct(1, as.POSIXct(newdata$datetime, origin="1970-01-01"))
  
  plot(newdata$datetime, newdata$Voltage, type="l", xaxt = "n", ylab = "Voltage", xlab = "datetime")
  axis.POSIXct(1, as.POSIXct(newdata$datetime, origin="1970-01-01"))
  
  plot(newdata$datetime, newdata$Sub_metering_1, type="l", xaxt = "n", ylab = "Energy sub metering", xlab = "")
  lines(newdata$datetime, newdata$Sub_metering_2, col = "red")
  lines(newdata$datetime, newdata$Sub_metering_3, col = "blue")
  axis.POSIXct(1, as.POSIXct(newdata$datetime, origin="1970-01-01"))
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
  
  plot(newdata$datetime, newdata$Global_reactive_power, type="l", xaxt = "n", ylab = "Global_reactive_power", xlab = "datetime")
  axis.POSIXct(1, as.POSIXct(newdata$datetime, origin="1970-01-01"))
  
  dev.off()

}

plotGraph()