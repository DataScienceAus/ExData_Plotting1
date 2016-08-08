plotGraph <- function(){
  
  # Prepare data
  housedata <- read.table('../data/household_power_consumption.txt',sep=';',na.strings="?", header=TRUE)
  newdata <- housedata[housedata$Date=="01/02/2007" | housedata$Date=="2/2/2007",]
  
  # Combine date time columns
  newdata$datetime <- strptime(paste(newdata$Date,newdata$Time),"%d/%m/%Y %H:%M:%S")

  # Plot Data
  png("plot2.png")
  plot(newdata$datetime, newdata$Global_active_power, type="l", xaxt = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
  axis.POSIXct(1, as.POSIXct(newdata$datetime, origin="1970-01-01"))

  dev.off()
}

plotGraph()
