data1 <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
subdata1 <- data1[data1$Date %in% c("1/2/2007", "2/2/2007"), ]

##convert the selected data to numeric type
globalActivePower <- as.numeric(subdata1$Global_active_power)
globalreactivepower <- as.numeric(subdata1$Global_reactive_power)
submeter1 <- as.numeric(subdata1$Sub_metering_1)
submeter2 <- as.numeric(subdata1$Sub_metering_2)
submeter3 <- as.numeric(subdata1$Sub_metering_3)
voltage <- as.numeric(subdata1$Voltage)
#convert date time type
datetime <- as.POSIXct(paste(subdata1$Date, subdata1$Time), format = 
                               "%d/%m/%Y %H:%M:%S")
png("plot4.png", width = 480, height = 480)
#set the graphical parameters
par(mfrow = c(2, 2))
#plot one by one
plot(datetime, globalActivePower, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
plot(datetime, voltage, type="l", xlab="Datetime", ylab="Voltage")
plot(datetime, submeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submeter2, type="l", col="red")
lines(datetime, submeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(datetime, globalreactivepower, type="l", xlab="Datetime", 
     ylab="Global_reactive_power")
dev.off()


