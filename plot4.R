# download and unzip data
> if(!file.exists('data')) dir.create('data')
> fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
> download.file(fileUrl, destfile = './data/household_power_consumption.zip')
> unzip('./data/household_power_consumption.zip', exdir = './data')

# read data into R
> files <- file('./data/household_power_consumption.txt')
> data <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

#---------------------------------------------------------------------------------------------
#plot4
> datetime <- paste(as.Date(data$Date), data$Time)
> data$Datetime <- as.POSIXct(datetime) 
> par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
> with(data, {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
}) 

# Saving as "plot4.png" into file
> dev.copy(png, file="plot4.png", height=480, width=480)
> dev.off()