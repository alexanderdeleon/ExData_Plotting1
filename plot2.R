# Coursera Data Science Specialization
# Exploratory Data Analysis
# Project 1 - Plot 2
# Name: Alexander de Leon

# Load the dataset
HouseholdData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Convert the Date variable to Date class using as.Date() function
HouseholdData$Date <- as.Date(HouseholdData$Date, format = "%d/%m/%Y")

# Subset the dataset to the rows between 2007-02-01 and 2007-02-02
myData <- subset(HouseholdData, Date >= "2007-02-01" & Date <= "2007-02-02")

# Convert the Date and Time variables to Date/Time classes using the strptime() function
myData$datetime <- strptime(paste(myData$Date, myData$Time), "%Y-%m-%d %H:%M:%S")

# Create Plot 2
myData$datetime <- as.POSIXct(myData$datetime)
with(myData, plot(datetime, Global_active_power, type = "l", xlab = "",
                  ylab = "Global Active Power (kilowatts)"))

# Save plot 2 to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
