#Begin Plot2

#Recreation of representative plots 2 and 3 requires  the following x-axis modification

#Create custom ticks to express time points as days

ticks <- as.POSIXct(c("2007-02-01 00:00:00", "2007-02-02 00:00:00", "2007-02-03 00:00:00"), tz = "UTC")

#Create custom labels
labels <- c("Thurs", "Fri", "Sat")

# Call plot2

png("plot2.png", height = 480, width = 480)

plot(PC$DateTime, PC$Global_active_power, type = "l", xaxt = "n",  xlab = "day", ylab = "Global Active Power (in kilowatts)", main = "Power use by Minute")

axis(side = 1, at = ticks, labels = labels)

dev.off()    
