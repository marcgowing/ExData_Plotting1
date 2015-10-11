# 1. Load the data
source("load_power_data.r")

# 2. Set the graphics device (output will be plotted to PNG file)
png("plot4.png", 480, 480, units = "px", bg = "transparent")

# 3. Set up the subplots, 2 rows x 2 cols (also set margins)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

# 4. Plot the data
with(feb2007, {
  
  # subplot (1,1)
  plot(t, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  
  # subplot (1,2)
  plot(t, Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
  
  # subplot (2,1)
  plot(t, Sub_metering_1, type = "l", col = 1, xlab = "", ylab = "Energy sub metering" )
  points(t, Sub_metering_2, type = "l", col = 2 )
  points(t, Sub_metering_3, type = "l", col = 4 )
  legend("topright", pch = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
  
  # subplot (2,2)
  plot(t, as.numeric(as.character(Global_reactive_power)), type = "l", ylab = "Global_reactive_power", xlab = "datetime")
})

#5. Close the PNG device
dev.off()