# Coursera Data Science Specialization
# Exploratory Data Analysis
# Project 1 - Plot 1
# Name: Alexander de Leon

# First we calculate a rough estimate of how much memory the dataset will require before
# reading into R.
# The dataset has 2,075,259 rows and 9 columns, most of which are numeric data. 
# 2,075,259 x 9 x 8 bytes/numeric data = 149,418,648 bytes = 149,418,648 / 2^20 bytes/MB =
# = 142.496 MB
# There is enough memory to load this dataset, memory is not an issue in this case. 

# Load the dataset
HouseholdData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Convert the Date variable to Date class using as.Date() function
HouseholdData$Date <- as.Date(HouseholdData$Date, format = "%d/%m/%Y")

# Subset the dataset to the rows between 2007-02-01 and 2007-02-02
myData <- subset(HouseholdData, Date >= "2007-02-01" & Date <= "2007-02-02")

# Convert the Date and Time variables to Date/Time classes using the strptime() function
myData$datetime <- strptime(paste(mydata$Date, mydata$Time), "%Y-%m-%d %H:%M:%S")

# Create Plot 1
with(myData, hist(Global_active_power, main = "Global Active Power", 
                  xlab = "Global Active Power (kilowatts)", col = "Red"))

# Save plot 1 to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
