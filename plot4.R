# Read data
data<-read.table("household_power_consumption.txt", sep=";", header =TRUE,
								 colClasses=c('character', 'character', 'numeric', 'numeric',
								 						 'numeric', 'numeric','numeric', 'numeric',
								 						 'numeric'), na.strings='?')

# Subset data for Feb 1 and Feb 2
subdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Create datetime column
subdata$datetime <- strptime(paste(subdata$Date, subdata$Time), "%d/%m/%Y %H:%M:%S")

# Create png
png("plot4.png", height = 480, width = 480)

# Set locale to get the X-axis labels in English
originalLocale <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")

# Plot

# Grid
par(mfrow=c(2,2))

# First plot
plot(subdata$datetime, subdata$Global_active_power, xlab ="",
		 ylab = "Global Active Power", type ="l")

# Second plot
plot(subdata$datetime,subdata$Voltage, xlab ="datetime",
		 ylab = "Voltage", type ="l")

# Third plot
plot(subdata$datetime, subdata$Sub_metering_1, xlab ="",
		 ylab = "Energy sub metering", type ="l",col = 'black')
# Third plot: second line
lines(subdata$datetime, subdata$Sub_metering_2, col = "red")
# Third plot: third line
lines(subdata$datetime, subdata$Sub_metering_3, col = "blue")
# Third plot: legend
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
			 col=c('black','red','blue'), lty = 1, lwd = 3, bty = "n")

# Fourth plot:
plot(subdata$datetime, subdata$Global_reactive_power, xlab ="datetime",
		 ylab = "Global_reactive_power", type ="l")

# Restore locale
Sys.setlocale("LC_TIME", originalLocale)

# Close device
dev.off()
