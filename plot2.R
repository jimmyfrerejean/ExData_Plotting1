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
png("plot2.png", height = 480, width = 480)

# Set locale to get the X-axis labels in English
originalLocale <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")

# Plot
plot(subdata$datetime, subdata$Global_active_power, xlab ="",
		 ylab = "Global Active Power (kilowatts)", type ="l")

# Restore locale
Sys.setlocale("LC_TIME", originalLocale)

# Close device
dev.off()
