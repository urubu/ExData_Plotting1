# Only tested on Windows 7/64 bit, R 3.1.0/64 bit
# Run at your own risk!

# Check if dataframe 'plotData' is already present in the environment, 
# otherwise call script 'GetData.R'
if(!exists("plotData")) source("GetData.R")

# Open PNG device
png("plot2.png")

# Draw plot
plot(plotData$DateTime, plotData$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# Close PNG device
dev.off()