---
title: "Exploratory Data Analysis"
output: github_document
---



## Explorartory Data Analysis Plot Project

This exercise is designed to practice plotting in base R. Using an open source dataset obtained from UCI Machine Learning Repository.

The dataset details daily energy consumption metrics (such as magnitude and device allocation) from a single household at sampling rate of one minute across an approximately four year (2006-2010) time period, resultng in an initial 2075259 x 9 dataframe.

Where 2075259 rows representative of each 1 minute energy use is sampled across the 35 month recorded period, and 9 colums represent the following variables:


1) Date: Date in format dd/mm/yyyy

2) Time: time in format hh:mm:ss

3) Global_active_power: household global minute-averaged active power (in kilowatt)

4) Global_reactive_power: household global minute-averaged reactive power (in kilowatt)

5) Voltage: minute-averaged voltage (in volts)

6) Global_intensity: household global minute-averaged current intensity (in amperes)

7) Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).

8) Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.

9) Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

This assignment exclusively focuses on energy consumption data from two day time period from this dataset: February 1, 2007 to February 2, 2007.

 As such, a truncated 2880 x 9 dataframe representing the target 2 day time period was constructed.

 Where 2880 represents number of minutes in 2 days at a 1 minute sampling rate.

### Plot1
------

### Open png graphic device and set dimensions
```png("plot1.png", height = 480, width = 480)```

### Plot histogram of plot1
```hist(PC$Global_active_power, xlab = "Global Active Power (in kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red", breaks = 12)```

### Turn off device

```dev.off()```

![plot1](https://github.com/Bc5Neep/Exploratory-Data-Analysis-Coursera/blob/main/plot1.png) is the histogram answer to the question,

"What is the distribution of useful power consumed by this household across our 2 day observation period?"


Amplitude is energy in kilowatts on the x axis and frequency on the y axis represents minutes (out of 2880) sustained by each kilowatt range of output, where bar widths are representative of 12 0.5 kilowatt bins.



## Plot2

### Recreation of representative plots 2 and 3 requires  the following x-axis modification

### Create custom ticks to express time points as days

```ticks <- as.POSIXct(c("2007-02-01 00:00:00", "2007-02-02 00:00:00", "2007-02-03 00:00:00"), tz = "UTC")```

### Create custom labels

```labels <- c("Thurs", "Fri", "Sat")```

### Call plot2

```png("plot2.png", height = 480, width = 480)

plot(PC$DateTime, PC$Global_active_power, type = "l", xaxt = "n",  xlab = "day", ylab = "Global Active Power (in kilowatts)", main = "Power use by Minute")

axis(side = 1, at = ticks, labels = labels)

dev.off()
```


![plot2](https://github.com/Bc5Neep/Exploratory-Data-Analysis-Coursera/blob/main/plot2.png)

Where plot1 focuses on time spent at  each amplitude range, 
 plot2 is a more is a more granular representation of power use by minute across our 2 day observation period.


 ## Plot3

### Call plot3

```png("plot3.png", height = 480, width = 480)

plot(PC$DateTime, PC$Sub_metering_1, type = "l", xaxt = "n", xlab = "day", ylab = "Energy sub metering", main = "Sub metering", col = "black")

lines(PC$DateTime, PC$Sub_metering_2, col = "red")

lines(PC$DateTime, PC$Sub_metering_3, col ="blue")

axis(side = 1, at = ticks, labels = labels)

legend("topright", col = c("black", "red", "blue"), lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
```

![plot3](https://github.com/Bc5Neep/Exploratory-Data-Analysis-Coursera/blob/main/plot3.png)



 Plot3 is our submetering plot which allows us to visualize the distribution of energy use amongst kitchen (sub metering 1), laundry (sub metering 2), and heating/air conditioning appliances.
 
 ## Plot4

### Plot4 Pre-Plot: Assemble "Voltage" and "Global Reactive Power"

### Construct "Voltage" plot

```png("DateTimeVoltage.png", height = 480, width = 480)

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

png("plot4.png", height = 480, width = 480)

plot(PC$DateTime, PC$Global_active_power, type = "l", xaxt = "n",  xlab = "day", ylab = "Global Active Power (in kilowatts)", main = "Power use by Minute")
axis(side = 1, at = ticks, labels = labels)


plot(PC$DateTime, PC$Sub_metering_1, type = "l", xaxt = "n", xlab = "day", ylab = "sub metering", col = "black", main = "Sub Metering")
lines(PC$DateTime, PC$Sub_metering_2, col = "red")
lines(PC$DateTime, PC$Sub_metering_3, col = "blue")
axis(side = 1, at = ticks, labels = labels)

plot(PC$DateTime, PC$Voltage, type = "l", xaxt = "n", xlab = "datetime", ylab = "Voltage", main = "Voltage")
axis(side = 1, at = ticks, labels = labels)

plot(PC$DateTime, PC$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power", main = "Global Reactive Power")
axis(side = 1, at = ticks, labels = labels)

dev.off()
```


![plot4](https://github.com/Bc5Neep/Exploratory-Data-Analysis-Coursera/blob/main/plot4.png)

  Collecting line based plots 2 and 3 with 2 new plots characterising voltage and global reactive power per minute respectively, plot4 aptly summarizes key metrics of power consumption observed from this individual household from Midnight February 1 2007 to 11:59pm February 2, 2007.
  
  
  Author: Robert Sims
  
  

