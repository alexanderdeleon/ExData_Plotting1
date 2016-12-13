# Coursera Data Science Specialization
# Exploratory Data Analysis
# Project 1 - Plot 3
# Name: Alexander de Leon

# Load the dataset
HouseholdData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Convert the Date variable to Date class using as.Date() function
HouseholdData$Date <- as.Date(HouseholdData$Date, format = "%d/%m/%Y")

# Subset the dataset to the rows between 2007-02-01 and 2007-02-02
myData <- subset(HouseholdData, Date >= "2007-02-01" & Date <= "2007-02-02")

# Convert the Date and Time variables to Date/Time classes using the strptime() function
myData$datetime <- strptime(paste(myData$Date, myData$Time), "%Y-%m-%d %H:%M:%S")

# Create Plot 3
myData$datetime <- as.POSIXct(myData$datetime)
with(myData, plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering",
                  type = "n"))
with(myData, lines(datetime, Sub_metering_1, col = "grey"))
with(myData, lines(datetime, Sub_metering_2, col = "red"))
with(myData, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("gray", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

# Save plot 3 to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
