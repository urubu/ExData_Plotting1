# This file is invoked by the scripts 'plot [1-4].R' if no dataframe 
# called 'plotData' exists in the R environment.   
#
# Only tested on Windows 7/64 bit, R 3.1.0/64 bit
# Run at your own risk!

# Check if data file is present, if not check if zip is present
# If so, unzip the archive. If not, download zip archive first 
fileName <- "./data/household_power_consumption.txt"
if(!file.exists(fileName)) {
  # Check if zip archive is present, otherwise download it
  if(!file.exists("./data/household_power_consumption.zip")){
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    if ( .Platform$OS.type  %in% "unix" ) {
		download.file(fileURL, destfile = "./data/household_power_consumption.zip", method="curl")
		} else { 
		download.file(fileURL, destfile = "./data/household_power_consumption.zip")
	}
  }
  unzip("./data/household_power_consumption.zip", exdir="./data")
}

# Read data from file
plotData <- read.table(fileName,
                       sep=";",  
                       colClasses= c("character", "character", rep("numeric", 7)),
                       na.strings="?",
                       header=TRUE,  
                       stringsAsFactors=FALSE)
# dim(plotData) = 2075260 x 9

# Subset date range
plotData <- plotData[plotData$Date == "1/2/2007" | plotData$Date == "2/2/2007", ]
# dim(plotData) = 2880 x 9

# Combine date & time, convert to POSIXlt, rename, drop unnecessary variables
plotData$Date <- strptime(paste(plotData$Date, plotData$Time), "%d/%m/%Y %H:%M:%S")
names(plotData)[1]  <- "DateTime"
plotData <- plotData[ ,c(1,3:5,7:9)] # dim(plotData) = 2880 x 7