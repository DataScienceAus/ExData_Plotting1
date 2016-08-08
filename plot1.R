plotGraph <- function(){
    
    # Prepare data
    housedata <- read.table('../data/household_power_consumption.txt',sep=';',na.strings="?", header=TRUE)
    newdata <- housedata[housedata$Date=="01/02/2007" | housedata$Date=="2/2/2007",]
    
    # Plot data
    png(file='plot1.png', width=480, height=480)
    hist(newdata$Global_active_power,xlab="Global Active Power (kilowatts)", main="Global Active Power",c="red")
    dev.off()
  }

plotGraph()