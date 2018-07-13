# download and unzip data
> if(!file.exists('data')) dir.create('data')
> fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
> download.file(fileUrl, destfile = './data/household_power_consumption.zip')
> unzip('./data/household_power_consumption.zip', exdir = './data')

# read data into R
> files <- file('./data/household_power_consumption.txt')
> data <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

#------------------------------------------------------------------------------------------
# Plot2 

> datetime <- paste(as.Date(data$Date), data$Time)
> data$Datetime <- as.POSIXct(datetime) 
> plot(data$Global_active_power~data$Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")

# Saving as "plot2.png" into file
> dev.copy(png, file="plot2.png", height=480, width=480)
> dev.off()