# 1. Load the data
source("load_power_data.r")

# 2. Set the graphics device (output will be plotted to PNG file)
png("plot1.png", 480, 480, units = "px", bg = "transparent")

# 3. Plot the data
hist(feb2007$Global_active_power, col = 2,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)" )

# 4. Close the PNG device
dev.off()
