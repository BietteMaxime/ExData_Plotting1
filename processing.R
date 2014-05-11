processing <- function()
{
  ## Setting up working directory.
  if(!file.exists("data")) dir.create("data")
  
  ## Downloading and extracting data.
  datasetTxtPath <- file.path("data","household_power_consumption.txt")
  if(!file.exists(datasetTxtPath))
  {
    datasetPath <- file.path("data","household_power_consumption.zip")
    datasetUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(datasetUrl,destfile=datasetPath)
    unzip(datasetPath,exdir="data")
    rm(datasetPath)
    rm(datasetUrl)
  }
  
  ## Reading dataset.
  # Reading header from first line.
  dfHeader <- read.csv(datasetTxtPath,sep=";",skip = 0, nrows = 1)
  variables.names <- names(dfHeader)
  rm(dfHeader)
  # Reading data from only 2007-02-01 and 2007-02-02.
  df <- read.csv(datasetTxtPath,header=FALSE,col.names=variables.names,na.strings="?",sep=";",skip = 66637, nrows = 2880)
  
  ## Cleaning formating.
  # Interpreting Dates ans Times
  df$Date <- as.Date(df$Date,format="%d/%m/%Y")
  df$DateTime <- strptime(paste(df$Date,df$Time), format="%Y-%m-%d %H:%M:%S")
  
  ## Returning
  df
}
