
## Loading the data set from the processing step.
source("processing.R")
df <- processing()

## Creating the PNG device to output the plot
png("plot3.png",480,480)

## Making 3 line plots
plot(df$DateTime ,df$Sub_metering_1,
     main = "",
     xlab="",
     ylab = "Energy sub metering",
     type = "l"
     )
lines(df$DateTime ,df$Sub_metering_2, col="red")
lines(df$DateTime ,df$Sub_metering_3, col="blue")

## Adding the legend
legend(
  "topright",
  legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
  lty = 1,
  col=c("black","red","blue")
  )

## Closing the device
dev.off()
