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
png('plot2.png', width = 480, height = 480)

#Create Graph
plot(electricity$DateTime, electricity$Global_active_power, type="n", main="", 
      xlab = "", ylab = "Global Active Power (kilowatts)") 
lines(x= electricity$DateTime, y = electricity$Global_active_power)

#Close Printing
dev.off()