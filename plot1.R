
## Loading the data set from the processing step.
source("processing.R")
df <- processing()

## Creating the PNG device to output the plot
png("plot1.png",480,480)

## Making an histogram plot
hist(
  df$Global_active_power,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)")

## Closing the device
dev.off()
