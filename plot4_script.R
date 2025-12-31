#Plot4 Pre-Plot: Assemble "Voltage" and "Global Reactive Power"

#Construct "Voltage" plot

png("DateTimeVoltage.png", height = 480, width = 480)

plot(PC$DateTime, PC$Voltage, type = "l", xaxt = "n", xlab = "datetime", ylab = "Voltage", col = "black", main = "Voltage")

axis(side = 1, at = ticks, labels = labels)

dev.off()

#Construct "Global Reactive Power" plot

png("DateTimeGlobalReactivePower.png", height = 480, width = 480)

plot(PC$DateTime, PC$Global_reactive_power, type = "l", xaxt = "n", xlab = "datetime", ylab = "Global_reactive_power", main = "Global Reactive Power")

axis(side = 1, at = ticks, labels = labels)

dev.off()

#Assemble Plot4 from "plot2", "plot3", "Voltage", and "Global Reactive Power" 

par(mfcol = c(2,2))

plot(PC$DateTime, PC$Global_active_power, type = "l", xaxt = "n",  xlab = "day", ylab = "Global Active Power (in kilowatts)", main = "Power use by Minute")
axis(side = 1, at = ticks, labels = labels)


plot(PC$DateTime, PC$Sub_metering_1, type = "l", xaxt = "n", xlab = "day", ylab = "sub metering", col = "black", main = "Sub Metering")
lines(PC$DateTime, PC$Sub_metering_2, col = "red")
lines(PC$DateTime, PC$Sub_metering_3, col = "blue")
axis(side = 1, at = ticks, labels = labels)

plot(PC$DateTime, PC$Voltage, type = "l", xaxt = "n", xlab = "datetime", ylab = "Voltage", main = "Voltage")

plot(PC$DateTime, PC$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power", main = "Global Reactive Power")

dev.off()



