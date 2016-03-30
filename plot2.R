# Import Data from current directory
raw_data <- read.csv2("household_power_consumption.txt")

# Subsetting 2007/02/01 and 2007/02/02
data <- subset(raw_data, Date == '1/2/2007' | Date == '2/2/2007')

# Plotting
gap = as.numeric(levels(data$Global_active_power)[data$Global_active_power])
raw_date = (levels(data$Date)[data$Date]) 
raw_time = (levels(data$Time)[data$Time]) 
Time = strptime(paste(raw_date, raw_time, sep=" "), format = '%d/%m/%Y %H:%M:%S')
plot(Time, gap,  type = 'n', ylab='Global Active Power (kilowatts)', xlab='')
lines(Time, gap)

# Copy Back to window graphical device
dev.copy(png,'plot2.png',width = 480, height = 480)
dev.off()

