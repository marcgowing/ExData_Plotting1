# 1. Load the data
source("load_power_data.r")

# 2. Set the graphics device (output will be plotted to PNG file)
png("plot3.png", 480, 480, units = "px", bg = "transparent")

# 3. Plot the data, layer by layer
with(feb2007, plot(t, as.numeric(as.character(Sub_metering_1)), type = "l", col = 1, xlab = "", ylab = "Energy sub metering" ) )
with(feb2007, points(t, as.numeric(as.character(Sub_metering_2)), type = "l", col = 2 ) )
with(feb2007, points(t, as.numeric(as.character(Sub_metering_3)), type = "l", col = 4 ) )

# 4. Add the legend
legend("topright", pch = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

# 5. Close the PNG device
dev.off()