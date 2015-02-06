# Read data
data<-read.table("household_power_consumption.txt", sep=";", header =TRUE,
								 colClasses=c('character', 'character', 'numeric', 'numeric',
								 						 'numeric', 'numeric','numeric', 'numeric',
								 						 'numeric'), na.strings='?')

# Subset data for Feb 1 and Feb 2
subdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Create png
png("plot1.png", height = 480, width = 480)

# Plot histogram
hist(subdata$Global_active_power, col="red", main="Global active power",
		 xlab ="Global Active Power (kilowatts)")

# Close device
dev.off()
