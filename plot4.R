
## Loading the data set from the processing step.
source("processing.R")
df <- processing()

## Creating the PNG device to output the plot
png("plot4.png",480,480)

## Setting up the grid to display 4 plots.
par(mfrow=c(2,2))

## 1,1 - Making a line plot
plot(df$DateTime ,df$Global_active_power,
     main = "",
     xlab="",
     ylab = "Global Active Power",
     type = "l")

## 1,2 - Making a line plot
plot(df$DateTime ,df$Voltage,
     main = "",
     xlab="datetime",
     ylab = "Voltage",
     type = "l")

## 2,1 - Making 3 line plots
plot(df$DateTime ,df$Sub_metering_1,
     main = "",
     xlab="",
     ylab = "Energy sub metering",
     type = "l"
)
lines(df$DateTime ,df$Sub_metering_2, col="red")
lines(df$DateTime ,df$Sub_metering_3, col="blue")

legend(
  "topright",
  legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
  lty = 1,
  bty = "n",
  col=c("black","red","blue")
)

## 2,2 - Making a line plot
plot(df$DateTime ,df$Global_reactive_power,
     main = "",
     xlab="datetime",
     ylab = "Global_reactive_power",
     type = "l")
## Closing the device
dev.off()
