# 1. Load the data
source("load_power_data.r")

# 2. Set the graphics device (output will be plotted to PNG file)
png("plot2.png", 480, 480, units = "px", bg = "transparent")

# 3. Plot the data
plot(t, feb2007$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

# 4. Close the PNG device
dev.off()