
## Loading the data set from the processing step.
source("processing.R")
df <- processing()

## Creating the PNG device to output the plot
png("plot2.png",480,480)

## Making a line plot
plot(df$DateTime ,df$Global_active_power,
  main = "",
  xlab="",
  ylab = "Global Active Power (kilowatts)",
  type = "l")

## Closing the device
dev.off()
