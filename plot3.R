if(!require(data.table)){install.packages("data.table")}

##### we read and transform the data ##############
data <- fread("./household_power_consumption.txt")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
febData <- subset(data, Date == as.Date("01/02/2007", "%d/%m/%Y") | Date == as.Date("02/02/2007", "%d/%m/%Y"))
febData$Sub_metering_1 <- as.numeric(febData$Sub_metering_1)
febData$Sub_metering_2 <- as.numeric(febData$Sub_metering_2)
febData$Sub_metering_3 <- as.numeric(febData$Sub_metering_3)

###### we print the plot here and the, using lines, the other two plots over the first ################
plot(febData$Sub_metering_1, type = "l", ylab = "Energy sub metering", xaxt="n", xlab = "", col = "black")
lines(febData$Sub_metering_2, type = "l", ylab = "Energy sub metering", xaxt="n", xlab = "", col = "red")
lines(febData$Sub_metering_3, type = "l", ylab = "Energy sub metering", xaxt="n", xlab = "", col = "blue")
axis(1, at= c(1, length(febData$Sub_metering_1)/2, length(febData$Sub_metering_1)), labels = c("Thu", "Fri", "Sat"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5), col=c("black","red","blue"))

####### finally we create the png file  #######
dev.copy(png, "plot3.png")
dev.off()