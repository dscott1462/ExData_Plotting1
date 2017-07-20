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
png('plot1.png', width = 480, height = 480)

#Create Graph
hist(x = as.numeric(electricity$Global_active_power), 
      main="Global Active Power", col="red", xlab = "Global Active Power (kilowatts)")

#Close Printing
dev.off()