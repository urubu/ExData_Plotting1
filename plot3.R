# Only tested on Windows 7/64 bit, R 3.1.0/64 bit
# Run at your own risk!

# Check if dataframe 'plotData' is already present in the environment, 
# otherwise call script 'GetData.R'
if(!exists("plotData")) source("GetData.R")

# Set locale to display English weekday abbreviations on non-English systems
Sys.setlocale("LC_TIME", "English")

# Open PNG device
png("plot3.png")

# Draw plot
with(plotData, {
  plot(DateTime, Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering")
  lines(DateTime, Sub_metering_2, type="l", col="red")
  lines(DateTime, Sub_metering_3, type="l", col="blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

# Close PNG device
dev.off()