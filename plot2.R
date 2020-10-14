data1 <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
subdata1 <- data1[data1$Date %in% c("1/2/2007", "2/2/2007"), ]

##convert the selected data to numeric type
globalActivePower <- as.numeric(subdata1$Global_active_power)
#convert date time type
datetime <- as.POSIXct(paste(subdata1$Date, subdata1$Time), format = 
                               "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", 
                        ylab="Global Active Power (kilowatts)")
dev.off()
        