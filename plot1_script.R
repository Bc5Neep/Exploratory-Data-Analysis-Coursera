#Load Data.table package

library(data.table)

#Import power consumption data file into Rstudio

power_consumption <- fread(file.choose("household_power_consumption.txt"))

#Begin extraction of relevant dates/time frame

power_consumption$Date <- as.Date(power_consumption$Date, format = "%d/%m/%Y")

start_date <- as.Date("01/02/2007", format = "%d/%m/%Y")
end_date   <- as.Date("02/02/2007", format = "%d/%m/%Y")

rowindex <- which(power_consumption$Date >= start_date & power_consumption$Date <= end_date)

print(rowindex)

time_range<- range(rowindex)

print(time_range)

# Data frame of relevant target time frame

PC <- power_consumption[66637:69516, 1:9]

#Transform "character" to "numeric" type objects

PC[,3:8] <- lapply(PC[,3:8], as.numeric)

#Create merged column of Date and time in readable format

PC$DateTime <- as.POSIXct(paste(PC$Date, PC$Time), format = "%Y-%m-%d %H:%M:%S", tz = "UTC")

#Open png graphic device and set dimensions
png("plot1.png", height = 480, width = 480)

#Plot histogram of plot1
hist(PC$Global_active_power, xlab = "Global Active Power (in kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red", breaks = 12)

#Turn off device
dev.off()

