#Call plot3

png("plot3.png", height = 480, width = 480)

plot(PC$DateTime, PC$Sub_metering_1, type = "l", xaxt = "n", xlab = "day", ylab = "Energy sub metering", main = "Sub metering", col = "black")

lines(PC$DateTime, PC$Sub_metering_2, col = "red")

lines(PC$DateTime, PC$Sub_metering_3, col ="blue")

axis(side = 1, at = ticks, labels = labels)

legend("topright", col = c("black", "red", "blue"), lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()