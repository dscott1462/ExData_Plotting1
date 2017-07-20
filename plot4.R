#Read in the table
varTypes = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
electricity <- read.table("household_power_consumption.txt", header=TRUE,
                          sep = ";", colClasses = varTypes,na.strings = "?")

#Create a date time variable
electricity$DateTime <- strptime(paste(electricity$Date, electricity$Time, sep = ' ' ), format = "%d/%m/%Y %H:%M:%S")

#create a date variable
electricity$Date <- as.Date(electricity$DateTime)

#filter to the dates of interest
electricity <- electricity[electricity$Date == '2007-02-01' | electricity$Date == '2007-02-02',]

#Set up file to print
png('plot4.png', width = 480, height = 480)

#Create the grid
par(mfrow=c(2,2))

#Create Graph for Top Left
plot(electricity$DateTime, electricity$Global_active_power, type="n", main="", 
     xlab = "", ylab = "Global Active Power") 
lines(x= electricity$DateTime, y = electricity$Global_active_power)


#Create Graph for Top Right
plot(electricity$DateTime, electricity$Voltage, type="n", main="", 
     xlab = "datetime", ylab = "Voltage") 
lines(x= electricity$DateTime, y = electricity$Voltage)

#Create Graph for Bottom Left
plot(electricity$DateTime, electricity$Sub_metering_1, type="n", main="", 
     xlab = "", ylab = "Energy sub metering") 
lines(electricity$DateTime, electricity$Sub_metering_1)
lines(electricity$DateTime, electricity$Sub_metering_2, col="red")
lines(electricity$DateTime, electricity$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering1","Submetering_2","Submetering_3"), col=c("black","red","blue"),lty=1)

#Create Graph for Bottom Right
plot(electricity$DateTime, electricity$Global_reactive_power, type="n", main="", 
     xlab = "datetime", ylab = "Global_reactive_power") 
lines(x= electricity$DateTime, y = electricity$Global_reactive_power)

#Close Printing
dev.off()