if(!require(data.table)){install.packages("data.table")}

data <- fread("./household_power_consumption.txt")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
febData <- subset(data, Date == as.Date("01/02/2007", "%d/%m/%Y") | Date == as.Date("02/02/2007", "%d/%m/%Y"))

par(mfrow=c(2,2))
par(mai=c(0.7,0.7,0.7,0.1))
par(oma = c(0,0, 0, 0))

plot(febData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xaxt="n", xlab = "")
axis(1, at= c(1, length(febData$Global_active_power)/2, length(febData$Global_active_power)), labels = c("Thu", "Fri", "Sat"))

plot(febData$Voltage, type = "l", ylab = "Voltage", xaxt="n", xlab = "datetime")
axis(1, at= c(1, length(febData$Voltage)/2, length(febData$Voltage)), labels = c("Thu", "Fri", "Sat"))

plot(febData$Sub_metering_1, type = "l", ylab = "Energy sub metering", xaxt="n", xlab = "", col = "black")
lines(febData$Sub_metering_2, type = "l", ylab = "Energy sub metering", xaxt="n", xlab = "", col = "red")
lines(febData$Sub_metering_3, type = "l", ylab = "Energy sub metering", xaxt="n", xlab = "", col = "blue")
axis(1, at= c(1, length(febData$Sub_metering_1)/2, length(febData$Sub_metering_1)), labels = c("Thu", "Fri", "Sat"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5), col=c("black","red","blue"), cex=0.8, bty="n")

plot(febData$Global_reactive_power, type = "l", ylab = "Global Reactive Power", xaxt="n", xlab = "datetime")
axis(1, at= c(1, length(febData$Global_reactive_power)/2, length(febData$Global_reactive_power)), labels = c("Thu", "Fri", "Sat"))

dev.copy(png, "plot4.png")
dev.off()