# download and unzip data
> if(!file.exists('data')) dir.create('data')
> fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
> download.file(fileUrl, destfile = './data/household_power_consumption.zip')
> unzip('./data/household_power_consumption.zip', exdir = './data')

# read data into R
> files <- file('./data/household_power_consumption.txt')
> data <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

#-----------------------------------------------------------------------------------------
# Plot1
> if(!file.exists('figures')) dir.create('figures')
> png(filename = './figures/plot1.png', width = 480, height = 480, units='px')
> with(data, hist(Global_active_power, xlab = 'Global Active Power (kilowatt)', main = 'Global Active Power', col = 'red'))
> hist(data$Global_active_power, main="Global Active Power", 
       xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Saving as "plot1.png" into file
> dev.copy(png, file="plot1.png", height=480, width=480)
> dev.off()