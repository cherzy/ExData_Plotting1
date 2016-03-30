# Import Data from current directory
raw_data <- read.csv2("household_power_consumption.txt")

# Subsetting 2007/02/01 and 2007/02/02
data <- subset(raw_data, Date == '1/2/2007' | Date == '2/2/2007')

# Plotting
sub1 = as.numeric(levels(data$Sub_metering_1)[data$Sub_metering_1])
sub2 = as.numeric(levels(data$Sub_metering_2)[data$Sub_metering_2])
sub3 = as.numeric(levels(data$Sub_metering_3)[data$Sub_metering_3])
raw_date = (levels(data$Date)[data$Date]) 
raw_time = (levels(data$Time)[data$Time]) 
Time = strptime(paste(raw_date, raw_time, sep=" "), format = '%d/%m/%Y %H:%M:%S')
plot(Time, sub1,  type = 'n', ylab='Energy sub metering', xlab='')
lines(Time, sub1)
lines(Time, sub2, col='red')
lines(Time, sub3, col='blue')
legend('topright', lty=c(1,1),lwd=c(1,1),col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))


# Copy Back to window graphical device
dev.copy(png,'plot3.png',width = 480, height = 480)
dev.off()