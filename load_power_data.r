# ---------------------------------------------------------------------
# 1. Load the data
# ---------------------------------------------------------------------

# To speed things up:
# If we've already saved a small subset of the data
# to a file ("feb2007_subset.RDS", which contains only data
# for 01/02/2007 - 02/02/2007)), load that instead
# of the very large! original .txt file.

library(data.table)

# Read file
if(file.exists("feb2007_subset.RDS"))
{
  power <- readRDS("feb2007_subset.RDS")
} else{
power <- fread("household_power_consumption.txt",
               sep = ";", header = TRUE,
               showProgress = FALSE, stringsAsFactors = FALSE, na.strings = c("?","") )

}
# Convert to data frame
power <- as.data.frame(power)

# ---------------------------------------------------
# 2. Subsetting the data
# ---------------------------------------------------

# Convert the Date variable to a Date class
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

# We will only be using data from the dates 2007-02-01 and 2007-02-02
startDate <- as.Date("1/2/2007", format = "%d/%m/%Y")
endDate <- as.Date("2/2/2007", format = "%d/%m/%Y")
feb2007 <- subset(power, (Date >= startDate & Date <= endDate) )

# Save this subset to a binary file, for quicker loading in future 
saveRDS(feb2007, "feb2007_subset.RDS")


# --------------------------------------------------
# 3. Getting Date and Times ready for plots 2 to 4
# --------------------------------------------------

# convert the Time variable to a Time data type
t <- strptime(feb2007$Time, format = "%H:%M:%S")

# t$mday: 1–31: day of the month
t$mday <- mday(feb2007$Date)

# t$mon: 0–11 months after the first of the year.
t$mon <- month(feb2007$Date) - 1

# t$year: years since 1900 (e.g. 1 means 1901, 2 means 1902, etc.)
t$year <- year(feb2007$Date) - 1900 


# ------------------------------------------------------------
# 4. Converting variable classes to appropriate types for plot 4
# ------------------------------------------------------------

feb2007$Voltage <- as.numeric(as.character(feb2007$Voltage))
feb2007$Global_active_power <- as.numeric(as.character(feb2007$Global_active_power)) 
feb2007$Sub_metering_1 <- as.numeric(as.character(feb2007$Sub_metering_1))
feb2007$Sub_metering_2 <- as.numeric(as.character(feb2007$Sub_metering_2))
feb2007$Sub_metering_3 <- as.numeric(as.character(feb2007$Sub_metering_3))


