if(!require(data.table)){install.packages("data.table")}

##### we read and transform the data ##############
data <- fread("./household_power_consumption.txt")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
febData <- subset(data, Date == as.Date("01/02/2007", "%d/%m/%Y") | Date == as.Date("02/02/2007", "%d/%m/%Y"))
febData$Global_active_power <- as.numeric(febData$Global_active_power)

###### we print the plot here  ################
hist(febData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

####### finally we create the png file #######
dev.copy(png, "plot1.png")
dev.off()