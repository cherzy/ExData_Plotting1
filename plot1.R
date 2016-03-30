# Import Data from current directory
raw_data <- read.csv2("household_power_consumption.txt")

# Subsetting 2007/02/01 and 2007/02/02
data <- subset(raw_data, Date == '1/2/2007' | Date == '2/2/2007')

# Plotting
Gap = as.numeric(levels(data$Global_active_power)[data$Global_active_power])
hist(Gap, main = 'Global Active Power', col = 'red',  xlab='Global Active Power (kilowatts)')

# Copy Back to window graphical device
dev.copy(png,'plot1.png',width = 480, height = 480)
dev.off()

