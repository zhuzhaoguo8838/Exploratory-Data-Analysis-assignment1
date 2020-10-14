data1 <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
subdata1 <- data1[data1$Date %in% c("1/2/2007", "2/2/2007"), ]

##convert the selected data to numeric type
globalActivePower <- as.numeric(subdata1$Global_active_power)
##set the graphic device to png
png("plot1.png", width = 480, height = 480)
hist(globalActivePower, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off() #turn off the graphic device
